use proc_macro2::{Span, TokenStream};
use quote::{format_ident, quote, ToTokens};
use syn::{spanned::Spanned, Data, DataStruct, DeriveInput, Field, Ident, Result};

use crate::attr::{self, Context};

pub(crate) fn derive(input: &mut DeriveInput) -> Result<TokenStream> {
    let krate = &format_ident!("_portable_atomic_util");
    let private = &quote! { #krate::__private };
    let cx = Context::default();
    let items = match &input.data {
        Data::Struct(data) => extend_struct(cx, input, data, krate, private)?,
        Data::Enum(data) => extend_enum(cx, input, data, krate, private)?,
        Data::Union(data) => extend_union(cx, input, data, krate, private)?,
    };
    Ok(quote! {
        #[allow(
            non_upper_case_globals,
            clippy::match_single_binding,
            clippy::never_loop,
            clippy::single_match,
        )]
        const _: () = {
            extern crate portable_atomic_util as #krate;
            #items
        };
    })
}

fn extend_struct(
    cx: Context,
    input: &DeriveInput,
    data: &DataStruct,
    krate: &Ident,
    private: &TokenStream,
) -> Result<TokenStream> {
    let struct_attrs = &attr::parse_attrs(&cx, &input.attrs, attr::Position::Struct);
    let _field_attrs: &Vec<_> = &data
        .fields
        .iter()
        .map(|f| attr::parse_attrs(&cx, &f.attrs, attr::Position::from(&data.fields)))
        .collect();

    if data.fields.is_empty() {
        cx.error(format_err!(
            input.ident,
            "#[derive(Atomicable)] may not be used on struct with no field"
        ));
    }
    if data.fields.len() > 1 && struct_attrs.repr.is_none() {
        cx.error(format_err!(input.ident, "repr must be must specified"));
    }

    cx.check()?;

    // no user-specified repr & field=1 => transparent
    if struct_attrs.repr.is_none() && data.fields.len() == 1 {
        let name = &input.ident;
        let field = data.fields.iter().next().unwrap();
        let ty = &field.ty;
        let index = field_to_access((0, field));
        let msg = panic_msg(name);

        return Ok(quote! {
            impl #krate::Atomicable for #name {
                type Value = <#ty as #krate::Atomicable>::Value;
                #[inline]
                fn to_val(self) -> Self::Value {
                    <#ty as #krate::Atomicable>::to_val(self.#index)
                }
                fn from_val(_: Self::Value) -> Self {
                    panic!(#msg);
                }
                #[inline]
                unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                    Self {
                        #index: <#ty as #krate::Atomicable>::from_val_unchecked(val)
                    }
                }
            }
        });
    }

    let _known_types: Vec<_> = data.fields.iter().map(|f| known_type(&f.ty)).collect();

    let repr = struct_attrs.repr.unwrap();
    let repr_type = Ident::new(repr.0, repr.1).to_token_stream();

    let name = &input.ident;
    let msg = panic_msg(name);

    let field_types = data.fields.iter().map(|f| &f.ty).collect::<Vec<_>>();
    let field_repr_types = field_types
        .iter()
        .map(|ty| quote! { <#ty as #krate::Atomicable>::Value })
        .collect::<Vec<_>>();
    let accesses = data.fields.iter().enumerate().map(field_to_access).collect::<Vec<_>>();

    let increment_offset = field_repr_types
        .iter()
        .map(|field_repr_type| {
            quote! {
                __offset += #private::size_of::<#field_repr_type>();
            }
        })
        .collect::<Vec<_>>();
    let access_offset = field_types
        .iter()
        .enumerate()
        .map(|(i, _)| {
            if i == 0 {
                quote! {}
            } else {
                quote! { .add(__offset) }
            }
        })
        .collect::<Vec<_>>();

    let filled_size = quote! {
        #(#private::size_of::<#field_repr_types>())+*
    };
    let static_assert_repr_type_size = respan_tokens(
        quote! {
            #private::size_of::<#repr_type>() - (#filled_size)
        },
        repr_type.span(),
    );
    let static_asserts = quote! {
        // assert repr >= fields
        let _ = [(); #static_assert_repr_type_size];
    };
    // let debug_asserts = quote! {
    //     debug_assert_eq!(__offset, #filled_size);
    // };

    let to_val_writes = field_repr_types.iter().enumerate().map(|(i, field_repr_type)| {
        let access = &accesses[i];
        let increment_offset = &increment_offset[i];
        let add_offset = &access_offset[i];
        quote! {
            __result_ptr
                #add_offset
                .cast::<#field_repr_type>()
                .write_unaligned(#krate::Atomicable::to_val(self.#access));
            #increment_offset
        }
    });

    let mut from_val_reads = vec![];
    let mut from_val_field_vars = vec![];
    for (i, ty) in field_types.iter().enumerate() {
        let access = &accesses[i];
        let increment_offset = &increment_offset[i];
        let add_offset = &access_offset[i];
        let field_var = format_ident!("__field{}", i);
        from_val_reads.push(quote! {
            let #field_var = __val_ptr
                #add_offset
                .cast::<<#ty as #krate::Atomicable>::Value>().read_unaligned();
            let #field_var = <#ty as #krate::Atomicable>::from_val_unchecked(#field_var);
            #increment_offset
        });
        from_val_field_vars.push(quote! { #access: #field_var, });
    }

    Ok(quote! {
        impl #krate::Atomicable for #name {
            type Value = #repr_type;
            #[inline]
            fn to_val(self) -> Self::Value {
                #static_asserts
                let mut __result: #repr_type = 0;
                let mut __result_ptr: *mut u8 = &mut __result as *mut #repr_type as *mut u8;
                let mut __offset: usize = 0;
                unsafe {
                    #(#to_val_writes)*
                }
                // #debug_asserts
                __result
            }
            fn from_val(_: Self::Value) -> Self {
                panic!(#msg);
            }
            #[inline]
            unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                #static_asserts
                let mut __val_ptr: *const u8 = &val as *const #repr_type as *const u8;
                let mut __offset = 0;
                #(#from_val_reads)*
                // #debug_asserts
                Self {
                    #(#from_val_field_vars)*
                }
            }
        }
    })
}

fn extend_enum(
    cx: Context,
    input: &syn::DeriveInput,
    data: &syn::DataEnum,
    krate: &Ident,
    private: &TokenStream,
) -> Result<TokenStream> {
    let _enum_attrs = &attr::parse_attrs(&cx, &input.attrs, attr::Position::Enum);
    let _variant_attrs: &Vec<_> = &data
        .variants
        .iter()
        .map(|v| {
            let variant_attr = attr::parse_attrs(&cx, &input.attrs, attr::Position::Variant);
            let field_attrs = v
                .fields
                .iter()
                .map(|f| attr::parse_attrs(&cx, &f.attrs, attr::Position::from(&v.fields)))
                .collect::<Vec<_>>();
            (variant_attr, field_attrs)
        })
        .collect();

    if data.variants.is_empty() {
        cx.error(format_err!(
            input.ident,
            "#[derive(Atomicable)] may not be used on enum with no variant"
        ));
    }

    cx.check()?;

    unimplemented!()
}

fn extend_union(
    cx: Context,
    input: &syn::DeriveInput,
    data: &syn::DataUnion,
    krate: &Ident,
    private: &TokenStream,
) -> Result<TokenStream> {
    let _union_attrs = &attr::parse_attrs(&cx, &input.attrs, attr::Position::Union);
    data.fields
        .named
        .iter()
        .map(|f| attr::parse_attrs(&cx, &f.attrs, attr::Position::UnionField))
        .for_each(drop);

    if data.fields.named.is_empty() {
        cx.error(format_err!(
            input.ident,
            "#[derive(Atomicable)] may not be used on union with no field"
        ));
    }
    if data.fields.named.len() > 1 && !is_repr_c(&input.attrs) {
        cx.error(format_err!(
            input.ident,
            "portable-atomic: union with multiple fields must be #[repr(C)]"
        ));
    }

    cx.check()?;

    let name = &input.ident;
    let msg = panic_msg(name);

    // Case 1: The union has exactly one field.
    if data.fields.named.len() == 1 {
        let field = data.fields.named.iter().next().unwrap();
        let ty = &field.ty;
        let index = field_to_access((0, field));

        return Ok(quote! {
            impl #krate::Atomicable for #name {
                type Value = <#ty as #krate::Atomicable>::Value;
                #[inline]
                fn to_val(self) -> Self::Value {
                    // SAFETY: the union has exactly one field.
                    <#ty as #krate::Atomicable>::to_val(unsafe { self.#index })
                }
                fn from_val(_: Self::Value) -> Self {
                    panic!(#msg);
                }
                #[inline]
                unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                    Self {
                        #index: <#ty as #krate::Atomicable>::from_val_unchecked(val)
                    }
                }
            }
        });
    }

    let first_field = data.fields.named.iter().next().unwrap();
    let first_ty = &first_field.ty;

    let field_types = data.fields.named.iter().map(|f| &f.ty).collect::<Vec<_>>();
    // assert that all fields are Transmutable
    let static_asserts_transmutable = field_types.iter().map(|t| {
        quote! {
            #private::is_transmutable::<#t>();
        }
    });
    // assert that all fields have the same size
    let static_asserts_field_size = field_types.windows(2).map(|t| {
        let a = &t[0];
        let b = &t[1];
        quote! {
            let [] = [(); #private::size_of::<#a>() - #private::size_of::<#b>()];
        }
    });
    let static_asserts = quote! {
        #(#static_asserts_transmutable)*
        #(#static_asserts_field_size)*
    };

    Ok(quote! {
        impl #krate::Atomicable for #name {
            type Value = <#first_ty as #krate::Atomicable>::Value;
            #[inline]
            fn to_val(self) -> Self::Value {
                #static_asserts
                // SAFETY: the union is #[repr(C)] and all fields are `Transmutable` and have the same size.
                unsafe { #private::transmute(self) }
            }
            fn from_val(_: Self::Value) -> Self {
                panic!(#msg);
            }
            #[inline]
            unsafe fn from_val_unchecked(val: Self::Value) -> Self {
                #static_asserts
                // SAFETY: the union is #[repr(C)] and all fields are `Transmutable` and have the same size.
                unsafe { #private::transmute(val) }
            }
        }
    })
}

fn field_to_access((index, field): (usize, &Field)) -> TokenStream {
    match &field.ident {
        Some(ident) => ident.to_token_stream(),
        None => syn::Index::from(index).to_token_stream(),
    }
}

fn known_type(ty: &syn::Type) -> Option<KnownType> {
    if let syn::Type::Path(p) = ty {
        if let Some(name) = p.path.get_ident() {
            let name = name.to_string();
            match &*name {
                "i8" | "u8" | "bool" => return Some(KnownType::Scalar { name, size: Some(1) }),
                "i16" | "u16" => return Some(KnownType::Scalar { name, size: Some(2) }),
                "i32" | "u32" | "f32" | "char" => {
                    return Some(KnownType::Scalar { name, size: Some(4) })
                }
                "i64" | "u64" | "f64" => return Some(KnownType::Scalar { name, size: Some(8) }),
                "i128" | "u128" => return Some(KnownType::Scalar { name, size: Some(16) }),
                "isize" | "usize" => return Some(KnownType::Scalar { name, size: None }),
                _ => {}
            }
        }
    }
    // TODO: more types
    None
}

fn panic_msg(name: &Ident) -> String {
    format!("there is no way to call Atomicable::from_val for `{}` safely", name)
}

#[allow(dead_code)] // TODO
enum KnownType {
    Scalar { name: String, size: Option<usize> },
}

// fn is_option(ty: &Type) -> Option<&Type> {
//     if let Type::Path(ty) = ty {
//         if ty.path.segments.len() == 1 && ty.path.segments[0].ident == "Option"
//             || ty.path.segments.len() == 3
//                 && (ty.path.segments[0].ident == "std" || ty.path.segments[0].ident == "core")
//                 && ty.path.segments[1].ident == "option"
//                 && ty.path.segments[2].ident == "Option"
//         {
//             if let PathArguments::AngleBracketed(args) = &ty.path.segments.last().unwrap().arguments
//             {
//                 if let GenericArgument::Type(ty) = &args.args[0] {
//                     return Some(ty);
//                 }
//             }
//         }
//     }
//     None
// }

fn is_repr_c(attrs: &[syn::Attribute]) -> bool {
    for meta in attrs.iter().filter_map(|attr| attr.parse_meta().ok()) {
        if let syn::Meta::List(list) = meta {
            if list.path.is_ident("repr") {
                for repr in list.nested.iter() {
                    match repr {
                        syn::NestedMeta::Meta(syn::Meta::Path(path))
                        | syn::NestedMeta::Meta(syn::Meta::List(syn::MetaList { path, .. }))
                        | syn::NestedMeta::Meta(syn::Meta::NameValue(syn::MetaNameValue {
                            path,
                            ..
                        })) => {
                            if path.is_ident("C") {
                                return true;
                            }
                        }
                        syn::NestedMeta::Lit(..) => {}
                    }
                }
            }
        }
    }
    false
}

fn respan_tokens(tokens: TokenStream, span: Span) -> TokenStream {
    tokens
        .into_iter()
        .map(|mut token| {
            token.set_span(span);
            token
        })
        .collect()
}

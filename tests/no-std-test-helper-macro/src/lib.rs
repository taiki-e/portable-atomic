#![doc(test(
    no_crate_inject,
    attr(
        deny(warnings, rust_2018_idioms, single_use_lifetimes),
        allow(dead_code, unused_variables)
    )
))]
#![forbid(unsafe_code)]
#![warn(rust_2018_idioms, single_use_lifetimes, unreachable_pub)]
#![warn(clippy::pedantic)]

// older compilers require explicit `extern crate`.

#[allow(unused_extern_crates)]
extern crate proc_macro;

#[macro_use]
mod error;

use proc_macro2::TokenStream;
use quote::{quote, ToTokens};

#[proc_macro_attribute]
pub fn test(
    args: proc_macro::TokenStream,
    input: proc_macro::TokenStream,
) -> proc_macro::TokenStream {
    if !args.is_empty() {
        return format_err!(TokenStream::new(), "attribute must be of the form `#[test]`")
            .into_compile_error()
            .into();
    }
    let mut func = syn::parse_macro_input!(input as syn::ItemFn);

    let krate = quote! { ::no_std_test_helper };
    func.attrs.push(syn::parse_quote! { #[test_case] });
    let name = func.sig.ident.to_string();
    func.block.stmts.insert(0, syn::parse_quote! {{
        struct _C;
        let type_name = #krate::__private::core::any::type_name::<_C>();
        #krate::print!(
            "test {} ...",
            type_name.get(..type_name.len() - 4).unwrap_or(#name),
        );
    }});

    func.into_token_stream().into()
}

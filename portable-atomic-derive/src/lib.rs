#![doc(test(
    no_crate_inject,
    attr(
        deny(warnings, rust_2018_idioms, single_use_lifetimes),
        allow(dead_code, unused_variables)
    )
))]
#![warn(rust_2018_idioms, single_use_lifetimes, unreachable_pub)]
#![warn(clippy::pedantic)]
#![allow(clippy::too_many_lines, clippy::single_match_else)]
#![allow(dead_code, unused_variables, unused_macros)] // TODO

// older compilers require explicit `extern crate`.
#[allow(unused_extern_crates)]
extern crate proc_macro;

#[macro_use]
mod error;

mod attr;
mod derive;

use proc_macro::TokenStream;

/// # Structs
///
/// # Enums
///
/// # Unions
///
/// Unions that meet any of the following are supported:
///
/// - The union has exactly one field.
/// - The union is `#[repr(C)]`, and all fields are `Transmutable` and have the same size.
#[proc_macro_derive(Atomicable, attributes(atomic))]
pub fn atomicable_derive(input: TokenStream) -> TokenStream {
    let mut input = syn::parse_macro_input!(input as syn::DeriveInput);
    derive::derive(&mut input).unwrap_or_else(syn::Error::into_compile_error).into()
}

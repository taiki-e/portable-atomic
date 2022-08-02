use std::{cell::RefCell, fmt::Write as _, thread};

use proc_macro2::Span;
use syn::{spanned::Spanned, Error, Fields, Meta};

const ATTR_NAME: &str = "atomic";

static INTEGER_ATTRS: &[&str] =
    &["i8", "u8", "i16", "u16", "i32", "u32", "i64", "u64", "i128", "u128", "isize", "usize"];

// All #[atomic] attributes.
static ATTRS: &[AttrDef] = &[
    // #[atomic(i8)]
    AttrDef {
        name: "i8",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(u8)]
    AttrDef {
        name: "u8",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(i16)]
    AttrDef {
        name: "i16",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(u16)]
    AttrDef {
        name: "u16",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(i32)]
    AttrDef {
        name: "i32",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(u32)]
    AttrDef {
        name: "u32",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(i64)]
    AttrDef {
        name: "i64",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(u64)]
    AttrDef {
        name: "u64",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(i128)]
    AttrDef {
        name: "i128",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(u128)]
    AttrDef {
        name: "u128",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(isize)]
    AttrDef {
        name: "isize",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
    // #[atomic(usize)]
    AttrDef {
        name: "usize",
        conflicts_with: INTEGER_ATTRS,
        position: &[Position::Struct, Position::Enum],
        style: &[MetaStyle::Ident],
    },
];

#[derive(Debug)]
pub(crate) struct Attrs {
    pub(super) repr: Option<(&'static str, Span)>,
}

pub(crate) fn parse_attrs(cx: &Context, attrs: &[syn::Attribute], pos: Position) -> Attrs {
    let mut repr = None;

    let attrs = filter_attrs(cx, attrs, pos);
    for (def, meta) in &attrs {
        if def.late_check(cx, &attrs) {
            continue;
        }
        match def.name {
            "i8" | "u8" | "i16" | "u16" | "i32" | "u32" | "i64" | "u64" | "i128" | "u128"
            | "isize" | "usize" => repr = Some((def.name, meta.span())),

            _ => unreachable!("{}", def.name),
        }
    }

    Attrs { repr }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum Position {
    // TODO: kind: struct, tuple, or unit
    Struct,
    Enum,
    Union,
    // TODO: kind of variants: struct, tuple, or unit
    #[allow(dead_code)]
    Variant,
    NamedField,
    UnnamedField,
    UnionField,
}

impl Position {
    #[allow(clippy::trivially_copy_pass_by_ref)]
    fn as_str(&self) -> &'static str {
        match self {
            Position::Struct => "struct",
            Position::Enum => "enum",
            Position::Union => "union",
            Position::Variant => "variant",
            Position::NamedField => "named field",
            Position::UnnamedField => "unnamed field",
            Position::UnionField => "field",
        }
    }

    fn is_field(self) -> bool {
        self == Position::NamedField || self == Position::UnnamedField
    }
}

impl From<&Fields> for Position {
    fn from(meta: &Fields) -> Self {
        match meta {
            Fields::Named(..) => Position::NamedField,
            Fields::Unnamed(..) | Fields::Unit => Position::UnnamedField,
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub(crate) enum MetaStyle {
    // #[atomic(<name>)]
    Ident,
    // #[atomic(<name> = ...)]
    NamedValue,
    // #[atomic(<name>(...))]
    List,
}

impl MetaStyle {
    pub(crate) fn format(self, name: &str) -> String {
        match self {
            MetaStyle::Ident => name.to_owned(),
            MetaStyle::List => format!("{}(...)", name),
            MetaStyle::NamedValue => format!("{} = \"...\"", name),
        }
    }
}

impl From<&Meta> for MetaStyle {
    fn from(meta: &Meta) -> Self {
        match meta {
            Meta::Path(..) => MetaStyle::Ident,
            Meta::List(..) => MetaStyle::List,
            Meta::NameValue(..) => MetaStyle::NamedValue,
        }
    }
}

#[derive(Debug)]
struct AttrDef {
    name: &'static str,
    conflicts_with: &'static [&'static str],
    // allowed positions.
    position: &'static [Position],
    // allowed styles.
    style: &'static [MetaStyle],
}

impl AttrDef {
    /// Performs checks that can be performed without parsing other attributes,
    /// and returns `true` if at least one error occurs.
    fn early_check(&self, cx: &Context, pos: Position, meta: &Meta) -> bool {
        let mut has_error = false;
        if let Err(msg) = self.check_position(pos) {
            cx.error(format_err!(meta, msg));
            has_error = true;
        }
        if let Err(msg) = self.check_style(meta) {
            cx.error(format_err!(meta, msg));
            has_error = true;
        }
        has_error
    }

    fn check_position(&self, pos: Position) -> Result<(), String> {
        if self.position.contains(&pos) {
            return Ok(());
        }
        let mut msg = format!("#[{}({})] may only be used on ", ATTR_NAME, self.name);
        // TODO: simplify if possible
        // len == 1: a
        // len == 2: a and b
        // len > 2: a, b, and c
        let position = if self.position.contains(&Position::NamedField)
            && self.position.contains(&Position::UnnamedField)
        {
            let mut position: Vec<_> =
                self.position.iter().filter(|p| !p.is_field()).map(Position::as_str).collect();
            position.push("field");
            position
        } else {
            self.position.iter().map(Position::as_str).collect()
        };
        let len = position.len();
        for (i, p) in position.iter().enumerate() {
            if i != 0 {
                if len == 2 {
                    msg.push_str(" and ");
                } else {
                    msg.push_str(", ");
                    if i == len - 1 {
                        msg.push_str("and ");
                    }
                }
            }
            msg.push_str(p);
            msg.push('s');
        }
        Err(msg)
    }

    fn check_style(&self, meta: &Meta) -> Result<(), String> {
        let meta = MetaStyle::from(meta);
        if self.style.contains(&meta) {
            return Ok(());
        }
        let mut msg = "expected ".to_owned();
        let mut first = true;
        for style in self.style {
            if first {
                first = false;
            } else {
                msg.push_str(" or ");
            }
            let _ = write!(msg, "`#[{}({})]`", ATTR_NAME, style.format(self.name));
        }
        msg.push_str(", found ");
        let _ = write!(msg, "`#[{}({})]`", ATTR_NAME, meta.format(self.name));
        Err(msg)
    }

    /// Performs checks that can be performed after parsing all attributes in
    /// the same scope and parent scopes, and returns `true` if at least one
    /// error occurs.
    fn late_check(&self, cx: &Context, attrs: &[(&AttrDef, Meta)]) -> bool {
        let mut has_error = false;
        for (def, meta) in attrs {
            if def.name != self.name && self.conflicts_with.contains(&def.name) {
                let msg = format!(
                    "#[{0}({1})] may not be used together with #[{0}({2})]",
                    ATTR_NAME, self.name, def.name
                );
                cx.error(format_err!(meta.path(), msg));
                has_error = true;
            }
        }
        has_error
    }
}

#[derive(Debug)]
pub(crate) struct Context {
    // - `None`: during checking.
    // - `Some(None)`: there are no errors.
    // - `Some(Some)`: there are errors.
    #[allow(clippy::option_option)]
    error: RefCell<Option<Option<Error>>>,
}

impl Context {
    pub(crate) fn error(&self, e: Error) {
        match self.error.borrow_mut().as_mut().unwrap() {
            Some(base) => base.combine(e),
            error @ None => *error = Some(e),
        }
    }

    pub(crate) fn check(self) -> Result<(), Error> {
        match self.error.borrow_mut().take().unwrap() {
            Some(e) => Err(e),
            None => Ok(()),
        }
    }
}

impl Default for Context {
    fn default() -> Self {
        Self { error: RefCell::new(Some(None)) }
    }
}

impl Drop for Context {
    fn drop(&mut self) {
        if !thread::panicking() && self.error.borrow().is_some() {
            panic!("context need to be checked");
        }
    }
}

fn filter_attrs<'a>(
    cx: &'a Context,
    attrs: &'a [syn::Attribute],
    pos: Position,
) -> Vec<(&'static AttrDef, Meta)> {
    let mut counter = vec![0; ATTRS.len()];
    attrs
        .iter()
        .filter(|attr| attr.path.is_ident(ATTR_NAME))
        .filter_map(move |attr| match attr.parse_meta() {
            Ok(Meta::List(l)) => Some(l.nested),
            Ok(m) => {
                cx.error(format_err!(m, "expected `#[{}(...)]`", ATTR_NAME));
                None
            }
            Err(e) => {
                cx.error(e);
                None
            }
        })
        .flatten()
        .filter_map(move |m| match m {
            syn::NestedMeta::Lit(l) => {
                cx.error(format_err!(l, "expected identifier, found literal"));
                None
            }
            syn::NestedMeta::Meta(m) => match m.path().get_ident() {
                Some(p) => match ATTRS.iter().position(|a| p == a.name) {
                    Some(pos) => {
                        counter[pos] += 1;
                        if counter[pos] == 1 {
                            Some((&ATTRS[pos], m))
                        } else {
                            cx.error(format_err!(
                                &m,
                                "duplicate #[{}({})] attribute",
                                ATTR_NAME,
                                p
                            ));
                            None
                        }
                    }
                    None => {
                        cx.error(format_err!(p, "unknown {} attribute `{}`", ATTR_NAME, p));
                        None
                    }
                },
                None => {
                    cx.error(format_err!(m, "expected identifier, found path"));
                    None
                }
            },
        })
        .filter(|(def, meta)| !def.early_check(cx, pos, meta))
        .collect()
}

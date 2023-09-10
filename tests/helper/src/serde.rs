use std::fmt;

use serde::{Deserialize, Serialize};
pub use serde_test::*;

#[derive(Debug)]
pub struct DebugPartialEq<T>(pub T);

impl<T: fmt::Debug> PartialEq for DebugPartialEq<T> {
    fn eq(&self, other: &Self) -> bool {
        std::format!("{:?}", self) == std::format!("{:?}", other)
    }
}
impl<T: Serialize> Serialize for DebugPartialEq<T> {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::Serializer,
    {
        self.0.serialize(serializer)
    }
}
impl<'de, T: Deserialize<'de>> Deserialize<'de> for DebugPartialEq<T> {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: serde::Deserializer<'de>,
    {
        T::deserialize(deserializer).map(Self)
    }
}

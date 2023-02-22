use std::fmt;

use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
#[serde(transparent)]
pub struct DebugPartialEq<T>(pub T);

impl<T: fmt::Debug> PartialEq for DebugPartialEq<T> {
    fn eq(&self, other: &Self) -> bool {
        std::format!("{:?}", self) == std::format!("{:?}", other)
    }
}

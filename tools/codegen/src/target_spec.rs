use anyhow::Result;
use duct::cmd;
use serde::Deserialize;

use crate::file::workspace_root;

#[path = "gen/target_spec.rs"]
mod gen;
pub use gen::*;

pub(crate) fn target_spec_json(target: &str) -> Result<TargetSpec> {
    let spec_path = workspace_root().join("target-specs").join(target).with_extension("json");
    let target = if spec_path.exists() { spec_path.as_str() } else { target };
    Ok(serde_json::from_str(
        &cmd!("rustc", "-Z", "unstable-options", "--print", "target-spec-json", "--target", target)
            .read()?,
    )?)
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct TargetSpec {
    pub arch: TargetArch,
    #[serde(default)]
    pub env: TargetEnv,
    pub os: TargetOs,
    #[serde(default)]
    pub target_endian: TargetEndian,
    pub target_pointer_width: String,
    pub llvm_target: String,
}

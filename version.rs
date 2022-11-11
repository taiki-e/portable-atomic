use std::{env, process::Command, str};

pub(crate) struct Version {
    pub(crate) minor: u32,
    pub(crate) nightly: bool,
    commit_date: Date,
    pub(crate) llvm: u32,
}

impl Version {
    // The known latest stable version. If we unable to determine
    // the rustc version, we assume this is the current version.
    // It is no problem if this is older than the actual latest stable.
    pub(crate) const LATEST: Self = Self::stable(65);

    const fn stable(minor: u32) -> Self {
        Self { minor, nightly: false, commit_date: Date::new(0, 0, 0), llvm: 0 }
    }

    pub(crate) fn probe(&self, minor: u32, year: u16, month: u8, day: u8) -> bool {
        if self.nightly {
            self.minor > minor || self.commit_date >= Date::new(year, month, day)
        } else {
            self.minor >= minor
        }
    }
}

#[derive(PartialEq, Eq, PartialOrd, Ord)]
struct Date {
    year: u16,
    month: u8,
    day: u8,
}

impl Date {
    const fn new(year: u16, month: u8, day: u8) -> Self {
        Self { year, month, day }
    }
}

pub(crate) fn rustc_version() -> Option<Version> {
    let rustc = env::var_os("RUSTC")?;
    // Use verbose version output because the packagers add extra strings to the normal version output.
    let output = Command::new(rustc).args(&["--version", "--verbose"]).output().ok()?;
    let output = str::from_utf8(&output.stdout).ok()?;

    let mut release = output
        .lines()
        .find(|line| line.starts_with("release: "))
        .map(|line| &line["release: ".len()..])?
        .splitn(2, '-');
    let version = release.next().unwrap();
    let channel = release.next().unwrap_or_default();
    let mut digits = version.splitn(3, '.');
    let major = digits.next()?.parse::<u32>().ok()?;
    if major != 1 {
        return None;
    }
    let minor = digits.next()?.parse::<u32>().ok()?;
    let _patch = digits.next().unwrap_or("0").parse::<u32>().ok()?;
    let nightly = channel == "nightly" || channel == "dev";

    if nightly {
        let llvm_major = (|| {
            let version = output
                .lines()
                .find(|line| line.starts_with("LLVM version: "))
                .map(|line| &line["LLVM version: ".len()..])?;
            let mut digits = version.splitn(3, '.');
            let major = digits.next()?.parse::<u32>().ok()?;
            let _minor = digits.next()?.parse::<u32>().ok()?;
            let _patch = digits.next().unwrap_or("0").parse::<u32>().ok()?;
            Some(major)
        })();

        let mut commit_date = output
            .lines()
            .find(|line| line.starts_with("commit-date: "))
            .map(|line| &line["commit-date: ".len()..])?
            .splitn(3, '-');
        let year = commit_date.next()?.parse::<u16>().ok()?;
        let month = commit_date.next()?.parse::<u8>().ok()?;
        let day = commit_date.next()?.parse::<u8>().ok()?;
        if month > 12 || day > 31 {
            return None;
        }
        Some(Version {
            minor,
            nightly,
            commit_date: Date::new(year, month, day),
            llvm: llvm_major.unwrap_or(0),
        })
    } else {
        Some(Version::stable(minor))
    }
}

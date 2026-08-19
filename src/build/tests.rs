// SPDX-License-Identifier: Apache-2.0 OR MIT

use super::version::{Date, Version};

// test rustc version parsing code used in the build script.
#[test]
fn test_rustc_version() {
    // rustc 1.34 (rustup)
    let v = Version::parse(
        "rustc 1.34.2 (6c2484dc3 2019-05-13)
binary: rustc
commit-hash: 6c2484dc3c532c052f159264e970278d8b77cdc9
commit-date: 2019-05-13
host: x86_64-apple-darwin
release: 1.34.2
LLVM version: 8.0",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(34, 8));
    assert!(v.probe(33, 0, 0, 0));
    assert!(v.probe(34, 0, 0, 0));
    assert!(!v.probe(35, 0, 0, 0));

    // rustc 1.50 (rustup)
    let v = Version::parse(
        "rustc 1.50.0 (cb75ad5db 2021-02-10)
binary: rustc
commit-hash: cb75ad5db02783e8b0222fee363c5f63f7e2cf5b
commit-date: 2021-02-10
host: aarch64-unknown-linux-gnu
release: 1.50.0",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(50, 0));

    // rustc 1.67 (rustup)
    let v = Version::parse(
        "rustc 1.67.0 (fc594f156 2023-01-24)
binary: rustc
commit-hash: fc594f15669680fa70d255faec3ca3fb507c3405
commit-date: 2023-01-24
host: aarch64-apple-darwin
release: 1.67.0
LLVM version: 15.0.6",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(67, 15));

    // rustc 1.68-beta (rustup)
    let v = Version::parse(
        "rustc 1.68.0-beta.2 (10b73bf73 2023-02-01)
binary: rustc
commit-hash: 10b73bf73a6b770cd92ad8ff538173bc3298411c
commit-date: 2023-02-01
host: aarch64-apple-darwin
release: 1.68.0-beta.2
LLVM version: 15.0.6",
        None,
    )
    .unwrap();
    // We do not distinguish between stable and beta because we are only
    // interested in whether unstable features are potentially available.
    assert_eq!(v, Version::stable(68, 15));

    // rustc nightly-2019-01-27 (rustup)
    let v = Version::parse(
        "rustc 1.33.0-nightly (20c2cba61 2019-01-26)
binary: rustc
commit-hash: 20c2cba61dc83e612d25ed496025171caa3db30f
commit-date: 2019-01-26
host: x86_64-apple-darwin
release: 1.33.0-nightly
LLVM version: 8.0",
        None,
    )
    .unwrap();
    assert_eq!(v.minor, 33);
    assert!(v.nightly);
    assert_eq!(v.llvm, 8);
    assert_eq!(v.commit_date, Some(Date::new(2019, 1, 26)));
    assert!(v.probe(32, 0, 0, 0));
    assert!(v.probe(33, 2019, 1, 26));
    assert!(!v.probe(33, 2019, 1, 27));
    assert!(!v.probe(34, 0, 0, 0));

    // rustc 1.69-nightly (rustup)
    let v = Version::parse(
        "rustc 1.69.0-nightly (bd39bbb4b 2023-02-07)
binary: rustc
commit-hash: bd39bbb4bb92df439bf6d85470e296cc6a47ffbd
commit-date: 2023-02-07
host: aarch64-apple-darwin
release: 1.69.0-nightly
LLVM version: 15.0.7",
        None,
    )
    .unwrap();
    assert_eq!(v.minor, 69);
    assert!(v.nightly);
    assert_eq!(v.llvm, 15);
    assert_eq!(v.commit_date, Some(Date::new(2023, 2, 7)));

    // RUSTC_BOOTSTRAP=1 rustc 1.97.1 (rustup)
    let v = Version::parse(
        "rustc 1.97.1 (8bab26f4f 2026-07-14)
binary: rustc
commit-hash: 8bab26f4f68e0e26f0bb7960be334d5b520ea452
commit-date: 2026-07-14
host: aarch64-apple-darwin
release: 1.97.1
LLVM version: 22.1.6",
        Some(&"1".into()),
    )
    .unwrap();
    assert_eq!(v, Version::stable(97, 22));

    // RUSTC_BOOTSTRAP=-1 rustc 1.99-nightly (rustup)
    let v = Version::parse(
        "rustc 1.99.0-nightly (d453bdd8f 2026-08-14)
binary: rustc
commit-hash: d453bdd8f092d099bc336f0bda4163f809ad18e0
commit-date: 2026-08-14
host: aarch64-apple-darwin
release: 1.99.0-nightly
LLVM version: 23.1.0",
        Some(&"-1".into()),
    )
    .unwrap();
    assert_eq!(v.minor, 99);
    assert!(!v.nightly);
    assert_eq!(v.llvm, 23);
    assert_eq!(v.commit_date, Some(Date::new(2026, 8, 14)));

    // clippy-driver 1.69-nightly (rustup)
    let v = Version::parse(
        "rustc 1.69.0-nightly (bd39bbb4b 2023-02-07)
binary: rustc
commit-hash: bd39bbb4bb92df439bf6d85470e296cc6a47ffbd
commit-date: 2023-02-07
host: aarch64-apple-darwin
release: 1.69.0-nightly
LLVM version: 15.0.7",
        None,
    )
    .unwrap();
    assert_eq!(v.minor, 69);
    assert!(v.nightly);
    assert_eq!(v.llvm, 15);
    assert_eq!(v.commit_date, Some(Date::new(2023, 2, 7)));

    // rustc 1.69-dev (from source: ./x.py build)
    let v = Version::parse(
        "rustc 1.69.0-dev
binary: rustc
commit-hash: unknown
commit-date: unknown
host: aarch64-unknown-linux-gnu
release: 1.69.0-dev
LLVM version: 16.0.0",
        None,
    )
    .unwrap();
    assert_eq!(v.minor, 69);
    assert!(v.nightly);
    assert_eq!(v.llvm, 16);
    assert_eq!(v.commit_date, Some(Date::UNKNOWN));
    assert!(v.probe(68, 0, 0, 0));
    assert!(!v.probe(69, 2023, 2, 7));
    assert!(!v.probe(70, 0, 0, 0));

    // rustc 1.48 (debian 11: apt-get install cargo)
    let v = Version::parse(
        "rustc 1.48.0
binary: rustc
commit-hash: unknown
commit-date: unknown
host: aarch64-unknown-linux-gnu
release: 1.48.0
LLVM version: 11.0",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(48, 11));

    // rustc 1.67 (fedora: dnf install cargo)
    let v = Version::parse(
        "rustc 1.67.0 (fc594f156 2023-01-24) (Fedora 1.67.0-2.fc37)
binary: rustc
commit-hash: fc594f15669680fa70d255faec3ca3fb507c3405
commit-date: 2023-01-24
host: aarch64-unknown-linux-gnu
release: 1.67.0
LLVM version: 15.0.7",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(67, 15));

    // rustc 1.64 (alpine: apk add cargo)
    let v = Version::parse(
        "rustc 1.64.0
binary: rustc
commit-hash: unknown
commit-date: unknown
host: aarch64-alpine-linux-musl
release: 1.64.0
LLVM version: 15.0.3",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(64, 15));

    // odd or invalid cases
    let v = Version::parse(
        "rustc 1.99.0-nightly (d453bdd8f 2026-08-14)
commit-date: 2026-08-14
release: 1.99.0",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(99, 0));
    let v = Version::parse(
        "rustc 1.99.0-nightly (d453bdd8f 2026-08-14)
commit-date: 2026-08-14
release: 2.0.0-nightly
release: 1.99.0-nightly",
        None,
    );
    assert_eq!(v, None);
    let v = Version::parse(
        "rustc 1.99.0-nightly (d453bdd8f 2026-08-14)
commit-date: 2026-13-14
release: 1.99.0-nightly",
        None,
    )
    .unwrap();
    assert_eq!(v.minor, 99);
    assert!(v.nightly);
    assert_eq!(v.llvm, 0);
    assert_eq!(v.commit_date, Some(Date::UNKNOWN));
    let v = Version::parse(
        "rustc 1.99.0-nightly (d453bdd8f 2026-08-14)
commit-date: 2026-08-32
commit-date: 2026-08-31
release: 1.99.0-nightly",
        None,
    )
    .unwrap();
    assert_eq!(v.minor, 99);
    assert!(v.nightly);
    assert_eq!(v.llvm, 0);
    assert_eq!(v.commit_date, Some(Date::UNKNOWN));
    let v = Version::parse(
        "rustc 1.97.1 (8bab26f4f 2026-07-14)
release: 1.97.1
LLVM version: 22.1.6.0
LLVM version: 22.1.6",
        None,
    )
    .unwrap();
    assert_eq!(v, Version::stable(97, 0));
}

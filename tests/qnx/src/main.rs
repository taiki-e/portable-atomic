// SPDX-License-Identifier: Apache-2.0 OR MIT

#[cfg(all(
    target_arch = "aarch64",
    any(
        target_os = "qnx",
        all(
            target_os = "nto",
            any(target_env = "nto71", target_env = "nto71_iosock", target_env = "nto80"),
        ),
    ),
))]
fn main() {
    use portable_atomic::{AtomicU128, Ordering};

    extern "C" {
        fn portable_atomic_test_qnx_lse() -> u8;
    }

    // SAFETY: portable-atomic exports this symbol for QNX builds with the
    // qemu test cfg enabled by the CI job.
    let lse = unsafe { portable_atomic_test_qnx_lse() };
    assert!(lse <= 1);

    // Exercise the LSE/LL-SC run-time dispatch, not just the feature query.
    let atomic = AtomicU128::new(1);
    assert_eq!(atomic.compare_exchange(1, 2, Ordering::SeqCst, Ordering::SeqCst), Ok(1));
    assert_eq!(atomic.load(Ordering::SeqCst), 2);

    println!("all_lse={}", lse == 1);
    println!("test result: ok");
}

#[cfg(not(all(
    target_arch = "aarch64",
    any(
        target_os = "qnx",
        all(
            target_os = "nto",
            any(target_env = "nto71", target_env = "nto71_iosock", target_env = "nto80"),
        ),
    ),
)))]
fn main() {}

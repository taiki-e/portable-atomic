// SPDX-License-Identifier: Apache-2.0 OR MIT

// Adapted from https://github.com/crossbeam-rs/crossbeam/blob/crossbeam-utils-0.8.21/crossbeam-utils/src/backoff.rs.
// Adjusted to reduce spinning.
/// Performs exponential backoff in spin loops.
pub(crate) struct Backoff {
    step: u32,
}

// https://github.com/oneapi-src/oneTBB/blob/v2021.5.0/include/oneapi/tbb/detail/_utils.h#L46-L48
const SPIN_LIMIT: u32 = 4;

impl Backoff {
    #[inline]
    pub(crate) const fn new() -> Self {
        Self { step: 0 }
    }

    #[inline]
    pub(crate) fn snooze(&mut self) {
        if self.step <= SPIN_LIMIT {
            for _ in 0..1 << self.step {
                #[allow(deprecated)]
                core::sync::atomic::spin_loop_hint();
            }
            self.step += 1;
        } else {
            #[cfg(not(feature = "std"))]
            for _ in 0..1 << self.step {
                #[allow(deprecated)]
                core::sync::atomic::spin_loop_hint();
            }

            #[cfg(feature = "std")]
            std::thread::yield_now();
        }
    }
}

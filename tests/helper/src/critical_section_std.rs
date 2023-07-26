// Based on https://github.com/rust-embedded/critical-section/blob/v1.1.1/src/std.rs,
// but don't use `static mut` and compatible with Rust 1.56 that we run tests.

use std::{
    cell::{Cell, UnsafeCell},
    mem::MaybeUninit,
    sync::{Mutex, MutexGuard},
};

use crate::once_lock::OnceLock;

fn global_mutex() -> &'static Mutex<()> {
    static GLOBAL_MUTEX: OnceLock<Mutex<()>> = OnceLock::new();
    fn init() -> Mutex<()> {
        Mutex::new(())
    }
    GLOBAL_MUTEX.get_or_init(init)
}

// This is initialized if a thread has acquired the CS, uninitialized otherwise.
static GLOBAL_GUARD: SyncUnsafeCell<MaybeUninit<MutexGuard<'static, ()>>> =
    SyncUnsafeCell::new(MaybeUninit::uninit());

std::thread_local!(static IS_LOCKED: Cell<bool> = Cell::new(false));

struct StdCriticalSection;
critical_section::set_impl!(StdCriticalSection);

unsafe impl critical_section::Impl for StdCriticalSection {
    unsafe fn acquire() -> bool {
        // Allow reentrancy by checking thread local state
        IS_LOCKED.with(|l| {
            if l.get() {
                // CS already acquired in the current thread.
                return true;
            }

            // Note: it is fine to set this flag *before* acquiring the mutex because it's thread local.
            // No other thread can see its value, there's no potential for races.
            // This way, we hold the mutex for slightly less time.
            l.set(true);

            // Not acquired in the current thread, acquire it.
            let guard = match global_mutex().lock() {
                Ok(guard) => guard,
                Err(err) => {
                    // Ignore poison on the global mutex in case a panic occurred
                    // while the mutex was held.
                    err.into_inner()
                }
            };
            GLOBAL_GUARD.get().write(MaybeUninit::new(guard));

            false
        })
    }

    unsafe fn release(nested_cs: bool) {
        if !nested_cs {
            // SAFETY: As per the acquire/release safety contract, release can only be called
            // if the critical section is acquired in the current thread,
            // in which case we know the GLOBAL_GUARD is initialized.
            GLOBAL_GUARD.get().cast::<MutexGuard<'static, ()>>().drop_in_place();

            // Note: it is fine to clear this flag *after* releasing the mutex because it's thread local.
            // No other thread can see its value, there's no potential for races.
            // This way, we hold the mutex for slightly less time.
            IS_LOCKED.with(|l| l.set(false));
        }
    }
}

// See https://github.com/rust-lang/rust/issues/53639
// In our use case, the use of `static mut` should be sound but uses one with less foot guns.
#[repr(transparent)]
struct SyncUnsafeCell<T: ?Sized> {
    value: UnsafeCell<T>,
}
unsafe impl<T: ?Sized> Sync for SyncUnsafeCell<T> {}
impl<T> SyncUnsafeCell<T> {
    #[inline]
    const fn new(value: T) -> Self {
        Self { value: UnsafeCell::new(value) }
    }
    #[inline]
    const fn get(&self) -> *mut T {
        self.value.get()
    }
}

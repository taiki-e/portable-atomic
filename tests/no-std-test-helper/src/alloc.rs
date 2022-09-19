use core::{
    alloc::{GlobalAlloc, Layout},
    cell::UnsafeCell,
    mem::MaybeUninit,
    ptr::{self, NonNull},
    sync::atomic::Ordering,
};

use portable_atomic::AtomicBool;

use crate::arch::interrupt;

#[global_allocator]
static ALLOCATOR: Heap = Heap::empty();

#[inline(always)]
pub unsafe fn init() {
    const HEAP_SIZE: usize = 1024;
    static mut HEAP: [MaybeUninit<u8>; HEAP_SIZE] = [MaybeUninit::uninit(); HEAP_SIZE];
    unsafe { ALLOCATOR.init(HEAP.as_mut_ptr().cast::<u8>(), HEAP_SIZE) }
    // unsafe { ALLOCATOR.init(_heap_start as _, _heap_end - _heap_start) }
}
// extern "C" {
//     static mut _heap_start: usize;
//     static mut _heap_end: usize;
// }

#[inline(never)]
#[alloc_error_handler]
fn oom(_: Layout) -> ! {
    crate::exit(1)
}

pub struct Heap {
    heap: UnsafeCell<linked_list_allocator::Heap>,
    lock: Spinlock,
}

unsafe impl Sync for Heap {}

impl Heap {
    #[inline(always)]
    const fn empty() -> Self {
        Self { heap: UnsafeCell::new(linked_list_allocator::Heap::empty()), lock: Spinlock::new() }
    }

    #[inline(always)]
    unsafe fn init(&self, start_addr: *mut u8, size: usize) {
        let _guard = self.lock.lock();
        unsafe {
            (*self.heap.get()).init(start_addr, size);
        }
    }
}

unsafe impl GlobalAlloc for Heap {
    #[inline(always)]
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        println!("alloc:start");
        let ptr = {
            let _guard = self.lock.lock();
            (*self.heap.get())
                .allocate_first_fit(layout)
                .ok()
                .map_or(ptr::null_mut(), |allocation| allocation.as_ptr())
        };
        println!("alloc:end");

        ptr
    }

    #[inline(always)]
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        println!("dealloc:start");
        {
            let _guard = self.lock.lock();
            (*self.heap.get()).deallocate(NonNull::new_unchecked(ptr), layout);
        }
        println!("dealloc:end");
    }
}

struct Spinlock {
    locked: AtomicBool,
}

impl Spinlock {
    #[inline(always)]
    const fn new() -> Self {
        Self { locked: AtomicBool::new(false) }
    }

    #[inline(always)]
    fn lock(&self) -> SpinlockGuard<'_> {
        let interrupt = interrupt::disable();
        loop {
            if self
                .locked
                .compare_exchange_weak(false, true, Ordering::Acquire, Ordering::Relaxed)
                .is_ok()
            {
                return SpinlockGuard { lock: self, interrupt };
            }

            while self.locked.load(Ordering::Relaxed) {
                core::hint::spin_loop();
            }
        }
    }
}

#[must_use]
struct SpinlockGuard<'a> {
    lock: &'a Spinlock,
    interrupt: interrupt::State,
}

impl Drop for SpinlockGuard<'_> {
    #[inline(always)]
    fn drop(&mut self) {
        self.lock.locked.store(false, Ordering::Release);
        unsafe { interrupt::restore(self.interrupt) }
    }
}

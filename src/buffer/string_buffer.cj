package maa.buffer

import maa.ffi.*

public class StringBuffer <: ToString {
    private var handle: CPointer<MaaStringBuffer>
    private var ownsHandle: Bool

    public init() {
        this.handle = unsafe { MaaStringBufferCreate_wrap() }
        this.ownsHandle = true
    }

    public init(handle: CPointer<MaaStringBuffer>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            unsafe { MaaStringBufferDestroy_wrap(this.handle) }
            this.handle = CPointer<MaaStringBuffer>()
        }
    }

    public func get(): String {
        if (this.handle.isNull()) {
            return ""
        }
        let cstr = unsafe { MaaStringBufferGet_wrap(this.handle) }
        return cstr.toString()
    }

    public func set(val: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cstr = LibC.mallocCString(val)
            let ret = MaaStringBufferSet_wrap(this.handle, cstr)
            LibC.free(cstr)
            return ret != 0
        }
    }

    public func clear(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaStringBufferClear_wrap(this.handle) != 0 }
    }

    public func isEmpty(): Bool {
        if (this.handle.isNull()) {
            return true
        }
        return unsafe { MaaStringBufferIsEmpty_wrap(this.handle) != 0 }
    }

    public func size(): UInt64 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaStringBufferSize_wrap(this.handle) }
    }

    public func raw(): CPointer<MaaStringBuffer> {
        return this.handle
    }

    public func toString(): String {
        return this.get()
    }
}

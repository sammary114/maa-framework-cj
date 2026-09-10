package maa.buffer

import maa.ffi.*
import std.collection.*

public class StringListBuffer {
    private var handle: CPointer<MaaStringListBuffer>
    private var ownsHandle: Bool

    public init() {
        this.handle = unsafe { MaaStringListBufferCreate_wrap() }
        this.ownsHandle = true
    }

    public init(handle: CPointer<MaaStringListBuffer>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            unsafe { MaaStringListBufferDestroy_wrap(this.handle) }
            this.handle = CPointer<MaaStringListBuffer>()
        }
    }

    public func size(): UInt64 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaStringListBufferSize_wrap(this.handle) }
    }

    public func isEmpty(): Bool {
        if (this.handle.isNull()) {
            return true
        }
        return unsafe { MaaStringListBufferIsEmpty_wrap(this.handle) != 0 }
    }

    public func get(index: UInt64): String {
        if (this.handle.isNull() || index >= this.size()) {
            return ""
        }
        let strBufPtr = unsafe { MaaStringListBufferAt_wrap(this.handle, index) }
        if (strBufPtr.isNull()) {
            return ""
        }
        let cstr = unsafe { MaaStringBufferGet_wrap(strBufPtr) }
        return cstr.toString()
    }

    public func append(str: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        let tempBuf = StringBuffer()
        tempBuf.set(str)
        let res = unsafe { MaaStringListBufferAppend_wrap(this.handle, tempBuf.raw()) != 0 }
        tempBuf.destroy()
        return res
    }

    public func remove(index: UInt64): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaStringListBufferRemove_wrap(this.handle, index) != 0 }
    }

    public func clear(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaStringListBufferClear_wrap(this.handle) != 0 }
    }

    public func toArray(): Array<String> {
        let count = this.size()
        let result = ArrayList<String>()
        for (i in 0..count) {
            result.add(this.get(i))
        }
        return result.toArray()
    }

    public func raw(): CPointer<MaaStringListBuffer> {
        return this.handle
    }
}

package maa.buffer

import maa.ffi.*
import std.collection.*

public class ImageBuffer {
    private var handle: CPointer<MaaImageBuffer>
    private var ownsHandle: Bool

    public init() {
        this.handle = unsafe { MaaImageBufferCreate_wrap() }
        this.ownsHandle = true
    }

    public init(handle: CPointer<MaaImageBuffer>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            unsafe { MaaImageBufferDestroy_wrap(this.handle) }
            this.handle = CPointer<MaaImageBuffer>()
        }
    }

    public func isEmpty(): Bool {
        if (this.handle.isNull()) {
            return true
        }
        return unsafe { MaaImageBufferIsEmpty_wrap(this.handle) != 0 }
    }

    public func clear(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaImageBufferClear_wrap(this.handle) != 0 }
    }

    public func width(): Int32 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaImageBufferWidth_wrap(this.handle) }
    }

    public func height(): Int32 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaImageBufferHeight_wrap(this.handle) }
    }

    public func channels(): Int32 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaImageBufferChannels_wrap(this.handle) }
    }

    public func type_(): Int32 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaImageBufferType_wrap(this.handle) }
    }

    public func resize(width: Int32, height: Int32): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaImageBufferResize_wrap(this.handle, width, height) != 0 }
    }

    public func getEncodedSize(): UInt64 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaImageBufferGetEncodedSize_wrap(this.handle) }
    }

    public func raw(): CPointer<MaaImageBuffer> {
        return this.handle
    }
}

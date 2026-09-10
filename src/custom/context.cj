package maa.custom

import maa.ffi.*
import maa.types.*
import maa.buffer.*

public class Context {
    private var handle: CPointer<MaaContext>
    private var ownsHandle: Bool

    public init(handle: CPointer<MaaContext>, ownsHandle!: Bool = false) {
        this.handle = handle
        this.ownsHandle = ownsHandle
    }

    public func runTask(entry: String, pipelineOverride!: String = ""): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        unsafe {
            let cEntry = LibC.mallocCString(entry)
            let cOverride = LibC.mallocCString(pipelineOverride)
            let res = MaaContextRunTask_wrap(this.handle, cEntry, cOverride)
            LibC.free(cEntry)
            LibC.free(cOverride)
            return res
        }
    }

    public func runRecognition(entry: String, image: ImageBuffer, pipelineOverride!: String = ""): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        unsafe {
            let cEntry = LibC.mallocCString(entry)
            let cOverride = LibC.mallocCString(pipelineOverride)
            let res = MaaContextRunRecognition_wrap(this.handle, cEntry, cOverride, image.raw())
            LibC.free(cEntry)
            LibC.free(cOverride)
            return res
        }
    }

    public func runAction(entry: String, box: Rect, recoDetail: String, pipelineOverride!: String = ""): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        var cBox = box.toC()
        unsafe {
            let cEntry = LibC.mallocCString(entry)
            let cOverride = LibC.mallocCString(pipelineOverride)
            let cDetail = LibC.mallocCString(recoDetail)
            let arr = [cBox]
            let rawHandle = acquireArrayRawData(arr)
            let res = MaaContextRunAction_wrap(this.handle, cEntry, cOverride, rawHandle.pointer, cDetail)
            releaseArrayRawData(rawHandle)
            LibC.free(cEntry)
            LibC.free(cOverride)
            LibC.free(cDetail)
            return res
        }
    }

    public func overridePipeline(pipelineOverride: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cOverride = LibC.mallocCString(pipelineOverride)
            let res = MaaContextOverridePipeline_wrap(this.handle, cOverride) != 0
            LibC.free(cOverride)
            return res
        }
    }

    public func overrideImage(imageName: String, image: ImageBuffer): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cName = LibC.mallocCString(imageName)
            let res = MaaContextOverrideImage_wrap(this.handle, cName, image.raw()) != 0
            LibC.free(cName)
            return res
        }
    }

    public func getNodeData(nodeName: String): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe {
            let cName = LibC.mallocCString(nodeName)
            let res = MaaContextGetNodeData_wrap(this.handle, cName, buf.raw()) != 0
            LibC.free(cName)
            res
        }
        let result = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return result
    }

    public func getTaskId(): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        return unsafe { MaaContextGetTaskId_wrap(this.handle) }
    }

    public func clone(): Context {
        if (this.handle.isNull()) {
            return Context(CPointer<MaaContext>(), ownsHandle: false)
        }
        let newHandle = unsafe { MaaContextClone_wrap(this.handle) }
        return Context(newHandle, ownsHandle: true)
    }

    public func raw(): CPointer<MaaContext> {
        return this.handle
    }
}

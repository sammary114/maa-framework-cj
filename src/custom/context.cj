package maa.custom

import maa.ffi.*
import maa.ffi.MaaTasker as CMaaTasker
import maa.types.*
import maa.buffer.*
import maa.core.*

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
            let overrideStr = if (pipelineOverride.isEmpty()) { "{}" } else { pipelineOverride }
            let cOverride = LibC.mallocCString(overrideStr)
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
            let overrideStr = if (pipelineOverride.isEmpty()) { "{}" } else { pipelineOverride }
            let cOverride = LibC.mallocCString(overrideStr)
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
            let overrideStr = if (pipelineOverride.isEmpty()) { "{}" } else { pipelineOverride }
            let cOverride = LibC.mallocCString(overrideStr)
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

    public func getTasker(): Tasker {
        if (this.handle.isNull()) {
            return Tasker(CPointer<CMaaTasker>(), ownsHandle: false)
        }
        let ptr = unsafe { MaaContextGetTasker_wrap(this.handle) }
        return Tasker(ptr, ownsHandle: false)
    }

    public func runRecognitionDirect(recoType: String, recoParam: String, image: ImageBuffer): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        unsafe {
            let cType = LibC.mallocCString(recoType)
            let cParam = LibC.mallocCString(recoParam)
            let id = MaaContextRunRecognitionDirect_wrap(this.handle, cType, cParam, image.raw())
            LibC.free(cType)
            LibC.free(cParam)
            return id
        }
    }

    public func runActionDirect(actionType: String, actionParam: String, box: Rect, recoDetail: String): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        unsafe {
            let cType = LibC.mallocCString(actionType)
            let cParam = LibC.mallocCString(actionParam)
            let cDetail = LibC.mallocCString(recoDetail)
            var cBox = box.toC()
            let arr = [cBox]
            let rawHandle = acquireArrayRawData(arr)
            let id = MaaContextRunActionDirect_wrap(this.handle, cType, cParam, rawHandle.pointer, cDetail)
            releaseArrayRawData(rawHandle)
            LibC.free(cType)
            LibC.free(cParam)
            LibC.free(cDetail)
            return id
        }
    }

    public func waitFreezes(time: UInt64, box: Rect, param!: String = "{}"): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            var cBox = box.toC()
            let arr = [cBox]
            let rawHandle = acquireArrayRawData(arr)
            let cParam = LibC.mallocCString(param)
            let ret = MaaContextWaitFreezes_wrap(this.handle, time, rawHandle.pointer, cParam) != 0
            LibC.free(cParam)
            releaseArrayRawData(rawHandle)
            return ret
        }
    }

    public func overrideNext(nodeName: String, nextList: Array<String>): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cNode = LibC.mallocCString(nodeName)
            let listBuf = StringListBuffer()
            for (item in nextList) {
                listBuf.append(item)
            }
            let ret = MaaContextOverrideNext_wrap(this.handle, cNode, listBuf.raw()) != 0
            LibC.free(cNode)
            listBuf.destroy()
            return ret
        }
    }

    public func setAnchor(anchorName: String, nodeName: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cAnchor = LibC.mallocCString(anchorName)
            let cNode = LibC.mallocCString(nodeName)
            let ret = MaaContextSetAnchor_wrap(this.handle, cAnchor, cNode) != 0
            LibC.free(cAnchor)
            LibC.free(cNode)
            return ret
        }
    }

    public func getAnchor(anchorName: String): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe {
            let cAnchor = LibC.mallocCString(anchorName)
            let ret = MaaContextGetAnchor_wrap(this.handle, cAnchor, buf.raw()) != 0
            LibC.free(cAnchor)
            ret
        }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func getHitCount(nodeName: String): UInt64 {
        if (this.handle.isNull()) {
            return 0
        }
        let countArr: Array<UInt64> = [0]
        unsafe {
            let cNode = LibC.mallocCString(nodeName)
            let rawData = acquireArrayRawData(countArr)
            MaaContextGetHitCount_wrap(this.handle, cNode, rawData.pointer)
            releaseArrayRawData(rawData)
            LibC.free(cNode)
        }
        return countArr[0]
    }

    public func clearHitCount(nodeName: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cNode = LibC.mallocCString(nodeName)
            let ret = MaaContextClearHitCount_wrap(this.handle, cNode) != 0
            LibC.free(cNode)
            return ret
        }
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

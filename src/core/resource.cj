package maa.core

import maa.ffi.*
import maa.ffi.MaaResource as CMaaResource
import maa.types.*
import maa.buffer.*
import maa.job.*

public type Resource = MaaResource

public class MaaResource {
    private var handle: CPointer<CMaaResource>
    private var ownsHandle: Bool

    public init() {
        this.handle = unsafe { MaaResourceCreate_wrap() }
        this.ownsHandle = true
    }

    public init(handle: CPointer<CMaaResource>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            unsafe { MaaResourceDestroy_wrap(this.handle) }
            this.handle = CPointer<CMaaResource>()
        }
    }

    public func postPath(path: String): ResJob {
        return this.postBundle(path)
    }

    public func postBundle(path: String): ResJob {
        if (this.handle.isNull()) {
            return ResJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(path)
            let resId = MaaResourcePostBundle_wrap(this.handle, cstr)
            LibC.free(cstr)
            resId
        }
        return ResJob(this.handle, id)
    }

    public func postPipeline(path: String): ResJob {
        if (this.handle.isNull()) {
            return ResJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(path)
            let resId = MaaResourcePostPipeline_wrap(this.handle, cstr)
            LibC.free(cstr)
            resId
        }
        return ResJob(this.handle, id)
    }

    public func postOcrModel(path: String): ResJob {
        if (this.handle.isNull()) {
            return ResJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(path)
            let resId = MaaResourcePostOcrModel_wrap(this.handle, cstr)
            LibC.free(cstr)
            resId
        }
        return ResJob(this.handle, id)
    }

    public func postImage(path: String): ResJob {
        if (this.handle.isNull()) {
            return ResJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(path)
            let resId = MaaResourcePostImage_wrap(this.handle, cstr)
            LibC.free(cstr)
            resId
        }
        return ResJob(this.handle, id)
    }

    public func loaded(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaResourceLoaded_wrap(this.handle) != 0 }
    }

    public func clear(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaResourceClear_wrap(this.handle) != 0 }
    }

    public func getHash(): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe { MaaResourceGetHash_wrap(this.handle, buf.raw()) != 0 }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func getNodeList(): Array<String> {
        if (this.handle.isNull()) {
            return Array<String>()
        }
        let listBuf = StringListBuffer()
        let ok = unsafe { MaaResourceGetNodeList_wrap(this.handle, listBuf.raw()) != 0 }
        let res = if (ok) { listBuf.toArray() } else { Array<String>() }
        listBuf.destroy()
        return res
    }

    public func getCustomRecognitionList(): Array<String> {
        if (this.handle.isNull()) {
            return Array<String>()
        }
        let listBuf = StringListBuffer()
        let ok = unsafe { MaaResourceGetCustomRecognitionList_wrap(this.handle, listBuf.raw()) != 0 }
        let res = if (ok) { listBuf.toArray() } else { Array<String>() }
        listBuf.destroy()
        return res
    }

    public func getCustomActionList(): Array<String> {
        if (this.handle.isNull()) {
            return Array<String>()
        }
        let listBuf = StringListBuffer()
        let ok = unsafe { MaaResourceGetCustomActionList_wrap(this.handle, listBuf.raw()) != 0 }
        let res = if (ok) { listBuf.toArray() } else { Array<String>() }
        listBuf.destroy()
        return res
    }

    public func overridePipeline(pipelineOverride: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cstr = LibC.mallocCString(pipelineOverride)
            let ret = MaaResourceOverridePipeline_wrap(this.handle, cstr) != 0
            LibC.free(cstr)
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
            let ret = MaaResourceOverrideNext_wrap(this.handle, cNode, listBuf.raw()) != 0
            LibC.free(cNode)
            listBuf.destroy()
            return ret
        }
    }

    public func overrideImage(imageName: String, image: ImageBuffer): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cName = LibC.mallocCString(imageName)
            let ret = MaaResourceOverrideImage_wrap(this.handle, cName, image.raw()) != 0
            LibC.free(cName)
            return ret
        }
    }

    public func getNodeData(nodeName: String): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe {
            let cNode = LibC.mallocCString(nodeName)
            let ret = MaaResourceGetNodeData_wrap(this.handle, cNode, buf.raw()) != 0
            LibC.free(cNode)
            ret
        }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func getDefaultRecognitionParam(recoType: String): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe {
            let cType = LibC.mallocCString(recoType)
            let ret = MaaResourceGetDefaultRecognitionParam_wrap(this.handle, cType, buf.raw()) != 0
            LibC.free(cType)
            ret
        }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func getDefaultActionParam(actionType: String): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe {
            let cType = LibC.mallocCString(actionType)
            let ret = MaaResourceGetDefaultActionParam_wrap(this.handle, cType, buf.raw()) != 0
            LibC.free(cType)
            ret
        }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func raw(): CPointer<CMaaResource> {
        return this.handle
    }
}

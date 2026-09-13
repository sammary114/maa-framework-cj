package maa.core

import maa.ffi.*
import maa.ffi.MaaTasker as CMaaTasker
import maa.ffi.MaaResource as CMaaResource
import maa.ffi.MaaController as CMaaController
import maa.types.*
import maa.buffer.*
import maa.job.*
import maa.pipeline.*
import std.collection.ArrayList
import std.collection.HashMap

public type MaaTasker = Tasker

public class Tasker {
    private var handle: CPointer<CMaaTasker>
    private var ownsHandle: Bool
    private var boundResource: Option<MaaResource>
    private var boundController: Option<Controller>
    private var sinks: HashMap<Int64, (Int64, CPointer<Int64>)>
    private var contextSinks: HashMap<Int64, (Int64, CPointer<Int64>)>

    public init() {
        this.handle = unsafe { MaaTaskerCreate_wrap() }
        this.ownsHandle = true
        this.boundResource = None
        this.boundController = None
        this.sinks = HashMap<Int64, (Int64, CPointer<Int64>)>()
        this.contextSinks = HashMap<Int64, (Int64, CPointer<Int64>)>()
    }

    public init(handle: CPointer<CMaaTasker>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
        this.boundResource = None
        this.boundController = None
        this.sinks = HashMap<Int64, (Int64, CPointer<Int64>)>()
        this.contextSinks = HashMap<Int64, (Int64, CPointer<Int64>)>()
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            this.clearSinks()
            this.clearContextSinks()
            unsafe { MaaTaskerDestroy_wrap(this.handle) }
            this.handle = CPointer<CMaaTasker>()
        }
        this.boundResource = None
        this.boundController = None
    }

    public func addSink(sink: EventCallback): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        let (id, tokenPtr) = SinkManager.register(sink)
        let sinkId = unsafe {
            MaaTaskerAddSink_wrap(this.handle, globalEventCallbackDispatcher, CPointer<Unit>(tokenPtr))
        }
        if (sinkId == 0) {
            SinkManager.unregister(id, tokenPtr)
            return 0
        }
        this.sinks[sinkId] = (id, tokenPtr)
        return sinkId
    }

    public func removeSink(sinkId: Int64): Unit {
        if (this.handle.isNull()) {
            return
        }
        unsafe { MaaTaskerRemoveSink_wrap(this.handle, sinkId) }
        match (this.sinks.remove(sinkId)) {
            case Some((id, tokenPtr)) => SinkManager.unregister(id, tokenPtr)
            case None => ()
        }
    }

    public func clearSinks(): Unit {
        if (this.handle.isNull()) {
            return
        }
        unsafe { MaaTaskerClearSinks_wrap(this.handle) }
        for ((_, (id, tokenPtr)) in this.sinks) {
            SinkManager.unregister(id, tokenPtr)
        }
        this.sinks.clear()
    }

    public func addContextSink(sink: EventCallback): Int64 {
        if (this.handle.isNull()) {
            return 0
        }
        let (id, tokenPtr) = SinkManager.register(sink)
        let sinkId = unsafe {
            MaaTaskerAddContextSink_wrap(this.handle, globalEventCallbackDispatcher, CPointer<Unit>(tokenPtr))
        }
        if (sinkId == 0) {
            SinkManager.unregister(id, tokenPtr)
            return 0
        }
        this.contextSinks[sinkId] = (id, tokenPtr)
        return sinkId
    }

    public func removeContextSink(sinkId: Int64): Unit {
        if (this.handle.isNull()) {
            return
        }
        unsafe { MaaTaskerRemoveContextSink_wrap(this.handle, sinkId) }
        match (this.contextSinks.remove(sinkId)) {
            case Some((id, tokenPtr)) => SinkManager.unregister(id, tokenPtr)
            case None => ()
        }
    }

    public func clearContextSinks(): Unit {
        if (this.handle.isNull()) {
            return
        }
        unsafe { MaaTaskerClearContextSinks_wrap(this.handle) }
        for ((_, (id, tokenPtr)) in this.contextSinks) {
            SinkManager.unregister(id, tokenPtr)
        }
        this.contextSinks.clear()
    }

    public func on(event: String, callback: (details: String) -> Unit): Int64 {
        return this.addSink { msg, details =>
            if (msg == event) {
                callback(details)
            }
        }
    }

    public func onTaskStarting(callback: (details: String) -> Unit): Int64 {
        return this.on(MaaMsg.TaskerTaskStarting, callback)
    }

    public func onTaskSucceeded(callback: (details: String) -> Unit): Int64 {
        return this.on(MaaMsg.TaskerTaskSucceeded, callback)
    }

    public func onTaskFailed(callback: (details: String) -> Unit): Int64 {
        return this.on(MaaMsg.TaskerTaskFailed, callback)
    }

    public func onNodeStarting(callback: (details: String) -> Unit): Int64 {
        return this.on(MaaMsg.NodePipelineNodeStarting, callback)
    }

    public func onNodeSucceeded(callback: (details: String) -> Unit): Int64 {
        return this.on(MaaMsg.NodePipelineNodeSucceeded, callback)
    }

    public func onNodeFailed(callback: (details: String) -> Unit): Int64 {
        return this.on(MaaMsg.NodePipelineNodeFailed, callback)
    }

    public func bind(res: MaaResource): Bool {
        if (this.handle.isNull()) {
            return false
        }
        this.boundResource = Some(res)
        return unsafe { MaaTaskerBindResource_wrap(this.handle, res.raw()) != 0 }
    }

    public func bind(ctrl: Controller): Bool {
        if (this.handle.isNull()) {
            return false
        }
        this.boundController = Some(ctrl)
        return unsafe { MaaTaskerBindController_wrap(this.handle, ctrl.raw()) != 0 }
    }

    public func inited(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaTaskerInited_wrap(this.handle) != 0 }
    }

    public func postTask(entry: String, pipelineOverride!: String = ""): TaskJob {
        if (this.handle.isNull()) {
            return TaskJob(this.handle, 0)
        }
        let id = unsafe {
            let cEntry = LibC.mallocCString(entry)
            let overrideStr = if (pipelineOverride.isEmpty()) { "{}" } else { pipelineOverride }
            let cOverride = LibC.mallocCString(overrideStr)
            let taskId = MaaTaskerPostTask_wrap(this.handle, cEntry, cOverride)
            LibC.free(cEntry)
            LibC.free(cOverride)
            taskId
        }
        return TaskJob(this.handle, id)
    }

    public func postTask(entry: String, pipeline: Pipeline): TaskJob {
        return this.postTask(entry, pipelineOverride: pipeline.toJson())
    }

    public func postStop(): TaskJob {
        if (this.handle.isNull()) {
            return TaskJob(this.handle, 0)
        }
        let id = unsafe { MaaTaskerPostStop_wrap(this.handle) }
        return TaskJob(this.handle, id)
    }

    public func running(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaTaskerRunning_wrap(this.handle) != 0 }
    }

    public func stopping(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaTaskerStopping_wrap(this.handle) != 0 }
    }

    public func status(taskId: Int64): Status {
        if (this.handle.isNull()) {
            return Status.Invalid
        }
        let st = unsafe { MaaTaskerStatus_wrap(this.handle, taskId) }
        return Status.fromC(st)
    }

    public func wait(taskId: Int64): Status {
        if (this.handle.isNull()) {
            return Status.Invalid
        }
        let st = unsafe { MaaTaskerWait_wrap(this.handle, taskId) }
        return Status.fromC(st)
    }

    public func postRecognition(recoType: String, recoParam: String, image: ImageBuffer): TaskJob {
        if (this.handle.isNull()) {
            return TaskJob(this.handle, 0)
        }
        let id = unsafe {
            let cType = LibC.mallocCString(recoType)
            let cParam = LibC.mallocCString(recoParam)
            let taskId = MaaTaskerPostRecognition_wrap(this.handle, cType, cParam, image.raw())
            LibC.free(cType)
            LibC.free(cParam)
            taskId
        }
        return TaskJob(this.handle, id)
    }

    public func postRecognition(reco: Recognition, image: ImageBuffer): TaskJob {
        return this.postRecognition(reco.typeName, reco.paramJson, image)
    }

    public func postAction(actionType: String, actionParam: String, box: Rect, recoDetail: String): TaskJob {
        if (this.handle.isNull()) {
            return TaskJob(this.handle, 0)
        }
        let id = unsafe {
            let cType = LibC.mallocCString(actionType)
            let cParam = LibC.mallocCString(actionParam)
            let cDetail = LibC.mallocCString(recoDetail)
            var cBox = box.toC()
            let boxArr = [cBox]
            let rawBox = acquireArrayRawData(boxArr)
            let taskId = MaaTaskerPostAction_wrap(this.handle, cType, cParam, rawBox.pointer, cDetail)
            releaseArrayRawData(rawBox)
            LibC.free(cType)
            LibC.free(cParam)
            LibC.free(cDetail)
            taskId
        }
        return TaskJob(this.handle, id)
    }

    public func postAction(act: Action, box: Rect, recoDetail!: String = ""): TaskJob {
        return this.postAction(act.typeName, act.paramJson, box, recoDetail)
    }

    public func clearCache(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaTaskerClearCache_wrap(this.handle) != 0 }
    }

    public func overridePipeline(taskId: Int64, pipelineOverride: String): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let cOverride = LibC.mallocCString(pipelineOverride)
            let ret = MaaTaskerOverridePipeline_wrap(this.handle, taskId, cOverride) != 0
            LibC.free(cOverride)
            return ret
        }
    }

    public func overridePipeline(taskId: Int64, pipeline: Pipeline): Bool {
        return this.overridePipeline(taskId, pipeline.toJson())
    }

    public func getLatestNode(nodeName: String): Option<Int64> {
        if (this.handle.isNull()) {
            return None
        }
        let idArr: Array<Int64> = [0]
        let ok = unsafe {
            let cName = LibC.mallocCString(nodeName)
            let rawId = acquireArrayRawData(idArr)
            let ret = MaaTaskerGetLatestNode_wrap(this.handle, cName, rawId.pointer) != 0
            releaseArrayRawData(rawId)
            LibC.free(cName)
            ret
        }
        if (ok) {
            return Some(idArr[0])
        }
        return None
    }

    public func getNodeDetail(nodeId: Int64): Option<NodeDetail> {
        if (this.handle.isNull() || nodeId == 0) {
            return None
        }
        let nameBuf = StringBuffer()
        let recoIdArr: Array<Int64> = [0]
        let actIdArr: Array<Int64> = [0]
        let compArr: Array<UInt8> = [0]
        let ok = unsafe {
            let rawReco = acquireArrayRawData(recoIdArr)
            let rawAct = acquireArrayRawData(actIdArr)
            let rawComp = acquireArrayRawData(compArr)
            let cComp = CString(rawComp.pointer)
            let ret = MaaTaskerGetNodeDetail_wrap(
                this.handle,
                nodeId,
                nameBuf.raw(),
                rawReco.pointer,
                rawAct.pointer,
                cComp
            ) != 0
            releaseArrayRawData(rawReco)
            releaseArrayRawData(rawAct)
            releaseArrayRawData(rawComp)
            ret
        }
        let name = nameBuf.get()
        nameBuf.destroy()
        if (ok) {
            return Some(NodeDetail(nodeId, name, recoIdArr[0], actIdArr[0], compArr[0] != 0))
        }
        return None
    }

    public func getRecognitionDetail(recoId: Int64): Option<RecoDetail> {
        if (this.handle.isNull() || recoId == 0) {
            return None
        }
        let nameBuf = StringBuffer()
        let algoBuf = StringBuffer()
        let detailBuf = StringBuffer()
        let hitArr: Array<UInt8> = [0]
        var cBox = Rect().toC()
        let boxArr = [cBox]
        let rawImg = ImageBuffer()
        let ok = unsafe {
            let rawHit = acquireArrayRawData(hitArr)
            let rawBox = acquireArrayRawData(boxArr)
            let cHit = CString(rawHit.pointer)
            let ret = MaaTaskerGetRecognitionDetail_wrap(
                this.handle,
                recoId,
                nameBuf.raw(),
                algoBuf.raw(),
                cHit,
                rawBox.pointer,
                detailBuf.raw(),
                rawImg.raw(),
                CPointer<MaaImageListBuffer>()
            ) != 0
            releaseArrayRawData(rawHit)
            releaseArrayRawData(rawBox)
            ret
        }
        rawImg.destroy()
        let name = nameBuf.get()
        let algo = algoBuf.get()
        let detail = detailBuf.get()
        nameBuf.destroy()
        algoBuf.destroy()
        detailBuf.destroy()
        if (ok) {
            return Some(RecoDetail(recoId, name, algo, hitArr[0] != 0, Rect.fromC(boxArr[0]), detail))
        }
        return None
    }

    public func getActionDetail(actionId: Int64): Option<ActionDetail> {
        if (this.handle.isNull() || actionId == 0) {
            return None
        }
        let nameBuf = StringBuffer()
        let actBuf = StringBuffer()
        let detailBuf = StringBuffer()
        let succArr: Array<UInt8> = [0]
        var cBox = Rect().toC()
        let boxArr = [cBox]
        let ok = unsafe {
            let rawSucc = acquireArrayRawData(succArr)
            let rawBox = acquireArrayRawData(boxArr)
            let cSucc = CString(rawSucc.pointer)
            let ret = MaaTaskerGetActionDetail_wrap(
                this.handle,
                actionId,
                nameBuf.raw(),
                actBuf.raw(),
                rawBox.pointer,
                cSucc,
                detailBuf.raw()
            ) != 0
            releaseArrayRawData(rawSucc)
            releaseArrayRawData(rawBox)
            ret
        }
        let name = nameBuf.get()
        let act = actBuf.get()
        let detail = detailBuf.get()
        nameBuf.destroy()
        actBuf.destroy()
        detailBuf.destroy()
        if (ok) {
            return Some(ActionDetail(actionId, name, act, Rect.fromC(boxArr[0]), succArr[0] != 0, detail))
        }
        return None
    }

    public func getTaskDetail(taskId: Int64): Option<TaskDetail> {
        if (this.handle.isNull() || taskId == 0) {
            return None
        }
        let entryBuf = StringBuffer()
        let sizeArr: Array<UInt64> = [0]
        let statusArr: Array<Int32> = [0]
        let ok1 = unsafe {
            let rawSize = acquireArrayRawData(sizeArr)
            let rawStatus = acquireArrayRawData(statusArr)
            let ret = MaaTaskerGetTaskDetail_wrap(
                this.handle,
                taskId,
                entryBuf.raw(),
                CPointer<MaaNodeId>(),
                rawSize.pointer,
                rawStatus.pointer
            ) != 0
            releaseArrayRawData(rawSize)
            releaseArrayRawData(rawStatus)
            ret
        }
        if (!ok1) {
            entryBuf.destroy()
            return None
        }

        let count = sizeArr[0]
        let nodes = ArrayList<NodeDetail>()
        if (count > 0) {
            let idList: Array<Int64> = Array<Int64>(Int64(count), repeat: 0)
            unsafe {
                let rawList = acquireArrayRawData(idList)
                let rawSize = acquireArrayRawData(sizeArr)
                let rawStatus = acquireArrayRawData(statusArr)
                MaaTaskerGetTaskDetail_wrap(
                    this.handle,
                    taskId,
                    entryBuf.raw(),
                    rawList.pointer,
                    rawSize.pointer,
                    rawStatus.pointer
                )
                releaseArrayRawData(rawList)
                releaseArrayRawData(rawSize)
                releaseArrayRawData(rawStatus)
            }
            for (nodeId in idList) {
                if (let Some(node) <- this.getNodeDetail(nodeId)) {
                    nodes.add(node)
                }
            }
        }

        let entry = entryBuf.get()
        entryBuf.destroy()
        return Some(TaskDetail(taskId, entry, Status.fromC(statusArr[0]), nodes: nodes.toArray()))
    }

    public func getResource(): Option<MaaResource> {
        return this.boundResource
    }

    public func getController(): Option<Controller> {
        return this.boundController
    }

    public func raw(): CPointer<CMaaTasker> {
        return this.handle
    }
}

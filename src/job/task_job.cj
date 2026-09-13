package maa.job

import maa.ffi.*
import maa.types.*
import maa.buffer.*
import std.collection.ArrayList

public class TaskJob <: Job<TaskDetail> {
    private var taskerHandle: CPointer<MaaTasker>

    public init(taskerHandle: CPointer<MaaTasker>, jobId: Int64) {
        super(jobId)
        this.taskerHandle = taskerHandle
    }

    public override func wait(): Status {
        if (this.taskerHandle.isNull() || this.jobId == 0) {
            return Status.Invalid
        }
        let st = unsafe { MaaTaskerWait_wrap(this.taskerHandle, this.jobId) }
        return Status.fromC(st)
    }

    public override func status(): Status {
        if (this.taskerHandle.isNull() || this.jobId == 0) {
            return Status.Invalid
        }
        let st = unsafe { MaaTaskerStatus_wrap(this.taskerHandle, this.jobId) }
        return Status.fromC(st)
    }

    public func get(): Option<TaskDetail> {
        if (this.taskerHandle.isNull() || this.jobId == 0) {
            return None
        }
        let entryBuf = StringBuffer()
        let sizeArr: Array<UInt64> = [0]
        let statusArr: Array<Int32> = [0]
        let ok = unsafe {
            let rawSize = acquireArrayRawData(sizeArr)
            let rawStatus = acquireArrayRawData(statusArr)
            let res = MaaTaskerGetTaskDetail_wrap(
                this.taskerHandle,
                this.jobId,
                entryBuf.raw(),
                CPointer<MaaNodeId>(),
                rawSize.pointer,
                rawStatus.pointer
            )
            releaseArrayRawData(rawSize)
            releaseArrayRawData(rawStatus)
            res
        }
        if (ok == 0) {
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
                    this.taskerHandle,
                    this.jobId,
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
                if (nodeId == 0) {
                    continue
                }
                let nameBuf = StringBuffer()
                let recoIdArr: Array<Int64> = [0]
                let actIdArr: Array<Int64> = [0]
                let compArr: Array<UInt8> = [0]
                let nodeOk = unsafe {
                    let rawReco = acquireArrayRawData(recoIdArr)
                    let rawAct = acquireArrayRawData(actIdArr)
                    let rawComp = acquireArrayRawData(compArr)
                    let cComp = CString(rawComp.pointer)
                    let ret = MaaTaskerGetNodeDetail_wrap(
                        this.taskerHandle,
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
                if (nodeOk) {
                    nodes.add(NodeDetail(nodeId, name, recoIdArr[0], actIdArr[0], compArr[0] != 0))
                }
            }
        }

        let entry = entryBuf.get()
        entryBuf.destroy()
        return Some(TaskDetail(this.jobId, entry, Status.fromC(statusArr[0]), nodes: nodes.toArray()))
    }
}

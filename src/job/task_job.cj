package maa.job

import maa.ffi.*
import maa.types.*
import maa.buffer.*

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
        let arr: Array<Int32> = [0]
        let ok = unsafe {
            let rawHandle = acquireArrayRawData(arr)
            let res = MaaTaskerGetTaskDetail_wrap(
                this.taskerHandle,
                this.jobId,
                entryBuf.raw(),
                CPointer<MaaNodeId>(),
                CPointer<MaaSize>(),
                rawHandle.pointer
            )
            releaseArrayRawData(rawHandle)
            res
        }
        let entry = entryBuf.get()
        entryBuf.destroy()
        if (ok != 0) {
            return Some(TaskDetail(this.jobId, entry, Status.fromC(arr[0])))
        }
        return None
    }
}

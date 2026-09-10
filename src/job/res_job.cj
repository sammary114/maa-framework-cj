package maa.job

import maa.ffi.*
import maa.types.*

public class ResJob <: Job<Unit> {
    private var resHandle: CPointer<MaaResource>

    public init(resHandle: CPointer<MaaResource>, jobId: Int64) {
        super(jobId)
        this.resHandle = resHandle
    }

    public override func wait(): Status {
        if (this.resHandle.isNull() || this.jobId == 0) {
            return Status.Invalid
        }
        let st = unsafe { MaaResourceWait_wrap(this.resHandle, this.jobId) }
        return Status.fromC(st)
    }

    public override func status(): Status {
        if (this.resHandle.isNull() || this.jobId == 0) {
            return Status.Invalid
        }
        let st = unsafe { MaaResourceStatus_wrap(this.resHandle, this.jobId) }
        return Status.fromC(st)
    }
}

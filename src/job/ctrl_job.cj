package maa.job

import maa.ffi.*
import maa.types.*

public class CtrlJob <: Job<Unit> {
    private var ctrlHandle: CPointer<MaaController>

    public init(ctrlHandle: CPointer<MaaController>, jobId: Int64) {
        super(jobId)
        this.ctrlHandle = ctrlHandle
    }

    public override func wait(): Status {
        if (this.ctrlHandle.isNull() || this.jobId == 0) {
            return Status.Invalid
        }
        let st = unsafe { MaaControllerWait_wrap(this.ctrlHandle, this.jobId) }
        return Status.fromC(st)
    }

    public override func status(): Status {
        if (this.ctrlHandle.isNull() || this.jobId == 0) {
            return Status.Invalid
        }
        let st = unsafe { MaaControllerStatus_wrap(this.ctrlHandle, this.jobId) }
        return Status.fromC(st)
    }
}

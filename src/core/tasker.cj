package maa.core

import maa.ffi.*
import maa.ffi.MaaTasker as CMaaTasker
import maa.ffi.MaaResource as CMaaResource
import maa.ffi.MaaController as CMaaController
import maa.types.*
import maa.buffer.*
import maa.job.*

public type MaaTasker = Tasker

public class Tasker {
    private var handle: CPointer<CMaaTasker>
    private var ownsHandle: Bool
    private var boundResource: Option<MaaResource>
    private var boundController: Option<Controller>

    public init() {
        this.handle = unsafe { MaaTaskerCreate_wrap() }
        this.ownsHandle = true
        this.boundResource = None
        this.boundController = None
    }

    public init(handle: CPointer<CMaaTasker>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
        this.boundResource = None
        this.boundController = None
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            unsafe { MaaTaskerDestroy_wrap(this.handle) }
            this.handle = CPointer<CMaaTasker>()
        }
        this.boundResource = None
        this.boundController = None
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
            let cOverride = LibC.mallocCString(pipelineOverride)
            let taskId = MaaTaskerPostTask_wrap(this.handle, cEntry, cOverride)
            LibC.free(cEntry)
            LibC.free(cOverride)
            taskId
        }
        return TaskJob(this.handle, id)
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

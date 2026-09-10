package maa.core

import maa.types.*
import maa.job.*

public class Instance {
    public var resource: Resource
    public var controller: Option<Controller>
    public var tasker: Tasker

    public init() {
        this.resource = Resource()
        this.controller = None
        this.tasker = Tasker()
        this.tasker.bind(this.resource)
    }

    public init(controller: Controller) {
        this.resource = Resource()
        this.controller = Some(controller)
        this.tasker = Tasker()
        this.tasker.bind(this.resource)
        this.tasker.bind(controller)
    }

    public func bind(controller: Controller): Bool {
        this.controller = Some(controller)
        return this.tasker.bind(controller)
    }

    public func postTask(entry: String, pipelineOverride!: String = ""): TaskJob {
        return this.tasker.postTask(entry, pipelineOverride: pipelineOverride)
    }

    public func postPath(path: String): ResJob {
        return this.resource.postPath(path)
    }

    public func destroy(): Unit {
        this.tasker.destroy()
        this.resource.destroy()
        match (this.controller) {
            case Some(ctrl) => ctrl.destroy()
            case None => ()
        }
    }
}

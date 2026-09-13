package maa.types

public struct NodeDetail <: ToString {
    public var nodeId: Int64
    public var name: String
    public var recoId: Int64
    public var actionId: Int64
    public var completed: Bool

    public init(nodeId: Int64, name: String, recoId: Int64, actionId: Int64, completed: Bool) {
        this.nodeId = nodeId
        this.name = name
        this.recoId = recoId
        this.actionId = actionId
        this.completed = completed
    }

    public init(name: String, data: String) {
        this.nodeId = 0
        this.name = name
        this.recoId = 0
        this.actionId = 0
        this.completed = false
    }

    public init() {
        this.nodeId = 0
        this.name = ""
        this.recoId = 0
        this.actionId = 0
        this.completed = false
    }

    public func toString(): String {
        return "NodeDetail(nodeId: ${nodeId}, name: '${name}', recoId: ${recoId}, actionId: ${actionId}, completed: ${completed})"
    }
}

public struct RecoDetail <: ToString {
    public var recoId: Int64
    public var nodeName: String
    public var algorithm: String
    public var hit: Bool
    public var box: Rect
    public var detailJson: String

    public init(recoId: Int64, nodeName: String, algorithm: String, hit: Bool, box: Rect, detailJson: String) {
        this.recoId = recoId
        this.nodeName = nodeName
        this.algorithm = algorithm
        this.hit = hit
        this.box = box
        this.detailJson = detailJson
    }

    public init(recoId: Int64, box: Rect, score: Float64, detailJson: String) {
        this.recoId = recoId
        this.nodeName = ""
        this.algorithm = ""
        this.hit = true
        this.box = box
        this.detailJson = detailJson
    }

    public init() {
        this.recoId = 0
        this.nodeName = ""
        this.algorithm = ""
        this.hit = false
        this.box = Rect()
        this.detailJson = ""
    }

    public func toString(): String {
        return "RecoDetail(recoId: ${recoId}, node: '${nodeName}', hit: ${hit}, box: ${box})"
    }
}

public struct ActionDetail <: ToString {
    public var actionId: Int64
    public var nodeName: String
    public var action: String
    public var box: Rect
    public var success: Bool
    public var detailJson: String

    public init(actionId: Int64, nodeName: String, action: String, box: Rect, success: Bool, detailJson: String) {
        this.actionId = actionId
        this.nodeName = nodeName
        this.action = action
        this.box = box
        this.success = success
        this.detailJson = detailJson
    }

    public init() {
        this.actionId = 0
        this.nodeName = ""
        this.action = ""
        this.box = Rect()
        this.success = false
        this.detailJson = ""
    }

    public func toString(): String {
        return "ActionDetail(actionId: ${actionId}, node: '${nodeName}', action: '${action}', success: ${success})"
    }
}

public struct TaskDetail <: ToString {
    public var taskId: Int64
    public var entry: String
    public var status: Status
    public var nodes: Array<NodeDetail>

    public init(taskId: Int64, entry: String, status: Status, nodes!: Array<NodeDetail> = Array<NodeDetail>()) {
        this.taskId = taskId
        this.entry = entry
        this.status = status
        this.nodes = nodes
    }

    public init() {
        this.taskId = 0
        this.entry = ""
        this.status = Status.Invalid
        this.nodes = Array<NodeDetail>()
    }

    public func toString(): String {
        return "TaskDetail(taskId: ${taskId}, entry: '${entry}', status: ${status}, nodes: ${nodes.size})"
    }
}

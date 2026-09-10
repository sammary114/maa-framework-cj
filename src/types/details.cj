package maa.types

public struct TaskDetail <: ToString {
    public var taskId: Int64
    public var entry: String
    public var status: Status

    public init(taskId: Int64, entry: String, status: Status) {
        this.taskId = taskId
        this.entry = entry
        this.status = status
    }

    public init() {
        this.taskId = 0
        this.entry = ""
        this.status = Status.Invalid
    }

    public func toString(): String {
        return "TaskDetail(taskId: ${taskId}, entry: '${entry}', status: ${status})"
    }
}

public struct RecoDetail <: ToString {
    public var recoId: Int64
    public var box: Rect
    public var score: Float64
    public var detailJson: String

    public init(recoId: Int64, box: Rect, score: Float64, detailJson: String) {
        this.recoId = recoId
        this.box = box
        this.score = score
        this.detailJson = detailJson
    }

    public init() {
        this.recoId = 0
        this.box = Rect()
        this.score = 0.0
        this.detailJson = ""
    }

    public func toString(): String {
        return "RecoDetail(recoId: ${recoId}, box: ${box}, score: ${score})"
    }
}

public struct NodeDetail <: ToString {
    public var name: String
    public var data: String

    public init(name: String, data: String) {
        this.name = name
        this.data = data
    }

    public init() {
        this.name = ""
        this.data = ""
    }

    public func toString(): String {
        return "NodeDetail(name: '${name}')"
    }
}

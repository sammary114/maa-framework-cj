package maa.types

public struct CustomActionParam {
    public var currentTaskName: String
    public var customActionParam: String
    public var box: Rect
    public var recoDetail: String

    public init(currentTaskName: String, customActionParam: String, box: Rect, recoDetail: String) {
        this.currentTaskName = currentTaskName
        this.customActionParam = customActionParam
        this.box = box
        this.recoDetail = recoDetail
    }

    public init() {
        this.currentTaskName = ""
        this.customActionParam = ""
        this.box = Rect()
        this.recoDetail = ""
    }
}

public struct CustomActionResult {
    public var success: Bool

    public init(success: Bool) {
        this.success = success
    }

    public static func successful(): CustomActionResult {
        return CustomActionResult(true)
    }

    public static func failed(): CustomActionResult {
        return CustomActionResult(false)
    }
}

public struct CustomRecognitionParam {
    public var currentTaskName: String
    public var customRecognitionParam: String
    public var box: Rect
    public var detail: String

    public init(currentTaskName: String, customRecognitionParam: String, box: Rect, detail: String) {
        this.currentTaskName = currentTaskName
        this.customRecognitionParam = customRecognitionParam
        this.box = box
        this.detail = detail
    }

    public init() {
        this.currentTaskName = ""
        this.customRecognitionParam = ""
        this.box = Rect()
        this.detail = ""
    }
}

public struct CustomRecognitionResult {
    public var hit: Bool
    public var box: Rect
    public var detail: String

    public init(hit: Bool, box: Rect, detail: String) {
        this.hit = hit
        this.box = box
        this.detail = detail
    }

    public init() {
        this.hit = false
        this.box = Rect()
        this.detail = ""
    }

    public static func missed(): CustomRecognitionResult {
        return CustomRecognitionResult(false, Rect(), "")
    }

    public static func matched(box: Rect, detail: String): CustomRecognitionResult {
        return CustomRecognitionResult(true, box, detail)
    }
}

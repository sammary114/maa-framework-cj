package maa.types

public struct AdbDevice <: ToString {
    public var name: String
    public var serial: String
    public var address: String
    public var config: String
    public var screencapMethods: UInt64
    public var inputMethods: UInt64
    public var type_: String

    public init(
        name: String,
        serial: String,
        address: String,
        config: String,
        screencapMethods: UInt64,
        inputMethods: UInt64,
        type_: String
    ) {
        this.name = name
        this.serial = serial
        this.address = address
        this.config = config
        this.screencapMethods = screencapMethods
        this.inputMethods = inputMethods
        this.type_ = type_
    }

    public init() {
        this.name = ""
        this.serial = ""
        this.address = ""
        this.config = ""
        this.screencapMethods = 0
        this.inputMethods = 0
        this.type_ = ""
    }

    public func toString(): String {
        return "AdbDevice(name: '${name}', serial: '${serial}', address: '${address}', type: '${type_}')"
    }
}

public struct DesktopWindow <: ToString {
    public var hwnd: Int64
    public var className: String
    public var windowName: String

    public init(hwnd: Int64, className: String, windowName: String) {
        this.hwnd = hwnd
        this.className = className
        this.windowName = windowName
    }

    public init() {
        this.hwnd = 0
        this.className = ""
        this.windowName = ""
    }

    public func toString(): String {
        return "DesktopWindow(hwnd: ${hwnd}, windowName: '${windowName}', className: '${className}')"
    }
}

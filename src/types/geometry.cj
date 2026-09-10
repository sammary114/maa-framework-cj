package maa.types

import maa.ffi.*

public struct Point <: ToString {
    public var x: Int32
    public var y: Int32

    public init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }

    public init() {
        this.x = 0
        this.y = 0
    }

    public func toString(): String {
        return "Point(x: ${x}, y: ${y})"
    }
}

public struct Rect <: ToString {
    public var x: Int32
    public var y: Int32
    public var width: Int32
    public var height: Int32

    public init(x: Int32, y: Int32, width: Int32, height: Int32) {
        this.x = x
        this.y = y
        this.width = width
        this.height = height
    }

    public init() {
        this.x = 0
        this.y = 0
        this.width = 0
        this.height = 0
    }

    public func toC(): MaaRect {
        return MaaRect(this.x, this.y, this.width, this.height)
    }

    public static func fromC(r: MaaRect): Rect {
        return Rect(r.x, r.y, r.width, r.height)
    }

    public func toString(): String {
        return "Rect(x: ${x}, y: ${y}, width: ${width}, height: ${height})"
    }
}

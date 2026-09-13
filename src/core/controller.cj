package maa.core

import maa.ffi.*
import maa.ffi.MaaController as CMaaController
import maa.types.*
import maa.buffer.*
import maa.job.*

private func createAdbHandle(
    serial: String,
    config: String,
    adbPath: String,
    screencapMethods: UInt64,
    inputMethods: UInt64,
    agentPath: String
): CPointer<CMaaController> {
    unsafe {
        let cAdbPath = LibC.mallocCString(adbPath)
        let cAddress = LibC.mallocCString(serial)
        let cConfig = LibC.mallocCString(config)
        let cAgentPath = LibC.mallocCString(agentPath)

        let ptr = MaaAdbControllerCreate_wrap(
            cAdbPath,
            cAddress,
            screencapMethods,
            inputMethods,
            cConfig,
            cAgentPath
        )

        LibC.free(cAdbPath)
        LibC.free(cAddress)
        LibC.free(cConfig)
        LibC.free(cAgentPath)

        ptr
    }
}

private func createWin32Handle(
    hwnd: Int64,
    screencapMethod: UInt64,
    mouseMethod: UInt64,
    keyboardMethod: UInt64
): CPointer<CMaaController> {
    unsafe {
        let hwndPtr = CPointer<Unit>()
        MaaWin32ControllerCreate_wrap(
            hwndPtr,
            screencapMethod,
            mouseMethod,
            keyboardMethod
        )
    }
}

public type MaaController = Controller

public open class Controller {
    protected var handle: CPointer<CMaaController>
    protected var ownsHandle: Bool

    public init(handle: CPointer<CMaaController>, ownsHandle!: Bool = true) {
        this.handle = handle
        this.ownsHandle = ownsHandle
    }

    public func close(): Unit {
        this.destroy()
    }

    public func destroy(): Unit {
        if (this.ownsHandle && !this.handle.isNull()) {
            unsafe { MaaControllerDestroy_wrap(this.handle) }
            this.handle = CPointer<CMaaController>()
        }
    }

    public func postConnect(): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostConnection_wrap(this.handle) }
        return CtrlJob(this.handle, id)
    }

    public func postClick(x: Int32, y: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostClick_wrap(this.handle, x, y) }
        return CtrlJob(this.handle, id)
    }

    public func postClick(x: Int32, y: Int32, contact: Int32, pressure: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostClickV2_wrap(this.handle, x, y, contact, pressure) }
        return CtrlJob(this.handle, id)
    }

    public func postSwipe(x1: Int32, y1: Int32, x2: Int32, y2: Int32, duration: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostSwipe_wrap(this.handle, x1, y1, x2, y2, duration) }
        return CtrlJob(this.handle, id)
    }

    public func postSwipe(x1: Int32, y1: Int32, x2: Int32, y2: Int32, duration: Int32, contact: Int32, pressure: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostSwipeV2_wrap(this.handle, x1, y1, x2, y2, duration, contact, pressure) }
        return CtrlJob(this.handle, id)
    }

    public func postTouchDown(contact: Int32, x: Int32, y: Int32, pressure: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostTouchDown_wrap(this.handle, contact, x, y, pressure) }
        return CtrlJob(this.handle, id)
    }

    public func postTouchMove(contact: Int32, x: Int32, y: Int32, pressure: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostTouchMove_wrap(this.handle, contact, x, y, pressure) }
        return CtrlJob(this.handle, id)
    }

    public func postTouchUp(contact: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostTouchUp_wrap(this.handle, contact) }
        return CtrlJob(this.handle, id)
    }

    public func postClickKey(keycode: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostClickKey_wrap(this.handle, keycode) }
        return CtrlJob(this.handle, id)
    }

    public func postKeyDown(keycode: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostKeyDown_wrap(this.handle, keycode) }
        return CtrlJob(this.handle, id)
    }

    public func postKeyUp(keycode: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostKeyUp_wrap(this.handle, keycode) }
        return CtrlJob(this.handle, id)
    }

    public func postInputText(text: String): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(text)
            let ctrlId = MaaControllerPostInputText_wrap(this.handle, cstr)
            LibC.free(cstr)
            ctrlId
        }
        return CtrlJob(this.handle, id)
    }

    public func postStartApp(intent: String): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(intent)
            let ctrlId = MaaControllerPostStartApp_wrap(this.handle, cstr)
            LibC.free(cstr)
            ctrlId
        }
        return CtrlJob(this.handle, id)
    }

    public func postStopApp(intent: String): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(intent)
            let ctrlId = MaaControllerPostStopApp_wrap(this.handle, cstr)
            LibC.free(cstr)
            ctrlId
        }
        return CtrlJob(this.handle, id)
    }

    public func postScreencap(): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostScreencap_wrap(this.handle) }
        return CtrlJob(this.handle, id)
    }

    public func cachedImage(): Option<ImageBuffer> {
        if (this.handle.isNull()) {
            return None
        }
        let img = ImageBuffer()
        let ok = unsafe { MaaControllerCachedImage_wrap(this.handle, img.raw()) != 0 }
        if (ok) {
            return Some(img)
        }
        img.destroy()
        return None
    }

    public func connected(): Bool {
        if (this.handle.isNull()) {
            return false
        }
        return unsafe { MaaControllerConnected_wrap(this.handle) != 0 }
    }

    public func getUuid(): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe { MaaControllerGetUuid_wrap(this.handle, buf.raw()) != 0 }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func getResolution(): (Int32, Int32) {
        if (this.handle.isNull()) {
            return (0, 0)
        }
        let wArr: Array<Int32> = [0]
        let hArr: Array<Int32> = [0]
        unsafe {
            let wRaw = acquireArrayRawData(wArr)
            let hRaw = acquireArrayRawData(hArr)
            MaaControllerGetResolution_wrap(this.handle, wRaw.pointer, hRaw.pointer)
            releaseArrayRawData(wRaw)
            releaseArrayRawData(hRaw)
        }
        return (wArr[0], hArr[0])
    }

    public func postScroll(dx: Int32, dy: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostScroll_wrap(this.handle, dx, dy) }
        return CtrlJob(this.handle, id)
    }

    public func postRelativeMove(dx: Int32, dy: Int32): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostRelativeMove_wrap(this.handle, dx, dy) }
        return CtrlJob(this.handle, id)
    }

    public func postInactive(): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe { MaaControllerPostInactive_wrap(this.handle) }
        return CtrlJob(this.handle, id)
    }

    public func postShell(cmd: String, timeout!: Int64 = 20000): CtrlJob {
        if (this.handle.isNull()) {
            return CtrlJob(this.handle, 0)
        }
        let id = unsafe {
            let cstr = LibC.mallocCString(cmd)
            let ctrlId = MaaControllerPostShell_wrap(this.handle, cstr, timeout)
            LibC.free(cstr)
            ctrlId
        }
        return CtrlJob(this.handle, id)
    }

    public func getShellOutput(): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe { MaaControllerGetShellOutput_wrap(this.handle, buf.raw()) != 0 }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func getInfo(): String {
        if (this.handle.isNull()) {
            return ""
        }
        let buf = StringBuffer()
        let ok = unsafe { MaaControllerGetInfo_wrap(this.handle, buf.raw()) != 0 }
        let res = if (ok) { buf.get() } else { "" }
        buf.destroy()
        return res
    }

    public func setScreenshotTargetLongSide(size: Int32): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let valArr: Array<Int32> = [size]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaControllerSetOption_wrap(
                this.handle,
                Int32(MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotTargetLongSide),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<Int32>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public func setScreenshotTargetShortSide(size: Int32): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let valArr: Array<Int32> = [size]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaControllerSetOption_wrap(
                this.handle,
                Int32(MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotTargetShortSide),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<Int32>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public func setScreenshotUseRawSize(enable: Bool): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let val: UInt8 = if (enable) { 1 } else { 0 }
            let valArr: Array<UInt8> = [val]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaControllerSetOption_wrap(
                this.handle,
                Int32(MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotUseRawSize),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<UInt8>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public func setMouseLockFollow(enable: Bool): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let val: UInt8 = if (enable) { 1 } else { 0 }
            let valArr: Array<UInt8> = [val]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaControllerSetOption_wrap(
                this.handle,
                Int32(MaaCtrlOptionEnum_MaaCtrlOption_MouseLockFollow),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<UInt8>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public func setScreenshotResizeMethod(method: Int32): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let valArr: Array<Int32> = [method]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaControllerSetOption_wrap(
                this.handle,
                Int32(MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotResizeMethod),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<Int32>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public func setScreenshotTargetExpand(width: Int32, height: Int32): Bool {
        if (this.handle.isNull()) {
            return false
        }
        unsafe {
            let valArr: Array<Int32> = [width, height]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaControllerSetOption_wrap(
                this.handle,
                Int32(MaaCtrlOptionEnum_MaaCtrlOption_ScreenshotTargetExpand),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<Int32>() * 2)
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public func raw(): CPointer<CMaaController> {
        return this.handle
    }
}

public class AdbController <: Controller {
    public init(
        serial: String,
        config: String,
        adbPath!: String = "",
        screencapMethods!: UInt64 = 0,
        inputMethods!: UInt64 = 0,
        agentPath!: String = ""
    ) {
        super(createAdbHandle(serial, config, adbPath, screencapMethods, inputMethods, agentPath), ownsHandle: true)
    }
}

public class Win32Controller <: Controller {
    public init(
        hwnd: Int64,
        screencapMethod!: UInt64 = 0,
        mouseMethod!: UInt64 = 0,
        keyboardMethod!: UInt64 = 0
    ) {
        super(createWin32Handle(hwnd, screencapMethod, mouseMethod, keyboardMethod), ownsHandle: true)
    }
}

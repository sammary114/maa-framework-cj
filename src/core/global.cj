package maa.core

import maa.ffi.*
import maa.types.*

public class Global {
    public static func version(): String {
        let v = unsafe { MaaVersion_wrap() }
        return v.toString()
    }

    public static func loadPlugin(path: String): Bool {
        unsafe {
            let cstr = LibC.mallocCString(path)
            let ret = MaaGlobalLoadPlugin_wrap(cstr)
            LibC.free(cstr)
            return ret != 0
        }
    }

    public static func setStdoutLevel(level: LoggingLevel): Bool {
        unsafe {
            let valArr: Array<Int32> = [level.toC()]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_StdoutLevel),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<Int32>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public static func setLogDir(path: String): Bool {
        unsafe {
            let cstr = LibC.mallocCString(path)
            let len = UInt64(path.size)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_LogDir),
                CPointer<Unit>(cstr.getChars()),
                len
            )
            LibC.free(cstr)
            return ret != 0
        }
    }

    public static func setSaveDraw(enable: Bool): Bool {
        unsafe {
            let val: UInt8 = if (enable) { 1 } else { 0 }
            let valArr: Array<UInt8> = [val]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_SaveDraw),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<UInt8>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public static func setDebugMode(enable: Bool): Bool {
        unsafe {
            let val: UInt8 = if (enable) { 1 } else { 0 }
            let valArr: Array<UInt8> = [val]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_DebugMode),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<UInt8>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public static func setSaveOnError(enable: Bool): Bool {
        unsafe {
            let val: UInt8 = if (enable) { 1 } else { 0 }
            let valArr: Array<UInt8> = [val]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_SaveOnError),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<UInt8>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public static func setDrawQuality(quality: Int32): Bool {
        unsafe {
            let valArr: Array<Int32> = [quality]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_DrawQuality),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<Int32>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }

    public static func setRecoImageCacheLimit(limit: UInt64): Bool {
        unsafe {
            let valArr: Array<UInt64> = [limit]
            let rawData = acquireArrayRawData(valArr)
            let ret = MaaGlobalSetOption_wrap(
                Int32(MaaGlobalOptionEnum_MaaGlobalOption_RecoImageCacheLimit),
                CPointer<Unit>(rawData.pointer),
                UInt64(sizeOf<UInt64>())
            )
            releaseArrayRawData(rawData)
            return ret != 0
        }
    }
}


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
}

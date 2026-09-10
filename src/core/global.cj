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
}

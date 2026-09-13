package maa.toolkit

import maa.ffi.*
import maa.types.*
import std.collection.*

public class AdbDeviceFinder {
    public static func find(adbPath!: String = ""): Array<AdbDevice> {
        let listHandle = unsafe { MaaToolkitAdbDeviceListCreate_wrap() }
        if (listHandle.isNull()) {
            return Array<AdbDevice>()
        }

        let ok = unsafe {
            if (adbPath.isEmpty()) {
                MaaToolkitAdbDeviceFind_wrap(listHandle) != 0
            } else {
                let cAdb = LibC.mallocCString(adbPath)
                let res = MaaToolkitAdbDeviceFindSpecified_wrap(cAdb, listHandle) != 0
                LibC.free(cAdb)
                res
            }
        }

        if (!ok) {
            unsafe { MaaToolkitAdbDeviceListDestroy_wrap(listHandle) }
            return Array<AdbDevice>()
        }

        let size = unsafe { MaaToolkitAdbDeviceListSize_wrap(listHandle) }
        let result = ArrayList<AdbDevice>()

        for (i in 0..size) {
            let devPtr = unsafe { MaaToolkitAdbDeviceListAt_wrap(listHandle, i) }
            if (!devPtr.isNull()) {
                let name = unsafe { MaaToolkitAdbDeviceGetName_wrap(devPtr).toString() }
                let adbPath = unsafe { MaaToolkitAdbDeviceGetAdbPath_wrap(devPtr).toString() }
                let address = unsafe { MaaToolkitAdbDeviceGetAddress_wrap(devPtr).toString() }
                let config = unsafe { MaaToolkitAdbDeviceGetConfig_wrap(devPtr).toString() }
                let screencap = unsafe { MaaToolkitAdbDeviceGetScreencapMethods_wrap(devPtr) }
                let input = unsafe { MaaToolkitAdbDeviceGetInputMethods_wrap(devPtr) }
                result.add(AdbDevice(name, adbPath, address, address, config, screencap, input, "ADB"))
            }
        }

        unsafe { MaaToolkitAdbDeviceListDestroy_wrap(listHandle) }
        return result.toArray()
    }
}

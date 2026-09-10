package maa.toolkit

import maa.ffi.*
import maa.types.*
import std.collection.*

public class DesktopWindowFinder {
    public static func find(): Array<DesktopWindow> {
        let listHandle = unsafe { MaaToolkitDesktopWindowListCreate_wrap() }
        if (listHandle.isNull()) {
            return Array<DesktopWindow>()
        }

        let ok = unsafe { MaaToolkitDesktopWindowFindAll_wrap(listHandle) != 0 }
        if (!ok) {
            unsafe { MaaToolkitDesktopWindowListDestroy_wrap(listHandle) }
            return Array<DesktopWindow>()
        }

        let size = unsafe { MaaToolkitDesktopWindowListSize_wrap(listHandle) }
        let result = ArrayList<DesktopWindow>()

        for (i in 0..size) {
            let winPtr = unsafe { MaaToolkitDesktopWindowListAt_wrap(listHandle, i) }
            if (!winPtr.isNull()) {
                let className = unsafe { MaaToolkitDesktopWindowGetClassName_wrap(winPtr).toString() }
                let windowName = unsafe { MaaToolkitDesktopWindowGetWindowName_wrap(winPtr).toString() }
                result.add(DesktopWindow(0, className, windowName))
            }
        }

        unsafe { MaaToolkitDesktopWindowListDestroy_wrap(listHandle) }
        return result.toArray()
    }
}

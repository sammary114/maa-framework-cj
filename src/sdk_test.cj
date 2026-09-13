package maa

import std.unittest.*
import std.unittest.testmacro.*
import maa.types.*
import maa.buffer.*
import maa.job.*
import maa.core.*
import maa.toolkit.*

@Test

class SdkTest {
    @TestCase
    func testGlobalVersion(): Unit {
        Global.setStdoutLevel(LoggingLevel.Off)
        let ver = Global.version()
        @Assert(!ver.isEmpty())
        @Assert(ver.startsWith("v"))
    }

    @TestCase
    func testGeometryTypes(): Unit {
        let pt = Point(100, 200)
        @Assert(pt.x == 100)
        @Assert(pt.y == 200)

        let rect = Rect(10, 20, 300, 400)
        @Assert(rect.x == 10)
        @Assert(rect.y == 20)
        @Assert(rect.width == 300)
        @Assert(rect.height == 400)

        let cRect = rect.toC()
        let rectBack = Rect.fromC(cRect)
        @Assert(rectBack.x == rect.x)
        @Assert(rectBack.y == rect.y)
        @Assert(rectBack.width == rect.width)
        @Assert(rectBack.height == rect.height)
    }

    @TestCase
    func testStatusEnum(): Unit {
        let stPending = Status.fromC(1000)
        @Assert(stPending.isPending())
        @Assert(!stPending.isDone())

        let stSucceeded = Status.fromC(3000)
        @Assert(stSucceeded.isSucceeded())
        @Assert(stSucceeded.isDone())

        let stFailed = Status.fromC(4000)
        @Assert(stFailed.isFailed())
        @Assert(stFailed.isDone())
    }

    @TestCase
    func testStringBuffer(): Unit {
        let buf = StringBuffer()
        @Assert(buf.isEmpty())
        
        let ok = buf.set("Hello MaaFramework Cangjie!")
        @Assert(ok)
        @Assert(!buf.isEmpty())
        @Assert(buf.get() == "Hello MaaFramework Cangjie!")
        @Assert(buf.size() > 0)

        buf.clear()
        @Assert(buf.isEmpty())
        @Assert(buf.get() == "")
        buf.destroy()
    }

    @TestCase
    func testStringListBuffer(): Unit {
        let listBuf = StringListBuffer()
        @Assert(listBuf.isEmpty())
        @Assert(listBuf.size() == 0)

        listBuf.append("Node1")
        listBuf.append("Node2")
        listBuf.append("Node3")

        @Assert(!listBuf.isEmpty())
        @Assert(listBuf.size() == 3)
        @Assert(listBuf.get(0) == "Node1")
        @Assert(listBuf.get(1) == "Node2")
        @Assert(listBuf.get(2) == "Node3")

        let arr = listBuf.toArray()
        @Assert(arr.size == 3)
        @Assert(arr[0] == "Node1")
        @Assert(arr[1] == "Node2")
        @Assert(arr[2] == "Node3")

        listBuf.clear()
        @Assert(listBuf.isEmpty())
        listBuf.destroy()
    }

    @TestCase
    func testImageBuffer(): Unit {
        let img = ImageBuffer()
        @Assert(img.isEmpty())
        @Assert(img.width() == 0)
        @Assert(img.height() == 0)
        img.destroy()
    }

    @TestCase
    func testResourceLifecycle(): Unit {
        let res = MaaResource()
        @Assert(res.loaded())
        let hash = res.getHash()
        println(">> Resource initial hash = ${hash}")
        res.destroy()
    }

    @TestCase
    func testTaskerLifecycle(): Unit {
        let tasker = Tasker()
        @Assert(!tasker.running())
        @Assert(!tasker.stopping())

        let res = MaaResource()
        let bindOk = tasker.bind(res)
        @Assert(bindOk)

        tasker.destroy()
        res.destroy()
    }

    @TestCase
    func testAdbDeviceFinderScan(): Unit {
        // 验证 AdbDevice 数据结构与查找器接口
        let dev = AdbDevice("MockDevice", "mock_adb", "127.0.0.1:5555", "127.0.0.1:5555", "{}", 0, 0, "ADB")
        @Assert(!dev.name.isEmpty())
        @Assert(!dev.adbPath.isEmpty())
        @Assert(!dev.serial.isEmpty())

        let devices = AdbDeviceFinder.find(adbPath: "invalid_mock_adb")
        @Assert(devices.size == 0)
    }

    @TestCase
    func testGlobalOptions(): Unit {
        @Assert(Global.setLogDir("build/logs"))
        @Assert(Global.setSaveDraw(false))
        @Assert(Global.setDebugMode(false))
        @Assert(Global.setSaveOnError(true))
        @Assert(Global.setDrawQuality(90))
        @Assert(Global.setRecoImageCacheLimit(2048))
    }

    @TestCase
    func testControllerExtended(): Unit {
        let ctrl = Win32Controller(0)
        @Assert(ctrl.setScreenshotTargetLongSide(1280))
        @Assert(ctrl.setScreenshotTargetShortSide(720))
        @Assert(ctrl.setScreenshotUseRawSize(false))
        @Assert(ctrl.setScreenshotResizeMethod(3))
        @Assert(ctrl.setScreenshotTargetExpand(720, 1280))

        let info = ctrl.getInfo()
        @Assert(!info.isEmpty())

        ctrl.destroy()
    }

    @TestCase
    func testResourceOverridesAndDefaults(): Unit {
        let res = MaaResource()
        @Assert(res.overridePipeline("{\"TestNode\":{}}"))
        @Assert(res.overrideNext("TestNode", ["Next1", "Next2"]))

        let recoParam = res.getDefaultRecognitionParam("OCR")
        @Assert(!recoParam.isEmpty())

        let actParam = res.getDefaultActionParam("Click")
        @Assert(!actParam.isEmpty())

        res.destroy()
    }
}


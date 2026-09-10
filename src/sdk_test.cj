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
        let ver = Global.version()
        println(">> SDK Test: MaaFramework Version = ${ver}")
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
        let devices = AdbDeviceFinder.find()
        println(">> Scanned ADB devices count: ${devices.size}")
        for (dev in devices) {
            println("   - Device: ${dev}")
        }
    }
}

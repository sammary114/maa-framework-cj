package maa

import std.unittest.*
import std.unittest.testmacro.*
import maa.ffi.MaaContext as CMaaContext
import maa.types.*
import maa.buffer.*
import maa.job.*
import maa.core.*
import maa.toolkit.*
import maa.custom.*
import std.fs.*

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

    @TestCase
    func testTaskerExtended(): Unit {
        let tasker = Tasker()
        @Assert(tasker.clearCache())
        @Assert(!tasker.overridePipeline(0, "{}"))
        @Assert(tasker.getLatestNode("NonExistent").isNone())
        @Assert(tasker.getNodeDetail(0).isNone())
        @Assert(tasker.getRecognitionDetail(0).isNone())
        @Assert(tasker.getActionDetail(0).isNone())
        @Assert(tasker.getTaskDetail(0).isNone())
        tasker.destroy()
    }

    @TestCase
    func testContextExtended(): Unit {
        let ctx = Context(CPointer<CMaaContext>(), ownsHandle: false)
        @Assert(ctx.getTaskId() == 0)
        @Assert(ctx.getHitCount("Node") == 0)
        @Assert(!ctx.clearHitCount("Node"))
        @Assert(ctx.getAnchor("Anchor") == "")
        @Assert(!ctx.setAnchor("Anchor", "Node"))
        @Assert(!ctx.overrideNext("Node", ["Next1"]))
        @Assert(!ctx.waitFreezes(1000, Rect(0, 0, 100, 100)))

        let img = ImageBuffer()
        @Assert(ctx.runRecognitionDirect("OCR", "{}", img) == 0)
        img.destroy()

        @Assert(ctx.runActionDirect("Click", "{}", Rect(0, 0, 10, 10), "") == 0)

        let taskerFromCtx = ctx.getTasker()
        @Assert(!taskerFromCtx.running())
    }

    @TestCase
    func testDetailStructures(): Unit {
        let node = NodeDetail(1, "TestNode", 10, 20, true)
        @Assert(node.nodeId == 1)
        @Assert(node.name == "TestNode")
        @Assert(node.recoId == 10)
        @Assert(node.actionId == 20)
        @Assert(node.completed)

        let reco = RecoDetail(10, "TestNode", "OCR", true, Rect(1, 2, 3, 4), "{}")
        @Assert(reco.recoId == 10)
        @Assert(reco.hit)
        @Assert(reco.box.width == 3)

        let act = ActionDetail(20, "TestNode", "Click", Rect(1, 2, 3, 4), true, "{}")
        @Assert(act.actionId == 20)
        @Assert(act.success)

        let task = TaskDetail(100, "Entry", Status.Succeeded, nodes: [node])
        @Assert(task.taskId == 100)
        @Assert(task.nodes.size == 1)
        @Assert(task.nodes[0].name == "TestNode")
    }

    @TestCase
    func testMaaMsgConstants(): Unit {
        @Assert(MaaMsg.ResourceLoadingStarting == "Resource.Loading.Starting")
        @Assert(MaaMsg.ResourceLoadingSucceeded == "Resource.Loading.Succeeded")
        @Assert(MaaMsg.ResourceLoadingFailed == "Resource.Loading.Failed")

        @Assert(MaaMsg.ControllerActionStarting == "Controller.Action.Starting")
        @Assert(MaaMsg.ControllerActionSucceeded == "Controller.Action.Succeeded")
        @Assert(MaaMsg.ControllerActionFailed == "Controller.Action.Failed")

        @Assert(MaaMsg.TaskerTaskStarting == "Tasker.Task.Starting")
        @Assert(MaaMsg.TaskerTaskSucceeded == "Tasker.Task.Succeeded")
        @Assert(MaaMsg.TaskerTaskFailed == "Tasker.Task.Failed")

        @Assert(MaaMsg.NodePipelineNodeStarting == "Node.PipelineNode.Starting")
        @Assert(MaaMsg.NodePipelineNodeSucceeded == "Node.PipelineNode.Succeeded")
        @Assert(MaaMsg.NodePipelineNodeFailed == "Node.PipelineNode.Failed")

        @Assert(MaaMsg.NodeRecognitionNodeStarting == "Node.RecognitionNode.Starting")
        @Assert(MaaMsg.NodeRecognitionNodeSucceeded == "Node.RecognitionNode.Succeeded")
        @Assert(MaaMsg.NodeRecognitionNodeFailed == "Node.RecognitionNode.Failed")

        @Assert(MaaMsg.NodeActionNodeStarting == "Node.ActionNode.Starting")
        @Assert(MaaMsg.NodeActionNodeSucceeded == "Node.ActionNode.Succeeded")
        @Assert(MaaMsg.NodeActionNodeFailed == "Node.ActionNode.Failed")

        @Assert(MaaMsg.NodeNextListStarting == "Node.NextList.Starting")
        @Assert(MaaMsg.NodeNextListSucceeded == "Node.NextList.Succeeded")
        @Assert(MaaMsg.NodeNextListFailed == "Node.NextList.Failed")

        @Assert(MaaMsg.NodeRecognitionStarting == "Node.Recognition.Starting")
        @Assert(MaaMsg.NodeRecognitionSucceeded == "Node.Recognition.Succeeded")
        @Assert(MaaMsg.NodeRecognitionFailed == "Node.Recognition.Failed")

        @Assert(MaaMsg.NodeActionStarting == "Node.Action.Starting")
        @Assert(MaaMsg.NodeActionSucceeded == "Node.Action.Succeeded")
        @Assert(MaaMsg.NodeActionFailed == "Node.Action.Failed")

        @Assert(MaaMsg.NodeWaitFreezesStarting == "Node.WaitFreezes.Starting")
        @Assert(MaaMsg.NodeWaitFreezesSucceeded == "Node.WaitFreezes.Succeeded")
        @Assert(MaaMsg.NodeWaitFreezesFailed == "Node.WaitFreezes.Failed")
    }

    @TestCase
    func testSinksRegistrationAndRemoval(): Unit {
        let res = MaaResource()
        let sink1 = res.addSink { msg, _ => () }
        @Assert(sink1 > 0)
        res.removeSink(sink1)
        res.clearSinks()
        res.destroy()

        let ctrl = Win32Controller(0)
        let sink2 = ctrl.addSink { msg, _ => () }
        @Assert(sink2 > 0)
        ctrl.removeSink(sink2)
        ctrl.clearSinks()
        ctrl.destroy()

        let tasker = Tasker()
        let sink3 = tasker.addSink { msg, _ => () }
        @Assert(sink3 > 0)
        tasker.removeSink(sink3)

        let ctxSink = tasker.addContextSink { msg, _ => () }
        @Assert(ctxSink > 0)
        tasker.removeContextSink(ctxSink)

        let onStartingSink = tasker.onTaskStarting { _ => () }
        let onSucceededSink = tasker.onTaskSucceeded { _ => () }
        let onFailedSink = tasker.onTaskFailed { _ => () }
        let onNodeSink = tasker.onNodeStarting { _ => () }
        let onNodeSuccSink = tasker.onNodeSucceeded { _ => () }
        let onNodeFailSink = tasker.onNodeFailed { _ => () }
        @Assert(onStartingSink > 0)
        @Assert(onSucceededSink > 0)
        @Assert(onFailedSink > 0)
        @Assert(onNodeSink > 0)
        @Assert(onNodeSuccSink > 0)
        @Assert(onNodeFailSink > 0)

        tasker.clearSinks()
        tasker.clearContextSinks()
        tasker.destroy()
    }

    @TestCase
    func testControllerSinksDispatch(): Unit {
        let ctrl = Win32Controller(0)
        let received = Array<Bool>(1, repeat: false)
        let sinkId = ctrl.addSink { msg, details =>
            if (msg.contains("Controller.Action")) {
                received[0] = true
            }
        }
        @Assert(sinkId > 0)

        let clickJob = ctrl.postClick(100, 100)
        clickJob.wait()

        @Assert(received[0])

        ctrl.removeSink(sinkId)
        ctrl.destroy()
    }

    @TestCase
    func testRecordAndReplayController(): Unit {
        let baseCtrl = Win32Controller(0)
        let recPath = "./test_record.jsonl"
        let rec = RecordController(baseCtrl, recPath)
        @Assert(rec.getInner() is Win32Controller)
        @Assert(!rec.raw().isNull())
        rec.destroy()
        baseCtrl.destroy()

        let rep = ReplayController(recPath)
        @Assert(!rep.raw().isNull())
        rep.destroy()

        let dbg = DbgController("dummy_dir")
        dbg.destroy()

        if (exists(recPath)) {
            remove(recPath)
        }
        let shotDir = "./test_record-Screenshot"
        if (exists(shotDir)) {
            remove(shotDir, recursive: true)
        }
    }
}



package quickstart

import maa.*
import std.fs.*

main() {
    println("==========================================")
    println("   MaaFramework 仓颉快速开始 (QuickStart) ")
    println("==========================================")

    // 1. 打印底层引擎版本
    println(">> 引擎版本: ${Global.version()}")

    // 2. 初始化 Tasker 调度器并注册事件监听
    let tasker = Tasker()
    tasker.onTaskStarting { details => println(">> [事件回调] 任务启动: ${details}") }
    tasker.onNodeStarting { details => println(">> [事件回调] 节点开始: ${details}") }
    tasker.onNodeSucceeded { details => println(">> [事件回调] 节点成功: ${details}") }

    // 3. 查找 ADB 设备（若连接了模拟器则自动绑定）
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println(">> 未检测到运行中的 ADB 设备/模拟器 (跳过设备连接)")
    } else {
        for (i in 0..devices.size) {
            println(">> 候选设备 [${i}]: ${devices[i]}")
        }

        // 优先选择包含有效 adbPath 的设备配置
        var targetDev = devices[0]
        for (dev in devices) {
            if (!dev.adbPath.isEmpty()) {
                targetDev = dev
                break
            }
        }

        println(">> 正在连接目标设备: ${targetDev.name} [${targetDev.serial}]")
        let adbExec = if (targetDev.adbPath.isEmpty()) { "adb" } else { targetDev.adbPath }
        let ctrl = AdbController(
            targetDev.serial,
            targetDev.config,
            adbPath: adbExec,
            screencapMethods: targetDev.screencapMethods,
            inputMethods: targetDev.inputMethods
        )
        let connJob = ctrl.postConnect()
        let connStatus = connJob.wait()
        println(">> 控制器连接状态: ${connStatus}")
        if (connStatus.isSucceeded()) {
            println(">> 连接成功！设备 UUID: ${ctrl.getUuid()}")
            let (w, h) = ctrl.getResolution()
            println(">> 设备屏幕分辨率: ${w}x${h}")

            // 测试真机截屏
            let capJob = ctrl.postScreencap()
            let capStatus = capJob.wait()
            println(">> 截屏完成，状态: ${capStatus}")
            match (ctrl.cachedImage()) {
                case Some(img) =>
                    println(">> 成功获取真机图像！尺寸: ${img.width()}x${img.height()}，空状态: ${img.isEmpty()}")
                    let savePath = "screenshot.png"
                    if (img.save(savePath)) {
                        let absPath = canonicalize(savePath).toString()
                        println(">> 真机截图已保存，绝对路径: ${absPath}")
                    } else {
                        println(">> 图像保存失败")
                    }
                    img.destroy()
                case None => println(">> 未获取到截屏图像")
            }
        }
        tasker.bind(ctrl)
    }

    // 4. 加载资源包 (resource/pipeline/sample.json)
    let res = MaaResource()
    let resJob = res.postPath("./resource")
    let resStatus = resJob.wait()
    println(">> 资源包加载完成，状态: ${resStatus}")

    tasker.bind(res)
    println(">> Tasker 流水线组装完成，就绪状态: ${tasker.inited()}")

    // 5. 执行流水线任务
    let taskJob = tasker.postTask("Startup")
    let taskStatus = taskJob.wait()
    println(">> 任务 'Startup' 执行结束，状态: ${taskStatus}")

    // 6. 查询任务详情
    match (taskJob.get()) {
        case Some(detail) => println(">> 任务详情: ${detail}")
        case None => ()
    }

    // 7. 释放资源
    tasker.destroy()
    res.destroy()

    println("==========================================")
    println(">> 快速开始执行成功！")
}

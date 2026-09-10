package quickstart

import maa.*

main() {
    println("==========================================")
    println("   MaaFramework 仓颉快速开始 (QuickStart) ")
    println("==========================================")

    // 1. 打印底层引擎版本
    println(">> 引擎版本: ${Global.version()}")

    // 2. 初始化 Tasker 调度器
    let tasker = Tasker()

    // 3. 查找 ADB 设备（若连接了模拟器则自动绑定）
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println(">> 未检测到运行中的 ADB 设备/模拟器 (跳过设备连接)")
    } else {
        let device = devices[0]
        println(">> 发现设备: ${device.name} [${device.serial}]")

        let ctrl = AdbController(
            device.serial,
            device.config,
            adbPath: device.address,
            screencapMethods: device.screencapMethods,
            inputMethods: device.inputMethods
        )
        ctrl.postConnect().wait()
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

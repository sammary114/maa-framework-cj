package quickstart

import maa.*

main() {
    println("==========================================")
    println("   MaaFramework-Cj High-Level OOP Demo    ")
    println("==========================================")

    // 1. Check SDK & Core Engine Version
    println(">> MaaFramework Version: ${Global.version()}")

    // 2. Discover ADB Devices
    println(">> Scanning for ADB devices...")
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println("   No ADB devices found (connect an emulator/device to run tasks).")
    } else {
        println("   Found ${devices.size} device(s):")
        for (dev in devices) {
            println("   - Name: ${dev.name}, Serial: ${dev.serial}, Config: ${dev.config}")
        }
    }

    // 3. Create High-Level Pipeline Components
    let res = MaaResource()
    let tasker = Tasker()
    let bindOk = tasker.bind(res)
    println(">> Tasker & Resource assembled: ${bindOk}")

    // 4. Test String & Image Buffers
    let strBuf = StringBuffer()
    strBuf.set("MaaFramework Cangjie Binding Active")
    println(">> Buffer check: '${strBuf.get()}' (size: ${strBuf.size()})")

    // 5. Cleanup
    strBuf.destroy()
    tasker.destroy()
    res.destroy()

    println("==========================================")
    println(">> Demo finished successfully!")
}

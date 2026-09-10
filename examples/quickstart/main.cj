package quickstart

import maa.ffi.*

main() {
    println("==========================================")
    println("   MaaFramework-Cj QuickStart HelloWorld  ")
    println("==========================================")

    let version = unsafe { MaaVersion_wrap() }
    println(">> Native MaaFramework Version: ${version.toString()}")
    println(">> FFI dynamic linking succeeded!")
}

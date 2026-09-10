package maa

import std.unittest.*
import std.unittest.testmacro.*
import maa.ffi.*

@Test
class VersionTest {
    @TestCase
    func testMaaVersion(): Unit {
        let ver = unsafe { MaaVersion_wrap() }
        println("=== MaaFramework Version: ${ver.toString()} ===")
        @Assert(!ver.toString().isEmpty())
    }
}

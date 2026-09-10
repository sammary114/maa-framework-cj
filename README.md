# MaaFramework Cangjie 绑定 (maa-framework-cj)

[MaaFramework](https://github.com/MaaXYZ/MaaFramework) 的 **Cangjie (仓颉)** 语言绑定 SDK 框架。

本框架遵循 **MaaFramework 官方文档《4.2 标准化接口设计》规范**，为仓颉开发者提供类型安全、面向对象、内存安全的自动化测试与图像识别开发体验。

> **🚀 零手动胶水代码！** 基于 [cjbind](https://github.com/cjbind/cjbind) 自动化解析 C 头文件生成强类型仓颉 FFI 绑定，下游集成无需安装任何 C 编译器或代码生成工具，开箱即用。

---

## ✨ 核心特性

- **自动化 FFI 绑定** - 基于 [cjbind](https://github.com/cjbind/cjbind) 解析生成，与 MaaFramework 原生 C API 保持严格同步与类型安全
- **标准 OOP 架构** - 面向对象封装，提供 `Resource` / `MaaResource`、`Controller`（ADB / Win32）、`Tasker`、`Instance` 等核心对象
- **强类型异步 Job 体系** - 提供 `TaskJob`、`ResJob`、`CtrlJob` 异步任务调度与状态同步（`.wait()`、`.status()`、`.isDone()`）
- **设备与窗口扫描** - 内置 `AdbDeviceFinder`（自动扫描 ADB 设备）与 `DesktopWindowFinder`（扫描桌面窗口）
- **内存安全 RAII** - 自动管理 `StringBuffer`、`StringListBuffer`、`ImageBuffer` 原生缓冲区生命周期
- **自定义扩展机制** - 支持继承 `CustomRecognition` 与 `CustomAction` 编写纯仓颉自定义识别与动作算法
---

## 🚀 快速上手

### 1. 在你的项目中添加依赖 (`cjpm.toml`)

```toml
[dependencies]
maa = { path = "path/to/maa-framework-cj" }
```

### 2. 编写自动化业务代码

```cangjie
package my_automation

import maa.*

main() {
    println("MaaFramework Version: ${Global.version()}")

    // 1. 自动扫描并获取 ADB 设备
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println("未找到可用 ADB 设备")
        return
    }

    // 2. 连接控制器
    let ctrl = AdbController(devices[0].serial, devices[0].config)
    ctrl.postConnect().wait()

    // 3. 加载流水线资源
    let res = MaaResource()
    res.postPath("./resource").wait()

    // 4. 组装 Tasker 并运行任务
    let tasker = Tasker()
    tasker.bind(res)
    tasker.bind(ctrl)

    let job = tasker.postTask("Start")
    let status = job.wait()
    println("任务执行结束，状态: ${status}")

    // 5. 释放资源
    tasker.destroy()
    ctrl.destroy()
    res.destroy()
}
```

---

## 📂 模块导览

| 模块名 | 作用说明 | 常用类 / 结构体 |
|:---|:---|:---|
| **`maa.core`** | 核心 OOP 业务组件 | `MaaResource`, `Tasker`, `Controller`, `AdbController`, `Win32Controller`, `Instance`, `Global` |
| **`maa.job`** | 异步任务与状态轮询 | `Job<T>`, `TaskJob`, `ResJob`, `CtrlJob` |
| **`maa.types`** | 基础领域类型与几何模型 | `Rect`, `Point`, `Status`, `JobStatus`, `AdbDevice`, `DesktopWindow` |
| **`maa.buffer`** | 内存安全缓冲区封装 | `StringBuffer`, `StringListBuffer`, `ImageBuffer` |
| **`maa.toolkit`**| 设备与桌面窗口查找工具 | `AdbDeviceFinder`, `DesktopWindowFinder` |
| **`maa.custom`** | 自定义算法扩展钩子 | `Context`, `CustomRecognition`, `CustomAction` |

---

## 🛠️ 本地开发、环境自检与测试（面向框架贡献者）

如果你参与本框架的开发或进行单元测试，可使用内置工具进行全套自检与构建：

```powershell
# 1. 一键环境自检 (检查 cjc / cjpm / cjbind / MaaFramework 依赖与 PATH 状态)
./tools/check_env.ps1

# 2. 一键拉取依赖 (MaaFramework 动态库与头文件)
./tools/fetch_maafw.ps1

# 3. 生成/更新底层 FFI (需安装 cjbind)
./tools/gen_bindings.ps1

# 4. 运行全量单元测试
$env:PATH = "$PWD\deps\bin;$env:PATH"
cjpm test --show-all-output --no-progress
```

### 💡 常见问题与排错提示

| 现象 | 可能原因 | 解决办法 |
|:---|:---|:---|
| `cjc / cjpm: command not found` | 仓颉编译器未配置或未安装 | 安装 Cangjie SDK LTS 1.0.5+ 或配置 `cjv envsetup` |
| `MaaFramework.dll not found` | 运行期动态链接器找不到 DLL | 运行 `$env:PATH = "$PWD\deps\bin;$env:PATH"` 或将 DLL 放置于程序同级目录 |
| `cjbind: stdint.h not found` | Windows 系统未安装或未检测到 Clang 基础头文件 | 安装 LLVM 或运行 `./tools/fetch_maafw.ps1` 后由脚本自动寻找系统编译器头文件 |

---

## 📄 开源协议

本项目采用 [Apache-2.0](LICENSE) 协议开源。

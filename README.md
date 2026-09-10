# MaaFramework Cangjie 绑定 (maa-framework-cj)

[MaaFramework](https://github.com/MaaXYZ/MaaFramework) 的 **Cangjie (仓颉)** 语言绑定 SDK 框架。

本框架遵循 **MaaFramework 4.2+ / 5.x 标准化接口设计规范**，为仓颉开发者提供类型安全、面向对象、内存安全的自动化测试与图像识别开发体验。

> **🚀 极简集成**：下游应用只需在 `cjpm.toml` 中引入依赖并 `import maa.*`，即可调用全套 MaaFramework 核心能力。

---

## ✨ 核心特性

- **面向对象封装** - 提供 `Resource` / `MaaResource`、`Controller`（ADB / Win32）、`Tasker`、`Instance` 等核心对象
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

## 🛠️ 本地开发与测试（面向框架贡献者）

如果你参与本框架的开发或进行单元测试：

```powershell
# 1. 一键拉取测试依赖 (MaaFramework 动态库)
./tools/fetch_maafw.ps1

# 2. 生成/更新底层 FFI (需安装 cjbind)
./tools/gen_bindings.ps1

# 3. 运行全量单元测试
$env:PATH = "$PWD\deps\bin;C:\Users\sammary\.cjv\bin;$env:PATH"
cjpm test --show-all-output --no-progress
```

---

## 📄 开源协议

本项目采用 [Apache-2.0](LICENSE) 协议开源。

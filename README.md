<!-- markdownlint-disable MD033 MD041 -->
<p align="center">
  <img alt="LOGO" src="https://cdn.jsdelivr.net/gh/MaaAssistantArknights/design@main/logo/maa-logo_512x512.png" width="180" height="180" />
</p>

<h1 align="center">MaaFramework 仓颉语言绑定 (maa-framework-cj)</h1>

<div align="center">
  <a href="https://github.com/sammary114/maa-framework-cj/actions/workflows/ci.yml">
    <img alt="CI" src="https://github.com/sammary114/maa-framework-cj/actions/workflows/ci.yml/badge.svg">
  </a>
  <img alt="Cangjie" src="https://img.shields.io/badge/Cangjie-LTS_1.0.5-blue?logo=cangjie">
  <a href="https://github.com/MaaXYZ/MaaFramework/releases/tag/v5.13.0">
    <img alt="MaaFramework" src="https://img.shields.io/badge/MaaFramework-v5.13.0-brightgreen">
  </a>
  <a href="LICENSE">
    <img alt="License" src="https://img.shields.io/badge/License-Apache_2.0-orange">
  </a>
  <a href="https://github.com/sammary114/maa-framework-cj/actions/workflows/ci.yml">
    <img alt="Tests" src="https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/sammary114/maa-framework-cj/badges/test-badge.json">
  </a>
</div>

<br />

[MaaFramework](https://github.com/MaaXYZ/MaaFramework) 的 **Cangjie (仓颉)** 语言社区开源绑定 SDK。MaaFramework 是一个基于图像识别的高性能跨平台自动化测试与控制框架。

本 SDK 由社区开发者与爱好者维护，严格遵循 **MaaFramework《4.2 标准化接口设计》规范**，为仓颉开发者提供安全、面向对象、强类型的自动化开发体验。

> **🚀 零手动胶水代码！** 基于 [cjbind](https://github.com/cjbind/cjbind) 自动化解析 C 头文件生成强类型仓颉 FFI 绑定，下游集成无需安装 C 编译器或任何中间代码生成工具，开箱即用。

---

## ✨ 核心特性

- **自动化 FFI 绑定** - 基于 `cjbind` 自动化管道生成，与 MaaFramework 原生 C API 保持严格同步与强类型保证
- **标准 OOP 架构** - 高层面向对象封装，提供 `Resource`、`Controller`（ADB / Win32）、`Tasker`、`Instance` 等核心对象与 RAII 句柄管理
- **强类型流水线建模 (`maa.pipeline`)** - 告别手动拼接易错的 JSON！支持以流式纯代码链式构建 `Pipeline`、`Node`、`Recognition` 与 `Action`
- **原生事件监听与实时回调 (Sinks)** - 线程安全回调总线，支持 `tasker.onNodeStarting(...)` 等高阶监听及标准 `MaaMsg` 事件订阅
- **录制、回放与脱机调试** - 内置 `RecordController`（动作录制为 JSONL）、`ReplayController`（脱机回放）与 `DbgController`（纯图片调试）
- **真机截屏与图像安全持久化** - 支持真机/桌面截屏、分辨率获取与 `ImageBuffer.save(path)` 自动覆盖写入
- **强类型异步 Job 体系** - 提供 `TaskJob`、`ResJob`、`CtrlJob` 统一调度体系，封装状态查询（`.wait()`、`.status()`、`.get()`）
- **深度任务链路解析** - 支持递归节点解析与结构化详情查询（`TaskDetail`、`NodeDetail`、`RecoDetail`、`ActionDetail`）
- **设备与桌面扫描** - 内置 `AdbDeviceFinder`（自动扫描 ADB 设备/模拟器）与 `DesktopWindowFinder`（扫描桌面窗口）
- **内存安全 RAII** - 自动管理 `StringBuffer`、`StringListBuffer`、`ImageBuffer` 原生缓冲区，零内存泄漏
- **自定义算法扩展** - 支持继承 `CustomRecognition` 与 `CustomAction` 编写纯仓颉自定义识别与动作算法

---

## 🚀 快速上手

### 1. 在你的项目中添加依赖 (`cjpm.toml`)

```toml
[dependencies]
maa = { path = "path/to/maa-framework-cj" }
```

---

### 2. 方式 A：现代强类型内存流水线（推荐，无需本地 JSON 资源）

你可以使用 `maa.pipeline` 在代码中直接流式声明节点识别算法与动作逻辑，并在内存中直接调度：

```cangjie
package my_automation

import maa.*

main() {
    println("MaaFramework 引擎版本: ${Global.version()}")

    // 1. 扫描并连接 ADB 设备 / 模拟器
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println("未找到可用的 ADB 设备")
        return
    }
    let ctrl = AdbController(devices[0].serial, devices[0].config)
    ctrl.postConnect().wait()

    // 2. 纯代码构建强类型流水线 (Universal Pipeline v2)
    let pipeline = Pipeline()

    pipeline.node("Startup")
        .templateMatch("start_button.png", threshold: 0.8)
        .click()
        .next(["HomeNode"])
        .rateLimit(1000)

    pipeline.node("HomeNode")
        .ocr(expected: ["首页", "主城"])
        .doNothing()

    // 3. 组装调度器并注册实时事件监听
    let res = MaaResource()
    let tasker = Tasker()
    tasker.bind(res)
    tasker.bind(ctrl)

    tasker.onNodeStarting { details => println(">> 节点开始: ${details}") }
    tasker.onNodeSucceeded { details => println(">> 节点成功: ${details}") }

    // 4. 直接传入强类型流水线对象调度执行
    let job = tasker.postTask("Startup", pipeline)
    let status = job.wait()
    println("任务完成状态: ${status}")

    // 5. 释放资源
    tasker.destroy()
    ctrl.destroy()
    res.destroy()
}
```

---

### 3. 方式 B：传统模式（从本地目录加载流水线与资源包）

如果你的项目中已有成熟的 MaaFramework 资源文件夹（包含 `pipeline/`、`image/` 等）：

```cangjie
package my_automation

import maa.*

main() {
    let ctrl = Win32Controller(0) // 连接桌面或指定窗口 HWND
    ctrl.postConnect().wait()

    let res = MaaResource()
    res.postPath("./assets/resource").wait() // 加载外部资源包

    let tasker = Tasker()
    tasker.bind(res)
    tasker.bind(ctrl)

    let job = tasker.postTask("MainTask")
    job.wait()

    // 获取任务执行的深层结构化报告
    match (job.get()) {
        case Some(detail) =>
            println("任务已执行完成，累计执行节点数: ${detail.nodes.size}")
        case None => ()
    }

    tasker.destroy()
    ctrl.destroy()
    res.destroy()
}
```

---

### 4. 设备截屏与一键持久化

```cangjie
// 截屏并自动将编码后的图像覆盖保存至本地文件
let capJob = ctrl.postScreencap()
if (capJob.wait().isSucceeded()) {
    match (ctrl.cachedImage()) {
        case Some(img) =>
            println("截图成功，尺寸: ${img.width()}x${img.height()}")
            img.save("screenshot.png") // 自动覆盖写入 PNG
            img.destroy()
        case None => ()
    }
}
```

---

## 📂 模块导览

| 模块名 | 作用说明 | 核心类 / 结构体 / 接口 |
|:---|:---|:---|
| **`maa.core`** | 核心 OOP 业务组件与各种控制器 | `MaaResource`, `Tasker`, `Controller`, `AdbController`, `Win32Controller`, `RecordController`, `ReplayController`, `DbgController`, `Instance`, `Global` |
| **`maa.pipeline`** | 强类型流水线与节点建模系统 | `Pipeline`, `Node`, `Recognition`, `Action` |
| **`maa.job`** | 强类型异步任务与状态轮询 | `Job<T>`, `TaskJob`, `ResJob`, `CtrlJob` |
| **`maa.types`** | 几何模型、状态枚举、事件常量与详情结构 | `Rect`, `Point`, `Status`, `MaaMsg`, `TaskDetail`, `NodeDetail`, `RecoDetail`, `ActionDetail`, `AdbDevice`, `DesktopWindow` |
| **`maa.buffer`** | 内存安全缓冲区封装与文件持久化 | `StringBuffer`, `StringListBuffer`, `ImageBuffer` |
| **`maa.toolkit`** | 设备发现与桌面窗口查找工具 | `AdbDeviceFinder`, `DesktopWindowFinder` |
| **`maa.custom`** | 运行时上下文与纯仓颉算法扩展钩子 | `Context`, `CustomRecognition`, `CustomAction` |

---

## 🛠️ 本地开发、环境自检与测试（面向框架贡献者）

如果你参与本框架的开发或进行单元测试，可以使用内置工具进行跨平台自检、依赖拉取与构建：

### Windows (PowerShell)

```powershell
# 1. 一键环境自检 (检查 cjc / cjpm / cjbind / MaaFramework 依赖与 PATH 状态)
./tools/check_env.ps1

# 2. 一键拉取依赖 (自动下载预编译 MaaFramework 动态库与头文件到 deps/)
./tools/fetch_maafw.ps1

# 3. 生成/更新底层 FFI 绑定 (需安装 cjbind)
./tools/gen_bindings.ps1

# 4. 运行全量单元测试 (21 项自动化测试)
$env:PATH = "$PWD\deps\bin;$env:PATH"
cjpm test --show-all-output --no-progress
```

### Linux / macOS (Bash)

```bash
# 1. 一键环境自检
chmod +x ./tools/*.sh
./tools/check_env.sh

# 2. 一键拉取依赖
./tools/fetch_maafw.sh

# 3. 生成/更新底层 FFI 绑定
./tools/gen_bindings.sh

# 4. 运行全量单元测试
export LD_LIBRARY_PATH="$(pwd)/deps/bin:$(pwd)/deps/lib:${LD_LIBRARY_PATH:-}"
cjpm test --show-all-output --no-progress
```

---

## 💡 常见问题与排错提示

| 现象 | 可能原因 | 解决办法 |
|:---|:---|:---|
| `cjc / cjpm: command not found` | 仓颉编译器未配置或未安装 | 安装 Cangjie SDK LTS 1.0.5+ 或使用 [cjv](https://github.com/Zxilly/cjv) 一键安装 |
| `MaaFramework.dll not found` | 运行期动态链接器找不到 DLL | 运行 `$env:PATH = "$PWD\deps\bin;$env:PATH"` 或将 DLL 放置于程序同级目录 |
| `cannot find package 'maa.pipeline'` | cjpm 增量编译索引未刷新 | 运行 `cjpm clean && cjpm build` 清理重构 |
| `cjbind: stdint.h not found` | 系统未安装或未检测到 Clang 头文件 | 安装 LLVM 或运行 `./tools/fetch_maafw.ps1` 后由脚本自动寻找系统编译器头文件 |

---

## 💖 Credits & Acknowledgements

本项目在开发过程中，深受以下开源项目与社区生态的启发与支持，特此致谢：

- **[MaaFramework](https://github.com/MaaXYZ/MaaFramework)** - 强大的跨平台图像识别与自动化核心，以及清晰指导本项目架构的《4.2 标准化接口设计》规范。
- **[Cangjie Programming Language](https://cangjie-lang.cn/)** - 仓颉编程语言及官方工具链团队。
- **[cjbind](https://github.com/cjbind/cjbind)** - 自动化 C 头文件 FFI 生成工具，实现零手动维护胶水代码。
- **[maa-fw-go](https://github.com/MaaXYZ/maa-framework-go)** - 为本项目的强类型流水线建模、领域抽象与文档结构提供了极高价值的参考实现。
- **[cjv](https://github.com/Zxilly/cjv)** - 优雅实用的仓颉多版本环境管理工具，大幅简化了跨平台工具链配置。
- **[setup-cangjie](https://github.com/Zxilly/setup-cangjie)** - 针对 GitHub Actions 的仓颉环境自动化配置 Action。
- **[universal-agent-rules](https://github.com/coderluojz/universal-agent-rules)** - 为本项目的多 Agent 工程行为纪律、交付自闭环与 Harness 生态矩阵提供了通用规范参考。
- **[MaaAssistantArknights](https://github.com/MaaAssistantArknights/MaaAssistantArknights)** - 孕育 MaaFramework 生态的原初项目与视觉设计支持。

---

## 📄 开源协议

本项目采用 [Apache-2.0](LICENSE) 协议开源。



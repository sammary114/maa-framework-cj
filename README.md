# MaaFramework Cangjie 绑定 (maa-framework-cj)

[MaaFramework](https://github.com/MaaXYZ/MaaFramework) 的 **Cangjie (仓颉)** 语言绑定 SDK。MaaFramework 是一个基于图像识别的高性能跨平台自动化测试框架。

基于 **MaaFramework 4.2+ / 5.x 标准化接口设计规范** 实现。

> **🚀 原生高性能 FFI！** 基于 `cjbind` 自动化代码生成，提供编译期强类型安全与直接调用性能。

---

## ✨ 特性

- **标准 OOP 架构** - 面向对象封装，提供 `Resource` / `MaaResource`、`Controller`、`Tasker`、`Instance` 等核心对象
- **跨平台控制器** - 支持 ADB 控制器与 Win32 桌面控制器后端
- **强类型异步 Job 体系** - 提供 `Job<T>`、`TaskJob`、`ResJob`、`CtrlJob` 异步任务同步与状态查询（`.wait()`、`.status()`、`.isDone()`）
- **Toolkit 工具能力** - 支持自动发现 ADB 设备（`AdbDeviceFinder`）与桌面窗口（`DesktopWindowFinder`）
- **内存安全 RAII** - 封装 `StringBuffer`、`StringListBuffer`、`ImageBuffer` 自动内存释放，C-String 安全转换
- **自定义扩展** - 支持以纯仓颉实现自定义识别（`CustomRecognition`）与自定义动作（`CustomAction`）
- **极简下游导入** - 下游应用仅需 `import maa.*` 即可直接使用全部高级 API

---

## 📦 安装与准备

### 1. 安装仓颉 SDK 与 cjbind

1. 安装 [Cangjie 仓颉 SDK](https://cangjie-lang.cn/)（推荐 LTS 1.0.5+）；
2. 安装 [cjbind](https://cjbind.zxilly.dev/)（仅在需要重新生成 FFI 绑定时必需）：
   ```powershell
   irm https://cjbind.zxilly.dev/install.ps1 | iex
   ```

### 2. 下载 MaaFramework 依赖

根据你的平台下载 [MaaFramework Release](https://github.com/MaaXYZ/MaaFramework/releases) 并解压。

| 平台 | 架构 | 下载包名 |
|:---|:---|:---|
| Windows | x86_64 | `MAA-win-x86_64-*.zip` |
| Windows | aarch64 | `MAA-win-aarch64-*.zip` |
| Linux | x86_64 | `MAA-linux-x86_64-*.zip` |
| Linux | aarch64 | `MAA-linux-aarch64-*.zip` |
| macOS | x86_64 / arm64 | `MAA-macos-*.zip` |

> **💡 开发期一键拉取脚本**：
> 本仓库提供了自动拉取脚本，可自动下载并解压至 `.gitignore` 保护的 `deps/` 目录：
> ```powershell
> # Windows (PowerShell)
> ./tools/fetch_maafw.ps1 [-Mirror]
>
> # Linux / macOS (Bash)
> ./tools/fetch_maafw.sh
> ```

---

## ⚙️ 运行时要求与分发方案

使用 `maa-framework-cj` 构建的程序在运行期需要加载 MaaFramework 动态库（`MaaFramework.dll` / `libMaaCore.so` / `libMaaCore.dylib`）。你有以下几种标准方案：

1. **同级工作目录打包（推荐：绿色免安装包）**
   - 将编译出的应用程序可执行文件与 `deps/bin/` 下的动态库放在同一目录下压缩打包发布；
   - 最终用户解压即可直接运行，无需安装任何额外运行时。

2. **环境变量**
   - 将 MaaFramework 动态库所在目录添加到系统环境变量：
     - Windows：添加到 `PATH`；
     - Linux / macOS：添加到 `LD_LIBRARY_PATH` / `DYLD_LIBRARY_PATH`。

3. **插件 / Agent 运行模式**
   - 作为 MAA 官方桌面端或命令行工具的扩展插件运行时，会自动继承宿主环境自带的动态库。

---

## 🚀 快速开始

在 `cjpm.toml` 中添加依赖后：

```cangjie
package my_app

import maa.*

main() {
    println("MaaFramework Version: ${Global.version()}")

    // 1. 自动扫描 ADB 设备
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println("未找到 ADB 设备")
        return
    }

    // 2. 连接控制器
    let ctrl = AdbController(devices[0].serial, devices[0].config)
    ctrl.postConnect().wait()

    // 3. 加载资源包
    let res = MaaResource()
    res.postPath("./resource").wait()

    // 4. 组装流水线 Tasker 并执行
    let tasker = Tasker()
    tasker.bind(res)
    tasker.bind(ctrl)

    let job = tasker.postTask("Start")
    let status = job.wait()
    println("任务执行完成，状态: ${status}")

    // 5. 释放资源
    tasker.destroy()
    ctrl.destroy()
    res.destroy()
}
```

---

## 📖 示例与测试

- [examples/quickstart](examples/quickstart) - 完整的下游独立工程调用范例（可执行 `cjpm run` 验证）
- [src/sdk_test.cj](src/sdk_test.cj) - 覆盖 9 个核心模块的全量单元测试（可执行 `cjpm test` 验证）

---

## 📚 文档与协议规范

- [MaaFramework 官方文档](https://maafw.com/)
- [MaaFramework 4.2 标准化接口设计](https://github.com/MaaXYZ/MaaFramework/blob/main/docs/zh_cn/4.2-%E6%A0%87%E5%87%86%E5%8C%96%E6%8E%A5%E5%8F%A3%E8%AE%BE%E8%AE%A1.md)
- [Cangjie 官方文档与 CangjieSkills](https://cangjie-lang.cn/)

---

## 📄 开源协议

本项目采用 [Apache-2.0](LICENSE) 协议开源。

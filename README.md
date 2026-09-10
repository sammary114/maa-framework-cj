# maa-framework-cj

Cangjie (仓颉) language binding for **[MaaFramework](https://github.com/MaaXYZ/MaaFramework)**.

基于 MaaFramework 4.2 标准化接口设计规范实现的仓颉语言绑定 SDK。

## 特性

- 🚀 **标准 OOP 设计**：面向对象封装，支持强类型 `Job` 异步体系、自动内存与句柄管理（RAII）。
- 📦 **自动 FFI 生成**：基于 `cjbind` 自动化解析 C 头文件生成 FFI 绑定，零手动胶水代码维护成本。
- 🧩 **全功能覆盖**：支持 ADB / Win32 控制器、资源管理、流水线调度、自定义识别/动作扩展及 Toolkit 设备扫描。

## 目录结构

```text
maa-framework-cj/
├── cjpm.toml                   # 仓颉工程配置文件
├── tools/                      # 辅助工具与脚本
│   ├── fetch_maafw.ps1         # Windows 自动拉取 MaaFramework 发行包
│   ├── fetch_maafw.sh          # Linux / macOS 自动拉取 MaaFramework 发行包
│   ├── gen_bindings.ps1        # Windows FFI 自动化生成脚本 (cjbind)
│   └── gen_bindings.sh         # Linux / macOS FFI 自动化生成脚本 (cjbind)
├── src/                        # 核心源代码
│   ├── ffi/                    # 底层 C API 绑定 (cjbind 自动生成)
│   ├── types/                  # 基础类型 (Rect, Status 等)
│   ├── buffer/                 # 缓冲区封装 (StringBuffer, ImageBuffer)
│   ├── job/                    # Job 异步任务体系 (TaskJob, ResJob, CtrlJob)
│   ├── core/                   # 核心 OOP 封装 (Resource, Controller, Tasker, Instance)
│   ├── custom/                 # 自定义扩展与 C Agent 代理
│   └── toolkit/                # MaaToolkit 辅助工具 (AdbFinder)
└── examples/                   # 示例程序
    └── quickstart/
```

## 快速上手

### 1. 前置准备

1. 安装 [Cangjie 仓颉 SDK](https://cangjie-lang.cn/)；
2. 安装 [cjbind](https://cjbind.zxilly.dev/)（仅在需要重新生成 FFI 绑定时必需）；
3. 运行依赖拉取脚本自动下载 MaaFramework 预编译产物与头文件（保存至 `.gitignore` 忽略的 `deps/` 目录）：
   ```powershell
   # Windows (PowerShell)
   ./tools/fetch_maafw.ps1

   # Linux / macOS (Bash)
   ./tools/fetch_maafw.sh
   ```

### 2. 生成/更新 FFI 绑定

```powershell
# Windows (PowerShell)
./tools/gen_bindings.ps1

# Linux / macOS (Bash)
./tools/gen_bindings.sh
```
### 3. 代码示例

```cangjie
import maa.core.*
import maa.toolkit.*
import maa.job.*

main() {
    // 1. 查找 ADB 设备
    let devices = AdbDeviceFinder.find()
    if (devices.isEmpty()) {
        println("未找到 ADB 设备")
        return
    }

    // 2. 连接控制器
    let ctrl = AdbController(devices[0].serial, devices[0].config)
    ctrl.postConnect().wait()

    // 3. 加载资源
    let res = Resource()
    res.postPath("./resource").wait()

    // 4. 组装 Tasker 并运行
    let tasker = Tasker()
    tasker.bind(res)
    tasker.bind(ctrl)

    let job = tasker.postTask("Start")
    let status = job.wait()
    println("任务执行完成: ${status}")
}
```

## 开源协议

本项目采用 [Apache-2.0](LICENSE) 协议开源。

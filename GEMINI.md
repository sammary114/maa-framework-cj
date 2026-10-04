# Google Antigravity Guidelines for maa-framework-cj

This repository follows standardized AI agent guidelines. **The Single Source of Truth (SSOT) is [AGENTS.md](./AGENTS.md).**
Always read and strictly adhere to `AGENTS.md` before analyzing, editing, or testing code.

## Critical Highlights

1. **Architecture & Standards**:
   - Strictly adhere to **MaaFramework Chapter 4.2 Standardized Interface Design**.
   - Encapsulate native C handles into object-oriented Cangjie abstractions (`MaaResource`, `Controller`, `Tasker`, `Pipeline`).
   - Wrap asynchronous task IDs into `Job<T>` (`TaskJob`, `ResJob`, `CtrlJob`)—never expose raw IDs to end users.
   - Enforce RAII memory safety—ensure buffers and handles call `.destroy()`.

2. **Core Agent Guardrails**:
   - **Zero Collateral Changes (零附带改动原则)**: Confine changes strictly to task targets. Never format untouched files, reorder imports, or tamper with untouched functions/comments.
   - **Full Context Verification (完整上下文验证)**: Always inspect target definitions in `src/ffi/maa_ffi.cj` or Cangjie docs before calling them. Never hallucinate signatures or field names.
   - **Self-Contained Verification (交付自闭环铁律)**: Run `cjpm test` / `cjpm build` before claiming completion, providing real command outputs as proof.

3. **Common Commands**:
   - Environment check: `./tools/check_env.ps1` (Win) or `./tools/check_env.sh` (Linux/macOS)
   - Build SDK: `cjpm build`
   - Run all tests (21 tests):
     - Windows (PowerShell): `$env:PATH = "$PWD\deps\bin;$env:PATH"; cjpm test --show-all-output --no-progress`
     - Linux/macOS (Bash): `export LD_LIBRARY_PATH="$(pwd)/deps/bin:$(pwd)/deps/lib:${LD_LIBRARY_PATH:-}"; cjpm test --show-all-output --no-progress`

4. **Cangjie Language Specifics**:
   - Cangjie LTS 1.0.5 (`cjc`, `cjpm`).
   - Use `type Resource = MaaResource` to avoid conflict with `std.core.Resource`.
   - String runes: `for (ch in s.runes())` for character iteration (`for (ch in s)` iterates raw `Byte`).
   - File overwrite: `File.writeTo(path, bytes)`.
   - Query exact standard library signatures: Use `python .agents/skills/cangjie-coding/scripts/search_docs.py --query "<term>"`.

5. **Git Workflow**:
   - **Review & Confirm Mode (显式授权提交铁律)**: Always report a summary of changes, test verification results, and proposed commit message to the user, and wait for explicit confirmation (e.g. "commit" or "提交") before running `git commit`.

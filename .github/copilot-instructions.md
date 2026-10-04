# GitHub Copilot Instructions for maa-framework-cj

This repository follows standardized AI agent guidelines. **The Single Source of Truth (SSOT) is `AGENTS.md`.**
Always refer to and strictly adhere to `AGENTS.md` for project architecture, code conventions, and workflows.

## Key Directives

- **Language**: Cangjie (仓颉) LTS 1.0.5 (`cjc`, `cjpm`).
- **Domain Modeling**: Follow MaaFramework Chapter 4.2 Standardized Interface Design.
- **Disambiguation**: Use `type Resource = MaaResource` (avoid namespace collisions with `std.core.Resource`).
- **Memory Safety**: Enforce RAII on native handles (`StringBuffer`, `StringListBuffer`, `ImageBuffer`, `Tasker`, `Resource`, `Controller`).
- **Core Guardrails**: Zero collateral changes (do not touch unrelated files), full context verification (read definitions before calls), self-contained verification (`cjpm test`).
- **Verification**: Run tests with `cjpm test --show-all-output --no-progress`.
- **Workflow**: Strictly adhere to Review & Confirm Mode (显式授权提交铁律) before creating git commits.

# openClaw-backup

> 宝宝的 AI 助手（OpenClaw）工作区自动备份仓库

## 📦 仓库简介

本仓库是 OpenClaw AI 助手工作区的自动备份，由每日凌晨 3:00 的定时任务自动驱动。每次备份会自动生成压缩包、更新备份记录，并推送到 GitHub，确保工作区数据安全不丢失。

## 🗂️ 备份内容

| 类别 | 说明 |
|------|------|
| **配置文件** | `openclaw.json` 等核心配置 |
| **身份与设定** | `SOUL.md`（人格）、`IDENTITY.md`（身份）、`USER.md`（用户信息） |
| **工作区规范** | `AGENTS.md`（工作规范）、`TOOLS.md`（工具笔记）、`HEARTBEAT.md`（心跳任务） |
| **记忆文件** | `memory/` 目录下的日常记录与长期记忆 |
| **技能（Skills）** | 所有已安装的 OpenClaw 技能 |
| **定时任务** | 定时任务配置与调度信息 |

> ⚠️ 备份已排除 `completions/` 缓存目录（自动生成）和日志文件（减小体积）

## 🧩 已安装技能

| 技能 | 功能 |
|------|------|
| `capability-evolver` | AI 自我进化引擎，持续分析与优化能力 |
| `find-skills` | 技能搜索与安装助手 |
| `openclaw-backup` | 备份与恢复管理 |
| `skill-vetter` | 技能安全审查，安装前风险评估 |
| `skillhub-preference` | 优先使用 skillhub 进行技能管理 |
| `self-improving-agent` | 自我反思与持续改进 |
| `self-improvement` | 学习、纠错与优化捕获 |
| `weather` | 天气预报 |
| `windows-screenshot` | Windows 截图工具 |
| `xiucheng-self-improving-agent` | 个性化自我改进 |
| `agent-browser-core` | 浏览器自动化（Rust + Playwright）|
| `office-editor` | Word/Excel/PowerPoint 文件创建与编辑 |
| `office-document-editor` | 专业 Word 编辑（修订模式、Git版本控制）|
| `office-toolkit` | Office 综合工具包（读写、格式转换、批量处理）|

> 📄 完整技能清单（含 CLI 依赖说明）见 `OpenClaw_技能CLI清单.md`（同步保存于桌面）

## ⏰ 定时任务

| 任务名 | 时间 | 状态 | 说明 |
|--------|------|------|------|
| 早安问候 | 每天 07:00–09:00 | error | 早间问候语 |
| 午间问候 | 每天 12:00–14:00 | ok | 午间问候语 |
| 晚间问候 | 每天 18:00–20:00 | ok | 晚间问候语 |
| 睡前问候 | 每天 21:00–22:00 | ok | 睡前问候语 |
| 每日天气提醒 | 每天 08:00、19:00 | error | 天气信息推送 |
| **每日备份** | **每天 03:00** | **ok** | **自动备份并推送到 GitHub** |

## 🔄 备份流程

```
定时触发（每天 03:00 Asia/Shanghai）
    │
    ├── 运行 backup.sh → 生成 openclaw-YYYY-MM-DD_HHMM.tar.gz
    │
    ├── 更新 BACKUP.md 记录（时间、大小、路径）
    │
    ├── git add + git commit
    │
    └── git push origin master && main
```

## 🔧 本地恢复流程

```bash
# 1. 停止 Gateway
openclaw gateway stop

# 2. 备份当前目录
mv ~/.openclaw ~/.openclaw-old

# 3. 解压最新备份
tar -xzf ~/openclaw-backups/openclaw-YYYY-MM-DD_HHMM.tar.gz -C ~

# 4. 重启 Gateway
openclaw gateway start
```

## 📁 目录结构

```
~/.openclaw/
├── openclaw.json          # 主配置文件
├── credentials/            # API 密钥与凭证
├── agents/                # Agent 配置
├── workspace/             # ← 本仓库（工作区）
│   ├── SOUL.md            # 人格定义
│   ├── USER.md            # 用户信息
│   ├── AGENTS.md          # 工作规范
│   ├── TOOLS.md           # 工具笔记
│   ├── HEARTBEAT.md       # 心跳任务
│   ├── BACKUP.md          # 备份记录
│   ├── OpenClaw_技能CLI清单.md  # 技能与CLI依赖清单
│   ├── memory/            # 记忆文件
│   └── skills/            # 已安装技能
├── cron/                  # 定时任务配置
└── telegram/              # Telegram 会话数据
```

## 🔑 Git 配置

- **用户名：** shh32010
- **远程仓库：** git@github.com:shh32010/openClaw-backup.git
- **默认分支：** main
- **备份分支：** master（与 main 同步）

## 📝 备份记录格式

每次备份后，BACKUP.md 会追加以下格式记录：

```markdown
## 2026-04-03

| 时间 | 文件大小 | 路径 | 状态 |
|------|----------|------|------|
| 03:00 | 2.3 MB | ~/openclaw-backups/openclaw-2026-04-03_0300.tar.gz | ✅ 成功 |
```

---

_本文件由每日备份任务自动更新，最后更新于 2026-04-03_
>>>>>>> master

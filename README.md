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

## 🧩 已安装技能（64 个）

### 工作区技能（11 个）
*位于 `~/.openclaw/workspace/skills/`*

| 技能 | 功能 |
|------|------|
| `agent-browser-core` | 浏览器自动化（Rust + Playwright）|
| `bailian-web-search` | 阿里百灵网页搜索（AI 优化）|
| `capability-evolver` | AI 自我进化引擎，持续分析与优化能力 |
| `find-skills` | 技能搜索与安装助手 |
| `office-editor` | Word/Excel/PowerPoint 文件创建与编辑 |
| `office-document-editor` | 专业 Word 编辑（修订模式、Git 版本控制）|
| `office-toolkit` | Office 综合工具包（读写、格式转换、批量处理）|
| `openclaw-backup` | 备份与恢复管理 |
| `skill-vetter` | 技能安全审查，安装前风险评估 |
| `skillhub-preference` | 优先使用 skillhub 进行技能管理 |
| `windows-screenshot` | Windows 截图工具 |

### 全局内置技能（53 个）
*位于 `node_modules/openclaw/skills/`*

**Apple/macOS 专用（9 个）**
`apple-notes`、`apple-reminders`、`bluebubbles`、`imsg`、`peekaboo`、`things-mac`、`tmux`、`sherpa-onnx-tts`、`sag`

**智能家居/设备（5 个）**
`openhue`（飞利浦 Hue）、`blucli`（BluOS）、`sonoscli`（Sonos）、`camsnap`（摄像头）、`eightctl`（智能床）

**笔记/文档/待办（6 个）**
`notion`、`obsidian`、`bear-notes`、`trello`、`1password`、`taskflow`

**社交/消息（4 个）**
`discord`、`slack`、`wacli`（WhatsApp）、`xurl`（Twitter/X）

**开发/GitHub（7 个）**
`github`、`gh-issues`、`coding-agent`、`mcporter`、`oracle`、`session-logs`、`clawhub`

**AI/媒体（6 个）**
`gemini`、`summarize`、`video-frames`、`songsee`、`openai-whisper`、`gifgrep`

**云服务（3 个）**
`gog`（Google Workspace）、`goplaces`（Google Places）、`blogwatcher`

**邮件/通讯（2 个）**
`himalaya`（终端邮件）、`voice-call`

**音乐/播放（2 个）**
`spotify-player`、`ordercli`（外卖）

**实用工具（9 个）**
`weather`、`healthcheck`、`node-connect`、`skill-creator`、`model-usage`、`nano-pdf`、`taskflow-inbox-triage`、`canvas`、`openai-whisper-api`

> 📄 完整技能与 CLI 依赖清单（含安装命令）见 `OpenClaw_技能CLI清单.md`（同步保存于桌面）

## ⏰ 定时任务

| 任务名 | 时间 | 模型 | 状态 | 说明 |
|--------|------|------|------|------|
| 早安问候 | 每天 07:00–09:00 | claude-sonnet-4-6 | ✅ 正常 | 早间问候语 |
| 午间问候 | 每天 12:00–14:00 | claude-sonnet-4-6 | ✅ 正常 | 午间问候语 |
| 晚间问候 | 每天 18:00–20:00 | claude-sonnet-4-6 | ✅ 正常 | 晚间问候语 |
| 睡前问候 | 每天 21:00–22:00 | claude-sonnet-4-6 | ✅ 正常 | 睡前问候语 |
| 每日天气提醒 | 每天 08:00、19:00 | claude-sonnet-4-6 | ✅ 正常 | 天气信息推送 |
| **每日备份** | **每天 03:00** | claude-sonnet-4-6 | ✅ 正常 | **自动备份并推送到 GitHub** |

## 🔄 备份流程

```
定时触发（每天 03:00 Asia/Shanghai）
    │
    ├── 运行 backup-task.ps1 → 生成 openclaw-YYYY-MM-DD_HHMM.zip
    │
    ├── 更新 BACKUP.md 记录（时间、大小、路径）
    │
    ├── git add + git commit
    │
    └── git push origin master
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

## 🤖 模型配置

| 用途 | Provider | 模型 | 状态 |
|------|----------|------|------|
| **主模型** | gpt-agent.cc | `claude-sonnet-4-6` | ✅ 正常 |
| **备用模型** | Nvidia Nim | `nvidia/nemotron-3-super-120b-a12b` | ✅ 已配置 |

> 📌 定时任务统一使用 `claude-sonnet-4-6`；当主模型不可用时，自动切换到英伟达 Nim 平台。

---

## 📝 备份记录格式

每次备份后，BACKUP.md 会追加以下格式记录：

| 日期 | 时间 | 文件大小 | 备份文件路径 |
|------|------|----------|--------------|
| 2026-04-09 | 09:01 | 23.8 MB | `C:\Users\002\2026-04-09T01-01-35.398Z-openclaw-backup.tar.gz` |

---

_本文件由每日备份任务自动更新，最后更新于 2026-04-22_

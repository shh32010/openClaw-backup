# OpenClaw 技术 CLI 依赖清单

> 整理时间：2026-04-03（更新：2026-04-03 17:56）| 桌面路径：`D:\Users\002\Desktop`

---

## ✅ 已就绪（无需额外安装）

| 技能 | 说明 |
|------|------|
| clawflow / clawflow-inbox-triage | 多步骤任务流编排 |
| healthcheck | 主机安全检查 |
| node-connect | 设备连接诊断 |
| skill-creator | 技能创建与审核 |
| self-improvement | 自我改进与纠错 |
| self-improving-agent | 对话质量分析优化 |
| find-skills / skillhub-preference | 技能发现与安装 |
| weather | 天气查询 |
| windows-screenshot | Windows 截图 |
| clawhub | ClawHub 技能市场 CLI |
| capability-evolver | AI 自进化引擎（v1.40.2）|
| summarize | 文本/视频/网页内容摘要提取 |
| skill-vetter | 技能安全审查（安装前风险评估）|
| openclaw-backup | 备份与恢复（自动推送 GitHub）|
| agent-browser-core | 浏览器自动化（需 agent-browser CLI）|
| **office-editor** | Word/Excel/PowerPoint 文件创建与编辑 |
| **office-document-editor** | 专业 Word 编辑（修订模式、格式化保留、Git版本控制）|
| **office-toolkit** | Office 综合工具包（读写、格式转换、批量处理）|

---

## 🔧 需要安装 CLI（Windows 可用）

| 技能 | 所需 CLI | 安装命令 | 备注 |
|------|----------|----------|------|
| github / gh-issues | gh | `winget install GitHub.cli` | GitHub CLI |
| video-frames | ffmpeg | `winget install FFmpeg` | 视频帧提取 |
| 1password | op | `winget install 1Password.cli` | 密码管理 CLI |
| session-logs | jq | `winget install jq` | 日志分析 |
| gog | gog-cli | `cargo install gog_cli` | Google Workspace |
| goplaces | goplaces | `cargo install goplaces` | Google Places |
| notion | ❓ | 需 Notion API Key | https://www.notion.so/my-integrations |
| trello | ❓ | 需 Trello API Key | https://trello.com/app-key |
| discord | ❓ | 需 Discord Bot Token | 机器人模式 |
| blogwatcher | blogwatcher | `cargo install blogwatcher` | RSS/博客监控 |
| gifgrep | gifgrep | `cargo install gifgrep` | GIF 搜索 |
| himalaya | himalaya | `cargo install himalaya` | 邮件管理 |
| mcporter | mcporter | `cargo install mcporter` | MCP 服务连接 |
| nano-pdf | nano-pdf | `cargo install nano-pdf` | PDF 编辑 |
| openai-whisper | whisper | `pip install openai-whisper` | 语音转文字 |
| openhue | openhue-cli | `cargo install openhue` | Philips Hue |
| sonoscli | sonos-cli | `cargo install sonos-cli` | Sonos 音箱 |
| spotify-player | spogo | `cargo install spogo` | Spotify 播放 |
| wacli | wa-cli | `cargo install wacli` | WhatsApp |
| xurl | xurl | `cargo install xurl` | Twitter/X API |
| coding-agent | codex / claude-code / pi | 需单独安装 | 编程助手 |
| model-usage | codexbar | `npm i -g codexbar` | 模型用量统计 |

> **提示：** 安装前可先运行 `winget --version` 确认 winget 可用。部分工具需要 `cargo`（Rust）或 `pip`（Python），请确保对应环境已安装。

---

## 🚫 macOS 专属（Windows 不可用）

这些技能依赖 macOS 系统和对应原生 app，Windows 上无法使用：

| 技能 | 依赖 |
|------|------|
| apple-notes | macOS Notes.app |
| apple-reminders | macOS Reminders.app |
| imsg | macOS Messages.app |
| bluebubbles | macOS + BlueBubbles 服务 |
| bear-notes | Bear（macOS/iOS 笔记应用）|
| eightctl | Eight Sleep 设备 |
| peekaboo | macOS UI 自动化 |
| things-mac | Things 3（macOS 任务管理应用）|
| sag | ElevenLabs TTS |
| sherpa-onnx-tts | 本地离线 TTS |

---

如需安装某个 CLI，直接告诉我，我帮你执行。

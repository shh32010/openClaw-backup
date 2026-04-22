# OpenClaw 技能与 CLI 依赖清单

> 更新时间：2026-04-09 | 保存路径：`D:\Users\002\Desktop`

---

## ✅ 已安装的内置技能（clawhub 安装包）

| 技能 | 版本 | 说明 |
|------|------|------|
| capability-evolver | 1.40.2 | AI 自我进化引擎 |
| skill-vetter | 1.0.0 | 安全审查，安装前风险评估 |
| openclaw-backup | 1.0.0 | 备份与恢复，可远程推送到 GitHub |
| agent-browser-core | 1.0.1 | 浏览器远程控制（agent-browser CLI） |
| office-editor | 1.0.1 | Word/Excel/PowerPoint 文件创建与编辑 |
| office-document-editor | 1.0.0 | 专业 Word 编辑（修订模式、Git 版本控制） |
| office-toolkit | 1.0.1 | Office 综合工具包（读写、格式转换、批量处理） |
| bailian-web-search | 1.0.4 | 阿里百灵网页搜索（AI 优化） |

---

## 📁 工作区技能（本地安装）

| 技能 | 说明 |
|------|------|
| find-skills / skillhub-preference | 技能发现与安装 |
| self-improving-agent | 自改进 Agent（官方版） |
| windows-screenshot | Windows 截图工具 |

---

## ⚙️ 需要安装 CLI 的技能（Windows 适配）

| 技能 | 所需 CLI | 安装命令 | 备注 |
|------|----------|----------|------|
| github / gh-issues | gh | ✅ 已安装 | GitHub CLI |
| video-frames | ffmpeg | `winget install FFmpeg` | 视频帧提取 |
| 1password | op | `winget install 1Password.cli` | 密码管理 CLI |
| session-logs | jq | ✅ 已安装 | 日志分析 |
| gog | gog-cli | `cargo install gog_cli` | Google Workspace |
| goplaces | goplaces | `cargo install goplaces` | Google Places |
| notion | — | 需 Notion API Key | https://www.notion.so/my-integrations |
| trello | — | 需 Trello API Key | https://trello.com/app-key |
| discord | — | 需 Discord Bot Token | 需配置模式 |
| blogwatcher | blogwatcher | `cargo install blogwatcher` | RSS/博客监控 |
| gifgrep | gifgrep | `cargo install gifgrep` | GIF 搜索 |
| himalaya | himalaya | `cargo install himalaya` | 邮件管理 |
| mcporter | mcporter | `cargo install mcporter` | MCP 服务器管理 |
| nano-pdf | nano-pdf | `cargo install nano-pdf` | PDF 编辑 |
| openai-whisper | whisper | `pip install openai-whisper` | 语音转文字 |
| openhue | openhue-cli | `cargo install openhue` | Philips Hue 灯光 |
| sonoscli | sonos-cli | `cargo install sonos-cli` | Sonos 音箱 |
| spotify-player | spogo | `cargo install spogo` | Spotify 播放 |
| wacli | wa-cli | `cargo install wacli` | WhatsApp |
| xurl | xurl | `cargo install xurl` | Twitter/X API |
| coding-agent | codex / claude-code / pi | ⬜ 需单独安装 | 代码任务代理 |
| model-usage | codexbar | `npm i -g codexbar` | 模型用量统计 |
| bluebubbles | — | macOS + BlueBubbles 服务 | iMessage 集成 |
| tmux | tmux | ⬜ 未安装 | 终端会话管理 |
| sherpa-onnx-tts | sherpa-onnx | ⬜ 未安装 | 本地离线 TTS |

> **提示：** 安装前可先运行 `winget --version` 确认 winget 可用。部分需 `cargo`（Rust）、`pip`（Python），请确保对应工具已安装。

---

## 🍎 macOS 专用技能（Windows 不可用）

这些技能依赖 macOS 系统及对应原生 app，Windows 无法使用。

| 技能 | 依赖 |
|------|------|
| apple-notes | macOS Notes.app |
| apple-reminders | macOS Reminders.app |
| imsg | macOS Messages.app |
| bluebubbles | macOS + BlueBubbles 服务 |
| bear-notes | Bear（macOS/iOS 笔记应用） |
| eightctl | Eight Sleep 设备 |
| peekaboo | macOS UI 自动化 |
| things-mac | Things 3（macOS 任务管理应用） |
| sag | ElevenLabs TTS（mac 风格） |
| sherpa-onnx-tts | 本地离线 TTS |

---

## 🏠 智能家居技能

| 技能 | 依赖 | 说明 |
|------|------|------|
| openhue | openhue-cli | 飞利浦 Hue 灯光 |
| blucli | blu | BluOS 音乐播放 |
| sonoscli | sonos-cli | Sonos 音箱 |
| camsnap | RTSP/ONVIF | 摄像头控制 |
| eightctl | Eight Sleep | 智能床控制 |

---

## 🗂️ 其他内置技能

| 技能 | 说明 |
|------|------|
| clawhub | ClawHub 技能市场 CLI |
| healthcheck | 主机安全审计 |
| node-connect | 设备连接诊断 |
| skill-creator | 技能创建工具 |
| self-improvement | 学习改进捕获 |
| weather | 天气预报查询 |
| summarize | 文本/视频/网页摘要提取 |
| taskflow / taskflow-inbox-triage | 任务流编排 |
| gemini | Gemini CLI |
| model-usage | 模型用量统计 |
| oracle | Prompt + 文件打包 |
| coding-agent | 代码任务代理 |
| session-logs | 会话日志分析 |
| gifgrep | GIF 搜索 |
| openai-whisper-api | OpenAI 语音转文字 API |
| slack | Slack 集成 |
| discord | Discord 集成 |
| goplaces | Google Places 查询 |
| ordercli | 外卖订单（Foodora） |
| voice-call | 语音通话 |
| canvas | 画布工具 |

---

## 📋 插件状态

| 插件 | 版本 | 说明 |
|------|------|------|
| openclaw-weixin | 2.1.7 | 微信公众号通道（已配置） |

---

如需安装某个 CLI，直接告诉宝宝，我来执行。

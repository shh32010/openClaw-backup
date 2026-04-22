# MEMORY.md - 长期记忆

## 关于宝宝
- 名字：浩哥，日常称呼「宝宝」
- 位置：扬州市邗江区
- 偏好：严谨、严肃的交流风格
- 默认浏览器：Microsoft Edge

## 环境配置
- 桌面路径：D:\Users\002\Desktop
- 工作区：C:\Users\002\.openclaw\workspace
- 模型 Provider：custom-gpt-agent-cc（baseUrl: https://gpt-agent.cc/v1）
- 主模型：nvidia/anthropic/claude-3-5-sonnet-20240620
- 备用模型：nvidia/nvidia/nemotron-3-super-120b-a12b
- 微信插件：@tencent-weixin/openclaw-weixin v2.1.6 已安装

## 已知问题
- 2026-04-20：已纠正模型映射，现在所有定时任务使用实际部署的模型（主模型：mistralai/mistral-large-3-675b-instruct-2512，备用：nvidia/nemotron-3-super-120b-a12b）。
- 2026-04-22：所有定时任务统一使用 `claude-sonnet-4-6`（与主会话一致），之前配置的 `nvidia/anthropic/claude-3-5-sonnet-20240620` 在该 provider 上不存在。

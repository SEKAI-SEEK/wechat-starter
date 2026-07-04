# WeChat Starter

> 从零到预览的微信开发陪跑 Skill  
> From zero to preview.

> **公开仓库说明**  
> 这是一个面向所有用户公开使用、复制和改进的 Agent Skill 仓库。仓库中的每个已提交文件都应被视为公开内容，不应包含任何仅属于作者或某个使用者的私密信息与受限素材。

`wechat-starter` 面向第一次开发微信项目的 Vibe Coding 用户和程序员。它让用户控制项目节奏，由 Agent 在每个已确认阶段内完成需求收敛、原生工程搭建、代码实现、错误修复和预览检查，最终停在微信开发者工具可操作预览。

它不是微信开发百科，也不是一次性代码生成器。核心方法是：

```text
Teach -> Do -> Verify -> Recover -> Record
```

## 能做什么

- 从一句想法收敛出第一个可运行版本。
- 提供微信账号、AppID、开发者工具和本地 Git 的零基础引导。
- 默认采用原生微信技术栈：小程序使用 WXML/WXSS/JavaScript，小游戏使用 JavaScript/Canvas 2D。
- 一次只推进一组操作，并说明正确结果与失败恢复方法。
- 根据截图、控制台信息和运行表现定位问题。
- 在项目骨架、最小闭环和预览就绪时建立本地 Git 检查点。
- 检查配置、资源、适配、交互、包体和敏感信息。

## 明确边界

包含：从零开发微信小程序或小游戏，直到微信开发者工具预览通过。

不包含：GitHub 发布、微信上传、提审、审核、灰度或正式上线。

CloudBase 仅在首版需求确实需要远程数据、云函数、存储、认证或 AI 服务时启用。

## 安装

克隆或下载本仓库后，在仓库根目录运行：

```bash
npx skills add . --skill wechat-starter
```

在 Codex 中，也可以把当前 GitHub 仓库的 `skills/wechat-starter` 目录链接交给 `$skill-installer`。安装后重启 Codex，使新 Skill 被发现。

不使用安装器时，可以将 `skills/wechat-starter/` 复制到兼容 Agent Skills 标准的本地 Skill 目录。

## 使用示例

```text
使用 $wechat-starter 带我从零做一个记录每日喝水的小程序。我没有开发经验。
```

```text
使用 $wechat-starter 带我做第一个微信小游戏，先完成可以点击、计分和重新开始的最小版本。
```

```text
使用 $wechat-starter 看一下这张微信开发者工具报错截图，告诉我现在卡在哪个阶段。
```

## 与常见微信开发 Skill 的区别

- 不只是原生 API 和编码规则，而是从需求收敛到预览验收的完整陪跑流程。
- 同时覆盖微信小程序和微信小游戏，并在进入实现阶段后加载不同参考资料。
- 默认服务第一次开发微信项目的用户，采用小步教学、即时术语解释和截图报错救援。
- 用户控制阶段推进，Agent 完成已授权阶段；不会自行进入上传、审核或发布。
- 自动检查只能作为证据之一，最终必须看到真实 DevTools 预览并由用户确认。

## 仓库结构

```text
wechat-starter/
|-- README.md
|-- AGENTS.md
|-- CONTRIBUTING.md
|-- SECURITY.md
|-- LICENSE
|-- scripts/
|   `-- validate.ps1
`-- skills/
    `-- wechat-starter/
        |-- SKILL.md
        |-- LICENSE.txt
        |-- agents/openai.yaml
        |-- references/
        `-- assets/templates/
```

## 面向所有用户的公开仓库安全说明

以下规则约束的是 **`wechat-starter` 公开仓库中将被提交和分享的内容**，不是禁止使用者在自己的本地微信项目中配置真实信息。

### 公开仓库中禁止提交

- API key、AppSecret、密码、访问令牌、私钥和真实云环境凭据。
- 作者或使用者的私有项目代码、内部配置和未公开资料。
- 未获得公开使用授权的图片、音频、字体和其他素材。
- 包含账号、个人信息、AppID、云环境 ID 或登录二维码的未脱敏截图。

仓库中的示例统一使用 `<WECHAT_APP_ID>`、`<CLOUDBASE_ENV_ID>` 等明显占位符。

### 使用者自己的本地项目

使用者可以在自己的本地项目和微信开发者工具中填写真实 AppID、云环境 ID 等必要配置，但应将私密配置保存在本地文件或安全的凭据管理位置，并确保这些文件不会被提交到公开仓库。AppSecret、API key 和服务端密钥不得写入小程序或小游戏前端代码。

提交前运行：

```powershell
pwsh ./scripts/validate.ps1
```

Windows PowerShell 5.1 可使用：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate.ps1
```

## 设计依据

仓库结构遵循 [Agent Skills](https://github.com/agentskills/agentskills) 的渐进披露模式，并参考 [OpenAI Skills](https://github.com/openai/skills)、[Anthropic Skills](https://github.com/anthropics/skills) 和 [Tencent CloudBase Skills](https://github.com/TencentCloudBase/cloudbase-skills) 的公开组织方式。

## License

MIT

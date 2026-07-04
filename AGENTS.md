# Repository Instructions

## Scope

Maintain one installable Agent Skill at `skills/wechat-starter/`. Keep repository-level documentation at the root and agent-only instructions inside the skill directory.

Keep this repository focused on the reusable Skill. Do not track complete generated Mini Program or Mini Game projects, demo applications, case-study source trees, screenshots, or copied project assets.

## Public-By-Default Rule

Treat every tracked file as immediately public.

- Never add API keys, AppSecret values, passwords, tokens, private keys, certificates, real cloud credentials, private account identifiers, personal data, or proprietary configuration.
- Never add private project assets, copied commercial artwork, screenshots with identifiers, or images without clear reuse rights.
- Use visible placeholders such as `<WECHAT_APP_ID>` and `<CLOUDBASE_ENV_ID>`.
- Prefer links to official documentation over copied documentation that can become stale.

## Skill Design

- Keep `SKILL.md` focused on routing, workflow, safety, and acceptance gates.
- Put detailed Mini Program, Mini Game, CloudBase, troubleshooting, and beginner guidance in `references/`.
- Keep references one level below `SKILL.md` and link each one directly.
- Do not add a README inside the installable skill directory.
- Do not add runtime dependencies unless a repeated deterministic task justifies them.
- Do not expand scope beyond WeChat DevTools preview without an explicit product decision.

## Verification

Run before committing:

```powershell
pwsh ./scripts/validate.ps1
```

When `pwsh` is unavailable on Windows, run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate.ps1
```

Also inspect `git diff --check` and `git status --short`. Review every new binary manually before tracking it.

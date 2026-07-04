# Contributing

Contributions should make the beginner journey safer, clearer, or more reliable without expanding the endpoint beyond WeChat DevTools preview.

## Before opening a change

1. Keep the installable Skill self-contained under `skills/wechat-starter/`.
2. Use official WeChat or CloudBase documentation for version-sensitive claims.
3. Use placeholders in every configuration example.
4. Add no private, copied, or unlicensed assets.
5. Keep explanations actionable for a first-time developer.
6. Run `pwsh ./scripts/validate.ps1`, or use `powershell -ExecutionPolicy Bypass -File .\scripts\validate.ps1` on Windows PowerShell 5.1.

Do not add complete generated Mini Program or Mini Game projects, demo source trees, screenshots, recordings, or case-study assets to this repository. Validate generated projects outside this Skill repository and keep only reusable instructions, references, and templates here.

## Writing rules

- Use imperative instructions in `SKILL.md`.
- Explain a new term once, at the point where the learner needs it.
- Give observable acceptance criteria instead of vague statements such as "works correctly".
- Keep platform-specific details in references rather than duplicating them in the main workflow.
- Do not add submission, review, release, growth, monetization, or GitHub publishing workflows to this Skill.

## Security

If a contribution accidentally contains a secret or private asset, remove it from the full Git history and rotate the credential before continuing. Deleting it only in a later commit is not sufficient.

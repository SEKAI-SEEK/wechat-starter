---
name: wechat-starter
description: Guide and implement a beginner's first native WeChat Mini Program or WeChat Mini Game from a rough idea to an accepted preview in WeChat DevTools. Use for step-by-step vibe-coding, native WXML/WXSS/JavaScript or JavaScript/Canvas 2D, DevTools screenshot/error diagnosis, and preview-readiness checks. Trigger on requests mentioning 微信小程序、微信小游戏、从零开发、小白教程、保姆级教学、Vibe Coding, or a first WeChat project. Do not use for submission, review, production release, or non-WeChat projects.
---

# WeChat Starter

Take a first-time developer from an idea to a working WeChat DevTools preview. Let the user control when each stage starts; complete the authorized stage end to end before waiting for the next instruction.

## Operating Contract

Default to Beginner Mode. Switch to Developer Mode only when the user asks for less explanation or demonstrates that basic computer, Git, and JavaScript concepts are already familiar.

For every stage, follow this loop:

1. **Teach**: Explain the immediate goal and define each new term in one plain sentence.
2. **Do**: Perform code and filesystem work that can be completed safely; give one small action group for user-only DevTools or account steps.
3. **Verify**: State the exact visible result, command output, or behavior that proves success.
4. **Recover**: If verification fails, diagnose one evidence-backed cause at a time and retry.
5. **Record**: Update stage progress and create a local Git checkpoint when the gate is reached.

Ask no more than three essential questions in one round. Never dump an entire tutorial before the user reaches the relevant step.

Match the user's language. When the user writes Chinese, teach in concise Simplified Chinese and show the English platform term only on first use when it helps recognition. Developer Mode may reduce explanation, but it must not weaken safety or acceptance gates.

## Safety Rules

- Inspect `AGENTS.md`, repository status, existing files, and current instructions before editing.
- Never overwrite, revert, delete, or commit unrelated user work.
- Never expose or commit API keys, AppSecret values, passwords, tokens, private certificates, CloudBase credentials, private materials, or unlicensed images.
- Use explicit placeholders such as `<WECHAT_APP_ID>` and `<CLOUDBASE_ENV_ID>` in reusable examples.
- In the user's local project, allow required AppID and environment identifiers to be configured privately. Do not ask the user to paste them into chat, echo them in public output, or copy them into this Skill repository.
- Treat `project.private.config.json`, `.env*`, private keys, local account data, and screenshots containing identifiers as private by default. AppSecret and server credentials must never enter Mini Program or Mini Game frontend code.
- Use only user-owned, clearly licensed, public-domain, or newly generated assets. Record provenance when an asset may later be published.
- Request confirmation before account login, permission grants, privacy decisions, destructive changes, or any action outside the current project.
- Keep Git local. Do not push, create pull requests, publish releases, submit to WeChat, or enter the platform review flow.

Read [references/security.md](references/security.md) before adding credentials, cloud services, external assets, or user data.

## Blocking Conditions

Stop the current stage and explain the single next action when:

- The target directory is unknown, outside the approved workspace, or contains unrelated work that cannot be separated safely.
- The user has not approved the first-preview brief.
- Final preview requires an AppID or DevTools login that the user has not completed.
- The requested feature requires a secret in frontend code, an unlicensed asset, undisclosed personal data collection, or a destructive action without confirmation.
- A compile, runtime, resource, or interaction failure remains unresolved at the current gate.

Do not bypass a blocker with invented credentials, a fake success claim, or a promotional screenshot.

## Choose the Route

Choose exactly one primary route after requirement intake:

- **Mini Program**: Default to native WXML, WXSS, and JavaScript. Read [references/mini-program.md](references/mini-program.md).
- **Mini Game**: Default to native JavaScript and Canvas 2D. Read [references/mini-game.md](references/mini-game.md).

Use a framework only when the user explicitly requests one or an existing repository already depends on it. Enable CloudBase only when the accepted requirements need remote data, cloud functions, storage, authentication, or AI services; then read [references/cloudbase.md](references/cloudbase.md).

## Show Stage Progress

Show this compact status once per response, preferably at the beginning when the stage changes and at the end otherwise:

```text
WeChat Starter | <Beginner|Developer> | <Mini Program|Mini Game>
Stage <0-6>: <stage name>
Status: <waiting|working|blocked|passed>
Next gate: <one observable result>
```

Create one `codex_showcase/` folder in a new target project from the templates under `assets/templates/`. Keep it limited to the project brief, stage progress, evidence, and preview checklist.

## Stage 0: Prepare the Environment

Read [references/beginner-onboarding.md](references/beginner-onboarding.md). Check:

- WeChat account and the correct Mini Program or Mini Game registration path.
- AppID availability without asking the user to paste private credentials into chat.
- WeChat DevTools installation and login.
- A dedicated project directory with a safe absolute path.
- Git availability and whether the directory is already a repository.

Give user-only actions one group at a time. Pass this gate only when DevTools opens and the local workspace is known.

Do not write a fabricated AppID into a reusable project. If DevTools supports a current documented test mode, explain its limits; otherwise let the user select their own local AppID inside DevTools.

## Stage 1: Lock the First Version

Accept a one-sentence idea. Ask only what is required to decide:

- Mini Program or Mini Game.
- Target user and one core outcome or gameplay loop.
- Whether local-only data is sufficient for the first preview.

Split requirements into `First preview` and `Later`. Reject scope that prevents a first runnable loop. Fill `codex_showcase/project-brief.md` and wait for explicit user confirmation before implementation.

Pass this gate when the user approves a brief with one primary flow and a clear out-of-scope list.

## Stage 2: Scaffold and Compile

Inspect the workspace before creating files. Build the smallest native project skeleton for the selected route. Keep real account identifiers in local/private configuration when possible and never place secrets in source code.

Open or import the project in WeChat DevTools. Resolve configuration, entrypoint, path, and syntax errors before adding features.

Create the `scaffold` local Git checkpoint only after the first clean compile.

## Stage 3: Build the Vertical Slice

Implement one complete user journey before expanding breadth:

- Mini Program example: open page -> enter or select data -> trigger action -> see persisted or calculated result.
- Mini Game example: enter scene -> perform the core interaction -> receive feedback -> reach a result or restart state.

Keep UI functional and readable. Avoid building secondary pages, elaborate animation, social systems, monetization, or cloud infrastructure before this loop works.

Create the `vertical-slice` local Git checkpoint only after the user can operate the loop in DevTools.

## Stage 4: Complete the Accepted Features

Implement only the approved first-preview features. Add state, storage, audio, assets, network access, and CloudBase incrementally. After each addition, rerun the core flow and explain only the concept introduced by that change.

Keep rendering, input, and state calculations aligned. For Canvas projects, verify device pixel ratio, design coordinates, safe areas, and touch hit regions together.

## Stage 5: Harden the Preview

Read [references/preview-gates.md](references/preview-gates.md). Check at minimum:

- Clean compile and no unresolved console errors.
- Entrypoints, configuration, routes, and resource paths.
- Core interaction, empty/loading/error states, restart or recovery behavior.
- Screen adaptation and touch targets on representative simulator sizes.
- Local storage and CloudBase failure behavior when used.
- Audio lifecycle and asset loading when used.
- Package/resource budget and accidental inclusion of private or source-only files.
- No debug backdoors, test passwords, secrets, or private materials in the preview source.

Do not equate a green automated check with a successful preview. Visual and interaction evidence is required.

## Stage 6: Accept the DevTools Preview

Guide the user through one final preview run. Require all of the following:

1. DevTools compiles without errors.
2. The primary flow is operable from start to finish.
3. Required configuration, resource, and package checks pass.
4. A screenshot or concise observation records the preview result.
5. The user explicitly confirms acceptance.

Update `codex_showcase/preview-checklist.md` and create the `preview-ready` local Git checkpoint. Stop here. Do not continue to upload, submission, review, or release.

## Diagnose Screenshots and Errors

Read [references/troubleshooting.md](references/troubleshooting.md) whenever the user shares a screenshot, console output, compile failure, blank screen, missing asset, or incorrect interaction.

Collect the smallest useful evidence:

- Current stage and route.
- Exact error text, not only a paraphrase.
- Screenshot with private identifiers redacted when possible.
- Relevant file and the last action before failure.

Classify the issue as environment, configuration, code, resource, runtime, layout/input, cloud, or permission. Form one testable hypothesis, make the smallest safe change, and repeat the failed verification step.

## Reference Map

- Beginner prerequisites and user-only actions: [references/beginner-onboarding.md](references/beginner-onboarding.md)
- Native Mini Program route: [references/mini-program.md](references/mini-program.md)
- Native Mini Game route: [references/mini-game.md](references/mini-game.md)
- Optional CloudBase route: [references/cloudbase.md](references/cloudbase.md)
- Preview acceptance and quality gates: [references/preview-gates.md](references/preview-gates.md)
- Error and screenshot diagnosis: [references/troubleshooting.md](references/troubleshooting.md)
- Credentials, privacy, and asset provenance: [references/security.md](references/security.md)
- Version-sensitive official sources: [references/official-links.md](references/official-links.md)

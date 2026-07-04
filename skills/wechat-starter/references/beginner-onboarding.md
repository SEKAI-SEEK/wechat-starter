# Beginner Onboarding

Use this guide in Stage 0 and whenever a beginner does not know which application, account, or folder to use.

## Teaching pattern

Give one action group at a time. For each group, state:

1. **Goal**: what this action unlocks.
2. **Action**: the exact clicks or command.
3. **Expected result**: what the user should see.
4. **If different**: what screenshot or error text to provide.

Do not continue until the expected result is confirmed.

## Explain these terms once

- **WeChat DevTools**: the desktop application used to create, compile, simulate, debug, and preview a WeChat project.
- **AppID**: the identifier that connects a local project to a registered WeChat Mini Program or Mini Game; it is not the AppSecret.
- **AppSecret**: a server-side credential. Never request it in chat or place it in frontend code.
- **Project directory**: the local folder containing the source files opened by DevTools.
- **Compile**: DevTools checks and transforms the source so it can run in the simulator.
- **Preview**: a testable build shown in DevTools or opened through a test QR flow; it is not a public release.
- **Git checkpoint**: a local saved version that makes safe rollback possible.

## Readiness checklist

### 1. Choose the account type

Confirm whether the user is creating a Mini Program or Mini Game. Do not assume that one registration can be silently reused for the other. Direct the user to the current official registration flow and wait for confirmation.

Never ask for account password, SMS code, QR login image, AppSecret, or session cookie.

### 2. Confirm AppID handling

Ask only whether an AppID is available. Let the user enter it directly in WeChat DevTools or a local private configuration surface. Use `<WECHAT_APP_ID>` in reusable examples.

If no AppID is available, continue only when DevTools offers a valid local/test path for the selected project type. Otherwise mark preview as blocked and explain the account step.

Do not invent an AppID or silently write a legacy test value into a reusable project. Test-mode behavior can change across DevTools versions.

### 3. Install and open DevTools

Use the official download link in `official-links.md`. Ask the user to confirm:

- DevTools launches.
- Login is complete.
- The correct project type can be selected.

Do not ask the user to send a login QR code.

If the workflow uses the DevTools CLI, explain that the local service port must be enabled in DevTools security settings. Ask for confirmation before enabling it, keep the service bound to the local machine, and do not confuse CLI access with upload or release permission.

### 4. Choose a project directory

Use a dedicated folder with a short, readable name. Avoid system directories, cloud-synced temporary folders, or nesting inside an unrelated repository.

Before writing files, display the resolved absolute path and confirm it with the user.

### 5. Prepare local Git

Check `git --version`. If the target directory is not a repository, explain that Git will be used only for local safety and ask before initializing it.

Before each checkpoint:

```text
git status --short
git diff --check
```

Never push. Never include unrelated files in a checkpoint.

## Stage 0 acceptance

Pass only when:

- The route is Mini Program or Mini Game.
- DevTools opens and login is confirmed.
- AppID availability or an explicit blocker is recorded.
- The target directory is confirmed.
- Local Git status is understood.

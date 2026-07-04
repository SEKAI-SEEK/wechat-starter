# Troubleshooting

Use this reference for screenshots, console errors, blank screens, missing assets, incorrect layouts, broken input, or cloud failures.

## Evidence first

Request only the minimum evidence needed:

1. Current route and stage.
2. Exact error text and first relevant stack frame.
3. Screenshot with private identifiers redacted when possible.
4. Relevant file path.
5. Last action before the failure.

Do not ask for passwords, AppSecret values, tokens, login QR codes, private keys, or full private configuration files.

## Classify before editing

| Class | Typical evidence | First check |
| --- | --- | --- |
| Environment | DevTools will not open or import | version, login, project path |
| Configuration | compile type, JSON, route, entry error | exact config and declared path |
| Code | syntax error or stack trace | first project-owned stack frame |
| Resource | missing image/audio or load failure | case-sensitive path and package inclusion |
| Runtime | blank screen or frozen flow | first error, state transition, loop/listener count |
| Layout/input | visible UI but wrong touch behavior | shared coordinates, DPR, safe area, hit region |
| Cloud | request, permission, or environment failure | environment selection, rules, network state |
| Permission | platform API denied or unavailable | required scope and user-facing rationale |

## Recovery loop

1. Reproduce the smallest failing action.
2. State one testable hypothesis tied to evidence.
3. Inspect the narrowest relevant files.
4. Preserve a diff or local Git state before risky edits.
5. Make the smallest coherent change.
6. Repeat the exact failed action.
7. Record the outcome before testing a second hypothesis.

Avoid changing configuration, business logic, layout, and resources simultaneously.

## Common symptom checks

### Blank simulator

- Confirm DevTools opened the intended directory.
- Check the first console error.
- Confirm the entry file runs.
- Paint a minimal visible state before restoring complex rendering.

### Page not found

- Compare the declared route with the real directory and filename case.
- Check that the page is listed in the correct configuration file.

### Image or audio missing

- Resolve the path from the file that loads it.
- Compare filename case and extension.
- Confirm the file is not excluded from the package.
- Check asynchronous failure callbacks.

### Canvas looks right but touch is wrong

- Log raw touch coordinates and converted design coordinates.
- Confirm render and hit-area calculations share layout values.
- Check DPR and safe-area offsets only once.

### Works once, fails after restart

- Check duplicate listeners, timers, and animation loops.
- Verify every state value resets.
- Inspect persisted data parsing and defaults.

### Cloud request fails

- Confirm the intended non-production environment is selected.
- Check network availability and permission rules.
- Verify the frontend contains no server-only secret.
- Show a recoverable UI state before changing infrastructure.


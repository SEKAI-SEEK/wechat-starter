# WeChat DevTools Preview Checklist

## Build

- [ ] DevTools opens the intended project directory.
- [ ] Compile type matches Mini Program or Mini Game.
- [ ] Compile completes without unresolved errors.
- [ ] Startup and primary-flow console output has no unresolved error.

## Primary Flow

- [ ] The first action is clear.
- [ ] The primary flow works from start to finish.
- [ ] Restart or recovery returns to a valid state.
- [ ] Empty, loading, and failure states are handled when relevant.

## Layout and Input

- [ ] Representative narrow and tall simulator sizes were checked.
- [ ] Text and controls do not overlap or clip.
- [ ] Visible controls match their touch regions.
- [ ] Safe areas and orientation are correct.

## Resources and Data

- [ ] Required images and audio load.
- [ ] Package excludes private, backup, and source-only files.
- [ ] Local storage or CloudBase behavior was verified when used.
- [ ] Failure behavior is understandable.

## Safety

- [ ] No API key, AppSecret, password, token, private key, or cloud credential is tracked.
- [ ] No debug backdoor or test password remains enabled.
- [ ] Every bundled asset has known, acceptable provenance.
- [ ] Evidence screenshots redact private identifiers.

## Acceptance

- DevTools version:
- Simulator/device profile:
- Known limitations:
- Evidence path:
- User accepted preview: No / Yes
- Acceptance date:


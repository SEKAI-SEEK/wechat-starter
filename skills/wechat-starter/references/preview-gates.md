# Preview Gates

Use this checklist in Stage 5 and Stage 6. Mark an item passed only with an observable result.

## Build and configuration

- DevTools opens the intended absolute project path.
- The selected compile type matches Mini Program or Mini Game.
- Entrypoints and declared routes exist.
- JSON configuration parses without warnings that affect the core flow.
- DevTools reports no project-owned unresolved problem during startup and the primary flow. Separate account/tool warnings from source errors and record any remaining blocker honestly.

## Core flow

- A new user can identify the first action.
- The primary action produces immediate visual feedback.
- State changes are correct and repeatable.
- Empty, loading, failure, and restart paths exist when relevant.
- Repeating the flow does not duplicate listeners, timers, animation loops, or records.

## Layout and input

- Text fits without clipping at representative narrow and tall simulator sizes.
- Controls do not overlap safe areas or each other.
- Touch targets match visible controls.
- Canvas rendering and hit testing use the same coordinate system.
- Orientation matches the project design.

## Resources and package

- Every referenced image and audio file exists with matching filename case.
- Missing or failed assets have a visible fallback when required.
- Source-only, backup, design, and private files are excluded from the package.
- Large media has been justified, compressed, deferred, or moved to an approved remote strategy.
- Audio starts only after a permitted user interaction when the runtime requires it and responds to hide/show lifecycle events.

## Data and cloud

- Local storage survives the intended restart path.
- Corrupt or absent stored data falls back safely.
- Cloud calls show loading and failure states.
- Test data contains no production personal information.
- No frontend file contains a server credential.

## Safety

- No API key, AppSecret, password, token, certificate, private key, or real cloud credential is tracked.
- No debug backdoor, test password, forced unlock, or admin shortcut is enabled.
- Every bundled asset is user-owned, generated with known provenance, or clearly licensed.
- Screenshots used as evidence redact account and environment identifiers when appropriate.

## Final acceptance evidence

Record:

- DevTools version and simulator/device profile used.
- Primary flow tested.
- Final compile result.
- Known non-blocking limitations.
- Screenshot path or a short user observation.
- Explicit user acceptance.

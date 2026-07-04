# Native Mini Game Route

Use this reference after Stage 1 selects Mini Game.

## Default stack

Use native JavaScript and Canvas 2D. Treat the WeChat Mini Game runtime as a game runtime rather than a browser page: do not assume DOM, HTML, or normal browser layout APIs exist.

Explain the first occurrence of:

- **Canvas**: the drawable surface used to render the game scene.
- **Game loop**: the repeated update-and-render cycle that keeps the game responsive.
- **Design coordinates**: stable logical coordinates converted to the current device size.
- **Hit area**: the logical region that receives a touch or click.
- **DPR**: device pixel ratio, used to keep Canvas output sharp without changing logical layout.

## Minimum scaffold

Prefer the smallest structure that DevTools recognizes:

```text
game.js
game.json
project.config.json
js/
  main.js
```

Add folders only when the vertical slice proves they are needed.

## First compile gate

Verify in this order:

1. The project type is Mini Game.
2. `game.js` loads the real entry module.
3. Configuration JSON parses.
4. Canvas is created and visibly cleared or painted.
5. The console contains no unresolved startup error.

## Vertical slice

Build one complete gameplay loop:

```text
enter -> perform one core action -> receive visual feedback -> update score/state -> finish or restart
```

Do not begin with shops, achievements, leaderboards, ads, social systems, or many levels.

## Rendering and input

- Keep one source of truth for layout dimensions.
- Convert device touches into design coordinates before hit testing.
- Derive hit areas from the same layout values used for rendering.
- Account for safe areas and unusual aspect ratios.
- Scale the backing canvas for DPR while preserving logical coordinates.
- Prevent repeated input while an action or transition is locked.
- Verify touch behavior, not only mouse behavior in the simulator.

## State and timing

- Separate game state from rendering where practical.
- Make restart restore every state value needed by the first loop.
- Use one controlled update/render loop; avoid multiple accidental animation loops.
- Pause or mute audio when the runtime hides or loses focus.
- Load assets with visible fallback or failure handling.

## Common first-project traps

- Rendering in scaled coordinates but hit-testing in raw screen coordinates.
- Creating multiple event listeners or animation loops after restart.
- Loading an asset with the wrong case or relative path.
- Assuming Canvas CSS sizing behaves like a browser page.
- Building content breadth before the core interaction is stable.


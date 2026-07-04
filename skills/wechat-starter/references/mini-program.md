# Native Mini Program Route

Use this reference after Stage 1 selects Mini Program.

## Default stack

Use native WXML for structure, WXSS for styling, and JavaScript for behavior. Add TypeScript or a framework only when explicitly requested or already required by the repository.

Explain the first occurrence of:

- **Page**: one navigable Mini Program screen with matching `.wxml`, `.wxss`, `.js`, and optional `.json` files.
- **Lifecycle**: functions called by the runtime when the app or page starts, appears, hides, or unloads.
- **Data binding**: rendering JavaScript state into WXML and updating the view through the platform state API.
- **Component**: a reusable UI unit with its own properties, state, events, and styles.

## Minimum scaffold

Prefer the smallest structure that DevTools recognizes:

```text
app.js
app.json
app.wxss
pages/
  index/
    index.js
    index.json
    index.wxml
    index.wxss
project.config.json
```

Keep any user-specific private DevTools settings in `project.private.config.json`, which must remain untracked.

## First compile gate

Verify in this order:

1. `app.json` parses and declares the first page.
2. Every declared page path exists with matching filenames.
3. WXML and WXSS compile without syntax errors.
4. The simulator shows the first page rather than a blank screen.
5. The console contains no unresolved startup error.

Do not add business features before this gate passes.

## Vertical slice

Build one complete flow. A useful first-project pattern is:

```text
open page -> enter/select -> trigger action -> see result -> reopen and retain state when required
```

Keep state local until remote data is necessary. Prefer platform storage APIs for simple first-preview persistence.

## Implementation checks

- Keep page state minimal and derived values deterministic.
- Keep `setData` payloads narrow; avoid repeatedly sending large unchanged objects to the view layer.
- Give repeated WXML items a stable `wx:key` derived from real item identity.
- Bind events in WXML to named handlers; avoid hidden global behavior.
- Provide empty, loading, success, and error feedback when asynchronous work exists.
- Use navigation only when a second page is required by the accepted flow.
- Keep tap targets readable and test at representative simulator widths.
- Verify every local asset path and filename case.
- Request permissions only when the accepted feature needs them and explain the user-facing reason.

## Common first-project traps

- Editing a file outside the directory DevTools actually opened.
- Declaring a page in `app.json` with a mismatched path.
- Mutating displayed state without the platform update mechanism.
- Using browser-only DOM APIs that the Mini Program runtime does not provide.
- Starting CloudBase before the local flow is proven.
- Adding multiple pages before one page has a complete interaction loop.

# Optional CloudBase Route

Read this reference only when the approved first preview needs remote data, cloud functions, storage, authentication, or supported AI services.

## Decision gate

Do not enable CloudBase when local storage or static data can prove the first vertical slice. Before enabling it, state:

- Which accepted requirement cannot be met locally.
- Which CloudBase capability is required.
- What the preview should do when cloud access is unavailable.

## Credential boundary

- Let the user select or enter the environment identifier locally.
- Use `<CLOUDBASE_ENV_ID>` in reusable examples.
- Never request or store AppSecret, API secret, private key, access token, or account password.
- Never place server credentials in Mini Program or Mini Game frontend code.
- Keep private local configuration untracked.

## Incremental integration

1. Preserve a working local vertical slice.
2. Initialize only the required CloudBase capability.
3. Add one read or write path.
4. Show loading, success, empty, and error behavior.
5. Test the no-network or unavailable-service path.
6. Confirm database or storage rules follow least privilege.

Do not silently create paid resources or broad public access rules. Explain cost, permission, and data-handling implications before the user confirms those actions.

## Preview acceptance

Verify:

- The selected environment is the intended non-production environment.
- A failed cloud request produces understandable UI rather than a blank screen.
- No secret is present in frontend code, logs, screenshots, or tracked files.
- Test data contains no personal or private production information.
- Local fallback is present when the accepted product behavior requires it.

Use the current official CloudBase documentation linked in `official-links.md` for version-sensitive APIs and console steps.


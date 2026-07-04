# Security, Privacy, and Asset Rules

Read this reference before adding credentials, cloud services, user data, external assets, or screenshots.

## Information classes

### Never expose or track

- AppSecret values, API keys, access tokens, passwords, cookies, and session data.
- Private keys, certificates, signing files, and cloud provider credentials.
- Production database exports, personal information, and private analytics data.
- Login QR codes and screenshots containing reusable authentication material.

### Treat as private project metadata

- Real AppID and CloudBase environment identifiers.
- Account names, open identifiers, internal URLs, and unpublished project names.
- DevTools private configuration and local absolute paths when sharing publicly.

These values may be used inside the owner's local project when required. Keep them out of reusable examples, chat transcripts, screenshots, and public repositories unless the owner deliberately approves publication.

### Safe reusable placeholders

- `<WECHAT_APP_ID>`
- `<CLOUDBASE_ENV_ID>`
- `<PROJECT_DIRECTORY>`
- `<YOUR_API_ENDPOINT>`

Never invent a realistic-looking credential as sample data.

## Source-code boundary

- Keep server credentials on a trusted server or managed secret surface, never in Mini Program or Mini Game frontend code.
- Keep `.env*`, `project.private.config.json`, certificates, and private overrides untracked.
- Inspect staged changes before every checkpoint.
- If a secret enters Git history, rotate it and remove it from the complete history; a later deletion is not enough.

## Asset provenance

Use only:

- Assets created by the user.
- Assets generated specifically for the project with publication rights understood.
- Public-domain assets.
- Assets with a license compatible with the intended use and repository.

Record source URL, author, license, modification, and intended use for third-party assets. Do not copy images, audio, fonts, logos, or code from another private project merely because they are locally accessible.

Use neutral placeholders until provenance is clear.

## Screenshots and logs

Before sharing or recording evidence, redact:

- Account names and avatars.
- AppID, environment identifiers, internal domains, and file paths containing personal names.
- QR codes, tokens, cookies, request headers, and private data.

Prefer the smallest cropped evidence that still proves the result.

## Cloud and privacy decisions

- Explain what data leaves the device and why.
- Request only permissions required by the accepted first-preview feature.
- Use non-production environments and synthetic test data.
- Apply least-privilege database and storage rules.
- Do not enable user tracking, analytics, or collection by default.

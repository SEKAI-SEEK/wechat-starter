# Security Policy

## Never commit

- API keys, WeChat AppSecret values, passwords, access tokens, cookies, or session data.
- Private keys, certificates, signing files, or CloudBase credentials.
- Real production configuration copied from another project.
- Personal data, private screenshots, proprietary source, or unlicensed media.

Use explicit placeholders in documentation and examples. Treat AppID and CloudBase environment identifiers as private project metadata unless the owner has deliberately approved publication.

## If a secret is exposed

1. Revoke or rotate it immediately.
2. Remove it from the complete Git history, not only the latest file.
3. Check forks, workflow logs, releases, and caches.
4. Document the remediation without repeating the secret.

Report security concerns through GitHub private vulnerability reporting when it is enabled. Otherwise contact the repository owner privately before opening a public issue containing sensitive evidence. Never paste a live secret into an issue.

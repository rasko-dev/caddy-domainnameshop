This repo exists to build a docker image of Caddy with the [dns.providers.domainnameshop](https://github.com/caddy-dns/domainnameshop) module embedded.

The published image is automatically checked and updated by CI when new upstream Caddy versions are released.

The `docker-publish` workflow accepts an optional `caddy_version` input.

- When provided, that version is used for the build.
- When omitted, the workflow resolves the latest upstream Caddy release automatically.
- Published tags include `major.minor.patch`, `major.minor`, `major`, and `latest` (only when building the current latest upstream release).
- A scheduled run checks for new upstream Caddy releases and automatically builds when a new version is not yet published.

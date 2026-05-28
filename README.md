This repo exists to build a docker image of Caddy with the [dns.providers.domainnameshop](https://github.com/caddy-dns/domainnameshop) module embedded.

The published image is automatically checked and updated by CI when new upstream Caddy versions are released.

The `docker-publish` workflow accepts an optional `caddy_version` input.

- When provided, that version is used for the build.
- When omitted (including manual trigger), the workflow resolves the latest upstream Caddy version from Docker Hub automatically.
- Published tags include `major.minor.patch`, `major.minor`, `major`, and `latest` (only when building the current latest upstream release).
- A scheduled run checks for new upstream versions and automatically builds when the target version or rolling tags are missing/outdated.

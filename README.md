This repo exists to build a docker image of Caddy with the [dns.providers.domainnameshop](https://github.com/caddy-dns/domainnameshop) module embedded.

The published image is automatically checked and updated by CI when new upstream Caddy versions are released.

The `docker-publish` workflow accepts an optional `caddy_version` input.

- When provided, that version is used for the build.
- When omitted (including manual trigger), the workflow resolves the latest upstream Caddy version from GitHub releases automatically.
- Before building, the workflow verifies that the exact upstream `caddy:<version>` tag exists on Docker Hub; if it is not available yet, the run exits cleanly and will retry on the next scheduled run.
- Published images include the `io.github.rasko-dev.caddy-version` label with the embedded upstream Caddy `major.minor.patch`.
- Published tags include `major.minor.patch`, `major.minor`, `major`, and `latest` (only when building the current latest upstream release).
- Rolling tags are only updated when their embedded `io.github.rasko-dev.caddy-version` label is older than the version being built, or when that label is missing/invalid (invalid = not `major.minor.patch`, to migrate older images).
- Every run (scheduled or manual) checks for new upstream versions and only builds when the target version is missing, mismatched, or rolling tags need updates.

The Dockerfile requires `CADDY_VERSION` to be provided as a build argument, and the workflow always supplies the resolved version explicitly.

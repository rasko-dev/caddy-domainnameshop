ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/domainnameshop

FROM caddy:${CADDY_VERSION}

ARG CADDY_VERSION
LABEL io.github.rasko-dev.caddy-version="${CADDY_VERSION}"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

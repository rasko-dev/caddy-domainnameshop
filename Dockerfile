FROM caddy:2.11.3-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/domainnameshop \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11.3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

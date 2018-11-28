# Use alpine as the base.
FROM alpine:3.8

# Install curl.
RUN apk add --no-cache curl

# Install Caddy (v0.11.1)
RUN curl -sLO https://github.com/mholt/caddy/releases/download/v0.11.1/caddy_v0.11.1_linux_amd64.tar.gz
RUN tar xzf caddy_v0.11.1_linux_amd64.tar.gz
RUN mv caddy /usr/bin/caddy
RUN chmod 755 /usr/bin/caddy
RUN rm -rf caddy*
RUN ulimit -n 8192

COPY ./Caddyfile /Caddyfile

# Start Caddy.
ENTRYPOINT ["caddy", "-conf", "/Caddyfile"]
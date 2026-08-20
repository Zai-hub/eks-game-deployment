# Build Stage
FROM alpine:3.20 AS build

WORKDIR /app

COPY . .

RUN test -f index.html

RUN mkdir -p /out && cp -a . /out/


# Run Stage
# Runs as non-root
FROM nginxinc/nginx-unprivileged:1.27-alpine

LABEL org.opencontainers.image.title="eks-game" \
      org.opencontainers.image.description="Static browser game served by nginx" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="UNKNOWN"

# Uses nginx web root. Ships only what's needed.
COPY --from=build /out/ /usr/share/nginx/html/

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
CMD wget -qO- http://127.0.0.1:8080/ >/dev/null || exit 1


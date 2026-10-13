# syntax=docker/dockerfile:1

FROM --platform=$BUILDPLATFORM alpine:latest AS builder
RUN apk add --no-cache curl binutils
ARG TARGETARCH
ARG TARGETVARIANT
ARG SECURITYCHECK_REF=output

RUN set -eu; \
    case "$TARGETARCH" in \
      amd64|386|arm64|riscv64) binary="securityCheck-linux-$TARGETARCH" ;; \
      arm) test "$TARGETVARIANT" = v7; binary=securityCheck-linux-armv7 ;; \
      *) echo 'Unsupported target architecture' >&2; exit 1 ;; \
    esac; \
    curl --fail --location --silent --show-error --retry 3 \
      "https://github.com/oneclickvirt/securityCheck/releases/download/$SECURITYCHECK_REF/$binary" \
      -o /securityCheck; \
    machine=$(readelf -h /securityCheck | awk -F: '/Machine:/ {sub(/^[[:space:]]+/, "", $2); print $2}'); \
    case "$TARGETARCH:$machine" in \
      'amd64:Advanced Micro Devices X86-64'|'386:Intel 80386'|'arm:ARM'|'arm64:AArch64'|'riscv64:RISC-V') ;; \
      *) echo 'Downloaded binary does not match the image architecture' >&2; exit 1 ;; \
    esac; \
    chmod 755 /securityCheck

FROM alpine:latest
COPY --from=builder /securityCheck /usr/local/bin/securityCheck
ENTRYPOINT ["/usr/local/bin/securityCheck"]

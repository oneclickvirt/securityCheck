# syntax=docker/dockerfile:1

FROM alpine:latest AS builder
RUN apk add --no-cache \
    wget \
    curl \
    bash
ENV GITHUB_URL="https://github.com/oneclickvirt/securityCheck/releases/download/output"
COPY <<EOF /download_script.sh
#!/bin/bash

arch=$(uname -m)
os=$(uname -s)

get_architecture_url() {
  case $arch in
    "x86_64" | "amd64" | "x64") echo "$GITHUB_URL/securityCheck-linux-amd64" ;;
    "i386" | "i686") echo "$GITHUB_URL/securityCheck-linux-386" ;;
    "armv7l" | "armv8" | "armv8l" | "aarch64") echo "$GITHUB_URL/securityCheck-linux-arm64" ;;
    "mips") echo "$GITHUB_URL/securityCheck-linux-mips" ;;
    "mips64") echo "$GITHUB_URL/securityCheck-linux-mips64" ;;
    "mips64le") echo "$GITHUB_URL/securityCheck-linux-mips64le" ;;
    "mipsle") echo "$GITHUB_URL/securityCheck-linux-mipsle" ;;
    "riscv64") echo "$GITHUB_URL/securityCheck-linux-riscv64" ;;
    *)
      echo "Unsupported architecture: $arch"
      exit 1
      ;;
  esac
}
wget -O /securityCheck $(get_architecture_url)
EOF
RUN chmod +x /download_script.sh && /download_script.sh
FROM alpine:latest
COPY --from=builder /securityCheck /usr/local/bin/securityCheck
RUN chmod +x /usr/local/bin/securityCheck
ENTRYPOINT ["/usr/local/bin/securityCheck"]

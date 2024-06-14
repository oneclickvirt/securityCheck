# syntax=docker/dockerfile:1

FROM alpine:latest AS builder
RUN apk add --no-cache wget curl bash

ENV GITHUB_URL="https://github.com/oneclickvirt/securityCheck/releases/download/output"

RUN echo '#!/bin/bash' > /download_script.sh \
 && echo 'arch=$(uname -m)' >> /download_script.sh \
 && echo 'os=$(uname -s)' >> /download_script.sh \
 && echo '' >> /download_script.sh \
 && echo 'get_architecture_url() {' >> /download_script.sh \
 && echo '  case $arch in' >> /download_script.sh \
 && echo '    "x86_64" | "amd64" | "x64") echo "$GITHUB_URL/securityCheck-linux-amd64" ;;' >> /download_script.sh \
 && echo '    "i386" | "i686") echo "$GITHUB_URL/securityCheck-linux-386" ;;' >> /download_script.sh \
 && echo '    "armv7l" | "armv8" | "armv8l" | "aarch64") echo "$GITHUB_URL/securityCheck-linux-arm64" ;;' >> /download_script.sh \
 && echo '    "riscv64") echo "$GITHUB_URL/securityCheck-linux-riscv64" ;;' >> /download_script.sh \
 && echo '    *)' >> /download_script.sh \
 && echo '      echo "Unsupported architecture: $arch"' >> /download_script.sh \
 && echo '      exit 1' >> /download_script.sh \
 && echo '      ;;' >> /download_script.sh \
 && echo '  esac' >> /download_script.sh \
 && echo '}' >> /download_script.sh \
 && echo 'wget -O /securityCheck $(get_architecture_url)' >> /download_script.sh

RUN chmod +x /download_script.sh && /download_script.sh

FROM alpine:latest
COPY --from=builder /securityCheck /usr/local/bin/securityCheck
RUN chmod +x /usr/local/bin/securityCheck
ENTRYPOINT ["/usr/local/bin/securityCheck"]

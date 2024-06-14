# syntax=docker/dockerfile:1

FROM alpine:latest AS builder
RUN apk add --no-cache \
    wget \
    curl \
    bash
ENV CDNS="https://cdn0.spiritlhl.top/ https://cdn1.spiritlhl.net/ https://cdn2.spiritlhl.net/ https://cdn3.spiritlhl.net/"
ENV GITHUB_URL="https://github.com/oneclickvirt/securityCheck/releases/download/output"
COPY <<EOF /download_script.sh
#!/bin/bash
arch=\$(uname -m)
os=\$(uname -s)
cdn_success_url=""
check_cdn() {
  local url=\$1
  for cdn in \$CDNS; do
    if curl -sL -k "\$cdn\$url" --max-time 6 | grep -q "success" >/dev/null 2>&1; then
      cdn_success_url=\$cdn
      return
    fi
    sleep 0.5
  done
}
get_architecture_url() {
  case \$arch in
    "x86_64" | "x86" | "amd64" | "x64") echo "\$GITHUB_URL/securityCheck-\${os,,}-amd64" ;;
    "i386" | "i686") echo "\$GITHUB_URL/securityCheck-\${os,,}-386" ;;
    "armv7l" | "armv8" | "armv8l" | "aarch64") echo "\$GITHUB_URL/securityCheck-\${os,,}-arm64" ;;
    *) echo "Unsupported architecture: \$arch" && exit 1 ;;
  esac
}
check_cdn "https://raw.githubusercontent.com/spiritLHLS/ecs/main/back/test"
if [ -n "\$cdn_success_url" ]; then
  echo "CDN available, using CDN"
else
  echo "No CDN available, no use CDN"
fi
wget -O /securityCheck \$(get_architecture_url)
EOF
RUN chmod +x /download_script.sh && /download_script.sh
FROM alpine:latest
COPY --from=builder /securityCheck /usr/local/bin/securityCheck
RUN chmod +x /usr/local/bin/securityCheck
ENTRYPOINT ["/usr/local/bin/securityCheck"]

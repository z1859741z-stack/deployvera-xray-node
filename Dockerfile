# Xray (VLESS + WS + TLS) — single container image for Render / Pxxl / Light Cloud
#
# The platform terminates TLS at its edge and forwards plain WebSocket to this
# container, so Xray listens for plain WS on $PORT with path /tk-rail.
# No secret is baked into the image: UUID comes from the platform env var.
FROM alpine:3.20

RUN apk add --no-cache ca-certificates curl unzip

ARG XRAY_VERSION=v26.11.9
RUN curl -fsSL -o /tmp/xray.zip \
      "https://github.com/XTLS/Xray-core/releases/download/${XRAY_VERSION}/Xray-linux-64.zip" \
 && unzip -o /tmp/xray.zip xray -d /usr/local/bin/ \
 && chmod +x /usr/local/bin/xray \
 && rm /tmp/xray.zip

COPY entrypoint.sh /entrypoint.sh
COPY xray-template.json /xray-template.json
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

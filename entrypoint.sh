#!/bin/sh
# Render / Pxxl / Light Cloud entrypoint.
# Renders /xray-template.json with the UUID and PORT env vars, then runs Xray.
# UUID is NOT in this repo: set it as an env var in the platform dashboard.
set -e

: "${UUID:?UUID env var is required (set it in the platform dashboard)}"
PORT="${PORT:-8080}"

sed -e "s|\${UUID}|${UUID}|g" -e "s|\${PORT}|${PORT}|g" \
  /xray-template.json > /tmp/config.json

echo "[entrypoint] starting xray on port ${PORT} (ws path /dv-ws)"
exec /usr/local/bin/xray run -c /tmp/config.json

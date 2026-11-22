# deployvera-xray-node

Xray (VLESS + WS + TLS) for DeployVera free plan. Platform terminates TLS at its edge and forwards plain WebSocket to the container.

- No secret is baked into the image: UUID comes from the platform env var `UUID`.
- Xray listens on `$PORT` (DeployVera sets it), WS path `/dv-ws`.
- Deploy: connect this repo on DeployVera, Dockerfile build, set env `UUID=<your uuid>`, port = $PORT.

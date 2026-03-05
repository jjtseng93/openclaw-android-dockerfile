# Intro
- A lightweight Dockerfile-compatible build workflow for running OpenClaw on Android using PRoot.
- Keeps a minimal set of downstream patches in order to stay as close to upstream OpenClaw as possible.
- The patches are limited to build system adjustments and Docker tooling required for Android builds.

# Usage
```shell
git clone https://github.com/jjtseng93/openclaw-android-dockerfile.git
cd openclaw-android-dockerfile
sh build.sh
```

# Main patches
## os.networkInterfaces() system error 13
- Calling Termux node for IP addresses
## ensure browser automation for Bun
- WebSocket using require('ws')
## chromium no-sandbox
- openclaw.json for disabling browser sandbox

#!/bin/bash
# Thakhin OS (သခင် OS) — Anti-Tarzan Community Edition ISO builder
# Launches a DETACHED privileged Debian live-build container per architecture.
# Detached = survives terminal/session restarts; the container self-logs to
# dist/build-<arch>.log and writes dist/DONE-<arch> (or FAILED-<arch>) at the end.
#
#   ./build.sh              # amd64 (default — PC / Intel Mac / VirtualBox)
#   ./build.sh amd64        # amd64
#   ./build.sh arm64        # arm64 (Apple Silicon via UTM)
#   ./build.sh amd64 arm64  # both — NOTE: launches in parallel; needs RAM/disk
#
# Watch:   tail -f dist/build-amd64.log     Stop: docker stop thakhin-build-amd64
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
SITE_ROOT="$(cd "$HERE/.." && pwd)"   # the winkokolatt.me crawl
mkdir -p "$HERE/dist"

ARCHES=("$@")
[ "${#ARCHES[@]}" -eq 0 ] && ARCHES=(amd64)

for ARCH in "${ARCHES[@]}"; do
  case "$ARCH" in
    amd64) PLATFORM=linux/amd64 ;;
    arm64) PLATFORM=linux/arm64 ;;
    *) echo "Unknown arch: $ARCH (use amd64 or arm64)"; exit 2 ;;
  esac
  docker rm -f "thakhin-build-$ARCH" >/dev/null 2>&1 || true
  rm -f "$HERE/dist/DONE-$ARCH" "$HERE/dist/FAILED-$ARCH"
  echo "Launching detached build: Thakhin OS 1.0 — $ARCH ($PLATFORM)"
  docker run -d --privileged \
    --platform "$PLATFORM" \
    --name "thakhin-build-$ARCH" \
    -v "$HERE:/src" \
    -v "$SITE_ROOT:/website:ro" \
    -e DEBIAN_FRONTEND=noninteractive \
    -e THAKHIN_ARCH="$ARCH" \
    debian:bookworm \
    bash /src/container/build-inside.sh
  echo "  container: thakhin-build-$ARCH   log: dist/build-$ARCH.log"
done

echo "Detached. Watch with: tail -f $HERE/dist/build-<arch>.log"
echo "Done when dist/DONE-<arch> appears (or FAILED-<arch> on error)."

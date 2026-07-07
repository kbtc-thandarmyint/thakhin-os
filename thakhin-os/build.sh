#!/bin/bash
# Thakhin OS (သခင် OS) — Anti-Tarzan Community Edition ISO builder
# Builds one privileged Debian live-build container per architecture.
#
#   ./build.sh              # builds BOTH amd64 and arm64 (sequential; low-RAM safe)
#   ./build.sh amd64        # just amd64  (PC / Intel Mac / VirtualBox)
#   ./build.sh arm64        # just arm64  (Apple Silicon Mac via UTM)
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
SITE_ROOT="$(cd "$HERE/.." && pwd)"   # the winkokolatt.me crawl
mkdir -p "$HERE/dist"

ARCHES=("$@")
[ "${#ARCHES[@]}" -eq 0 ] && ARCHES=(amd64 arm64)

for ARCH in "${ARCHES[@]}"; do
  case "$ARCH" in
    amd64) PLATFORM=linux/amd64 ;;
    arm64) PLATFORM=linux/arm64 ;;
    *) echo "Unknown arch: $ARCH (use amd64 or arm64)"; exit 2 ;;
  esac
  echo "################################################################"
  echo "#  Building Thakhin OS 1.0 — $ARCH  ($PLATFORM)"
  echo "################################################################"
  docker run --rm --privileged \
    --platform "$PLATFORM" \
    --name "thakhin-build-$ARCH" \
    -v "$HERE:/src" \
    -v "$SITE_ROOT:/website:ro" \
    -e DEBIAN_FRONTEND=noninteractive \
    -e THAKHIN_ARCH="$ARCH" \
    debian:bookworm \
    bash /src/container/build-inside.sh 2>&1 | tee "$HERE/dist/build-$ARCH.log"
done

echo "==== ALL REQUESTED BUILDS DONE ===="
ls -lh "$HERE/dist/"*.iso 2>/dev/null || true

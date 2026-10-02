#!/usr/bin/env bash
# Cloudflare Pages build command for ben2.com.
#
# Downloads a released Bower binary (github.com/afternoon/bower) - the
# Steel/Rust static site generator this site uses - verifies its checksum,
# and runs it against this repo to produce ./build.
set -euo pipefail

BOWER_VERSION="v0.1.0"
BOWER_TARGET="x86_64-unknown-linux-gnu"
BOWER_SHA256="60f7f6cd46942c29022571b111ada928d9b47661c0b407fefd55d1e4f48fc7e4"

name="bower-$BOWER_VERSION-$BOWER_TARGET"
archive="$name.tar.gz"
url="https://github.com/afternoon/bower/releases/download/$BOWER_VERSION/$archive"

rm -rf .bower
mkdir .bower
curl --proto '=https' --tlsv1.2 -sSfL -o ".bower/$archive" "$url"
echo "$BOWER_SHA256  .bower/$archive" | sha256sum -c -
tar xzf ".bower/$archive" -C .bower

".bower/$name/bower"

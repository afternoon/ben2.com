#!/usr/bin/env bash
# Cloudflare Pages build command for ben2.com.
#
# Cloudflare's build image doesn't include Rust, so this installs it, then
# clones and builds Bower (github.com/afternoon/bower) - the Steel/Rust
# static site generator this site uses - and runs it against this repo to
# produce ./build.
set -euo pipefail

if ! command -v cargo >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
  . "$HOME/.cargo/env"
fi

rm -rf .bower-src
git clone --depth 1 https://github.com/afternoon/bower.git .bower-src
cargo build --release --manifest-path .bower-src/Cargo.toml

./.bower-src/target/release/bower

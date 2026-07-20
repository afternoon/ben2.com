# ben2.com

Source for [ben2.com](https://ben2.com), built with [Bower](https://github.com/afternoon/bower),
a static site generator using Steel Scheme and Rust.

## Layout

- `site.scm` - site metadata and page templates (Scheme)
- `posts/` - blog posts as Markdown files with YAML frontmatter
- `public/` - static assets (CSS, images, favicon), copied as-is into the build output
- `build/` - generated site (not committed)

## Building locally

Bower isn't vendored in this repo. Clone and build it, then run it from here:

```bash
git clone https://github.com/afternoon/bower.git ../bower
cargo build --release --manifest-path ../bower/Cargo.toml
../bower/target/release/bower
```

Or use `build.sh`, which does the same thing (and installs Rust if it's missing):

```bash
./build.sh
```

The generated site is written to `build/`.

## Deploying (Cloudflare Pages)

This repo has a `wrangler.toml` pinning the Pages build output directory to `./build`, but
Cloudflare Pages build command and root directory settings aren't expressible in a config
file - they're set in the dashboard (Workers & Pages → ben2-com → Settings → Builds):

- **Build command**: `./build.sh`
- **Build output directory**: `build` (also set via `wrangler.toml`)
- **Root directory**: `/`

Every deploy installs a fresh Rust toolchain and does a clean `cargo build --release` of
Bower (Cloudflare Pages has no cargo/target caching), so builds take a few minutes.

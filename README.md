# ben2.com

Source for [ben2.com](https://ben2.com), built with [Bower](https://github.com/afternoon/bower),
a static site generator using Steel Scheme and Rust.

## Layout

- `site.scm` - site metadata and page templates (Scheme)
- `posts/` - blog posts as Markdown files with YAML frontmatter
- `public/` - static assets (CSS, images, favicon), copied as-is into the build output
- `build/` - generated site (not committed)

## Building

Use [Bower](https://github.com/afternoon/bower).

`build.sh` will install Rust and Bower. It's primarily meant for CI.

The generated site is written to `build/`.

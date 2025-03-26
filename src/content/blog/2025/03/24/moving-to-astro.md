---
title: "Moving to Astro"
description: "Moving to Astro"
date: "Mar 24 2025"
---

After a decade on Tumblr, I've moved this blog to [Astro](https://astro.build) hosted on [Cloudflare
Pages](https://pages.cloudflare.com).

Astro is static site generator written in JavaScript. Its similar to Jekyll or Hugo. Content is
generated from Markdown files. Instead of templates, JSX components are used to build HTML.

For years, the standard way to build HTML in a web app was with templates. HTML documents are large
and complex enough that generating them in code quickly becomes unwieldy. JSX makes that manageable
with a syntax which removes boilerplate. Everything becomes a JS expression. This improves over
templates because syntax errors are caught by the compiler, they are composable, and they can
be generated and manipulated programmatically, for example, by mapping a JSX function over an array.

I initially moved the blog to Jekyll, because it has stood the test of time. JSX is much nicer to
work with. I also wanted to use Tailwind CSS. Jekyll is now getting old, and there's no simple
Tailwind integration story.

Static site generators are great. They're fast. The content can be hosted anywhere. When the web
first started, we first built pages by hand, then we dynamically generated them with CGI scripts
then PHP, then Rails, and many other tools. It was 20 years before static site generation became
popular. This is kind of crazy. We had all the tools, it just wasn't a popular approach.

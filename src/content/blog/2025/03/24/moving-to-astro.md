---
title: "Moving to Astro"
description: "Moving to Astro"
date: "Mar 24 2025"
---

After a decade on Tumblr, I've moved this blog to [Astro](https://astro.build) hosted on [Cloudflare
Pages](https://pages.cloudflare.com).

Astro is static site generator written in JavaScript. Its similar to Jekyll or Hugo. Content is
generated from Markdown files, but JSX components are used to build HTML, rather than templates.

For years, the standard way to build HTML in a web app was with templates. HTML documents are large
and complex enough that building them in code quickly becomes unwieldy. Previous efforts, like
Python's [ElementTree](https://docs.python.org/3/library/xml.etree.elementtree.html) tried to make
this manageable, but code using this approach is full of boilerplate. JSX puts XML-like tag syntax
directly into the language. Building documents in code means everything is just an expression. This
improves over templates (and mixed-mode text generation languages like PHP) because syntax errors
are caught by the compiler, expressions are composable, and they can be generated and manipulated
programmatically. For example, we can map a JSX function over a collection. Components are
essentially functions that return JSX expressions, so we can use them to create reusable snippets of
HTML, like a page header.

Initially I [moved the blog to
Jekyll](https://github.com/afternoon/ben2.com/commit/b35e9776506c650630d2044dfd668c06093cf548).
Jekyll is simple, flexible and has stood the test of time. Once I started playing with Astro
however, I remembered how much nicer JSX is to work with. I also wanted to use Tailwind CSS.
Jekyll is starting to get a bit old and the community is less active. There's no simple Tailwind
integration story. Customising Jekyll's default theme was straightforward, but building a theme from
scratch in Tailwind was even easier. (Which is due to a great extent to my extremely minimalist
design approach.)

Static site generators are great. They're fast. The content can be hosted anywhere. The repo +
workers + static hosting model has proliferated, with a ton of great providers. When the web first
started to grow in popularity, we built HTML pages by hand (in my case, in Notepad). Then we
dynamically generated pages with CGI scripts, then PHP, then Rails, then many other tools. It was
more than 15 years before Jekyll made static site generation popular. This is kind of crazy. Way
back in the 90s we had everything we need, there were even tools like
Rael Dornfest's (Blosxom)[https://blosxom.sourceforge.net]. It just wasn't a popular approach.

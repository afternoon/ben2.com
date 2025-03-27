---
layout: post
title: Haskell web frameworks reinvent too much
date: '2009-01-27T09:53:08+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880416947/haskell-web-frameworks-reinvent-too-much
---
<p>Paul R Brown&rsquo;s web application <a href="http://github.com/prb/perpubplat/tree">perpubplat</a> (personal publishing platform) differs from a lot of the other Haskell web code I&rsquo;ve seen - it doesn&rsquo;t try to reinvent every wheel.</p>

<p><a href="http://happs.org/">HAppS</a> and <a href="http://www.turbinado.org/">Turbinado</a> are 2 example Haskell frameworks. Both implement a web server. The HAppS project is implementing transactional ACID-compliant in-memory state, SMTP, IRC, DNS and much more.  Turbinado is building a Rails-like stack.</p>

<p>These projects present large untested codebases. Neither project has a list of sites running their software. As a programmer considering using these tools, there&rsquo;s just too much that could go wrong, too much I will have to understand and fix myself.</p>

<p>perpubplat is not a framework, but it&rsquo;s a concise easy to understand codebase. It also contains a number of familiar looking patterns that every framework needs - logging, url mapping/routing. Most importantly, it doesn&rsquo;t try to reinvent the wheel, it uses standard Haskell code where possible and serves pages to a web server via FastCGI.</p>

<p>Only serving responses through FastCGI makes complete sense to me. Apache, Lighty, Nginx and others are all great tools for getting static content out to the world. They are very configurable, offering flexibility for security rules, url rewriting, etc. Why try to build a product to mimic this existing code when you can piggyback on top of it through FastCGI? Instead all that programmer time can be used to build everything else required by a Haskell web application.</p>

<p>Wheel-reinvention (also known as Not Invented Here syndrome) makes it harder to use your code and harder to improve upon it, as parts become interdependent. Small pieces, loosely coupled means the Haskell framework conversation can evolve more quickly.</p>

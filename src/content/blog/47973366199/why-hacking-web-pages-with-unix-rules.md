---
layout: post
title: Why Hacking Web Pages With Unix Rules
date: '2003-02-14T11:30:09+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47973366199/why-hacking-web-pages-with-unix-rules
---
<p>The changes that I&rsquo;ve been making have involved numerous small amendments to a site I didn&rsquo;t build and that was built with tools that are now several years out of date. Whilst web building is just as easy on any platform, amending sites is considerably faster on Unix. Here&rsquo;s why:</p>
<ul>
<li><code>wget</code>. First of all I could not log in to the FTP server. No reason, just one of those things, so I wgot the whole site (<code>wget -m</code>), this has the advantage of removing any redundant files.</li>
<li><code>tidy</code>. This runs on most OSs, but is just the most useful tool. In one <code>tidy</code> run, I converted the whole site to XHTML, cleaned up any redundant or empty tags, removed all <code>&lt;font&gt;</code> tags and rewrote them to CSS and indented the code properly so that I could find my way around it and so that it was easier to match blocks of code with regular expressions.</li>
<li><code>grep</code>. I would locate an error, <code>grep</code> the whole set of files for that error and then look at only those that matched. Using <code>grep</code> I could test the effectiveness of changes made with <code>perl</code> and generally assess what was going on with the site across 116 files with no delay. And, more importantly, no drudge work!</li>
<li><code>perl</code>. Cake. Icing. <code>Perl</code> is fantastically useful and extremely flexible when it comes to text manipulation. Within the framework of a very simple program I built sets of regular expressions that, when applied to the current site, made the kind of changes I needed to make. These were things like, changing an icon to point somewhere else on every page, changing the header on every page to remove a banner. This kind of stuff is doable with other find/replace tools. But take into account that whilst the banner HTML was visually identical, it&rsquo;s code was not. Some places would use a &lt;br /&gt;, others a spacer Gif. Only regex&rsquo;s stay ahead in that game.</li>
</ul>
<p>The most important thing was that all my <code>grep</code>ping and <code>perl</code>ing (the bulk of the effort) was great fun and in no way dull. Using brute force to make all these changes was certainly possible (with the exception of the <code>tidy</code> work) but it would have been dull as fuck. With a little programmatic magic on the other hand, I was able to skip through it, giggling like a schoolboy who&rsquo;s just dropped a trojan into the staff network.</p>
<p>I rewarded myself by buying <a href="http://www.amazon.co.uk/exec/obidos/ASIN/050028315X/ref=sr_aps_books_1_1/026-4221393-3035609">a book</a> and <a href="http://www.thinkgeek.com/tshirts/coder/5cb5/">a t-shirt</a>.</p>

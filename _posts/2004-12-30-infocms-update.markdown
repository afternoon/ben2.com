---
layout: post
title: InfoCMS update
date: '2004-12-30T06:16:08+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880498625/infocms-update
---
<p>Since talking to Mat about his future plans for <a href="http://moblog.co.uk/">Moblog</a> I&rsquo;ve been working on adding virtual-serving and componentised pages to InfoCMS. The former is there now and can be considered alpha. The latter still has a bit of a way to go, but with the latest version I can construct pages by pointing and clicking my way around.</p>

<p>So that&rsquo;s cool. I&rsquo;m a bit worried about the state of the code though. It&rsquo;s looking a touch ugly, which is a greater concern because this is a framework that&rsquo;s meant to make developing apps easier. If the code is unreadable, it will be noticeably less useful. Interestingly enough, I&rsquo;ve been thinking that some of the spaghettification is due to using arrays as an all purpose record type, instead of creating any proper data types. PHP doesn&rsquo;t really have types, so I&rsquo;ve been thinking about what this stuff would look like in a statically-typed language. I&rsquo;m not going to be rewriting this in Haskell or Ocaml any time soon, though I would really love to have a crack at it.</p>

<p>*short pause*</p>

<p>Crap, now I spent an hour building <code>mod_caml</code>, <code>ocaml-mysql</code> and deps. I&rsquo;d love to have time to spend on this kind of thing, but I&rsquo;ve got two large projects to deliver at the end of the month.</p>

<p>Anyway, InfoCMS is coming on. Night.</p>

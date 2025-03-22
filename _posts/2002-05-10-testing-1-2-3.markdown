---
layout: post
title: Testing 1 2 3
date: '2002-05-10T22:51:06+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058156163/testing-1-2-3
---
<p>Having spent a week on the <a href="http://smarty.php.net/">Smarty</a> mailing list I&rsquo;ve learnt quite a lot about and and thought about how to use it. I knocked up a demo that uses a bunch of templates to build a Hype 0.2 style page. Nicely it takes about 30 lines of code (and a splash of HTML, obviously). It uses a frame template and a portal template as 0.2 does, they&rsquo;re are pretty simple but they could be slightly cleaner. The left and right blocks of portlets are arrays so the theme designer has to know how to use a Smarty foreach.</p>
<p>I also wrote a lot of Perl. I wrote a one liner that converts text files to uber-simple, a one-liner that does sentence capitalisation and a many-liner that deduces the average hits to each page from a set of Apache logfiles. This showed me that Hype gets about 6,100 hits a month, which makes me happy.</p>
<p>Also for new-hype, I&rsquo;ve been thinking about threads more. It occured to me that a public thread with only one author is a weblog, so I might integrate this with Hype, we&rsquo;ll see. Also I like the aggregating up to the front page bit. I originally built Hype&rsquo;s stupid thread support like it is because I thought that proper forum style threads would stop users posting to the front page and just reduce the amount of content. However, Hype&rsquo;s post counts have stabilised, so I&rsquo;m wondering if the opposite may be true: that other threads would just increase the amount of posting and the number of people doing it. A more general message server, rather than the flow-of-existence style of the front page.</p>
<p>Clearly threads are going to have to more central to a new version of the code, so I think I will tackle that task next, given that themes is more than 50% done (i.e. design and initial implementation).</p>

---
layout: post
title: Milestone 4 and much of 5
date: '2004-04-19T06:25:09+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880522980/milestone-4-and-much-of-5
---
<p>Well, first of all, I set out a bunch of milestones for Hypothetical, so that I could measure my progress a bit more. Today I knocked M4 down and got two thirds of the way to M5.</p>
<p>M4 was basically the groups section. That is functionality to browse groups, join them, leave them, create new groups, kick people out of groups and all kinds of funky stuff. That&rsquo;s all running now. I&rsquo;m pretty happy with the way it works as well.</p>
<p>M5 is:</p>
<ul>
<li>Visiting</li>
<li>People</li>
<li>Files</li>
</ul>
<p>The people section isn&rsquo;t done yet and I haven&rsquo;t really thrashed the whole visitor thing that much. That needs some real testing ideally as it&rsquo;s potential security risk-o-rama. But I&rsquo;ll get my lovely punters to do that. I&rsquo;ve used a declarative system, where the view class for a page decides if it&rsquo;s visitor-friendly. By default all pages are not visitable, so I can tell easily where visitors are able to go and as I add new pages, they&rsquo;re blocked off automatically. I decided to let visitors see the full set of navigation sections, but get a message if they click any they can&rsquo;t visit (e.g. post). The page that results in wandering too far reminds me of playing shareware games as a kid. It&rsquo;s cool.</p>
<p>At points I&rsquo;ve felt a bit uninspired by some of the interface design I&rsquo;m doing. Looking at other social sites and taking cues, Hype is a bit flat sometimes. In places where Yahoo would have 15 million links, I have two. But my main target is to get a working version of the software live ASAP so that I can get people on board and take comments from them. In that respect it often just makes the most sense to copy the old Hypothetical and add a few bells and whistles. After all, the old Hype has stood the test of time and still works.</p>
<p>Then there are some other bits where I&rsquo;ve had no mould. The groups section is an example. I took cues from Yahoo, Tribes and the work I did for TfL for that and it came out looking pretty good. Good enough that I then spread some of the layout style used there to other parts of the site to liven them up a bit. Some areas of the site are pretty utilitarian in design, until I think of something better. But as it&rsquo;s taking me a moderate amount of time to build, I&rsquo;m thinking of better stuff as I progress. Here&rsquo;s to incremental improvement!</p>
<p>I&rsquo;ve just made the user name at the top of a message into a link to that user&rsquo;s info page as well. It&rsquo;s the little things&hellip;</p>

---
layout: post
title: Hypothetical 2 on route
date: '2001-09-24T00:45:17+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058182963/hypothetical-2-on-route
---
<p>I put some code in a file!</p>
<p>Hopefully there will be more later, but for now, here is a list of some code conventions I&rsquo;m hoping to uphold:</p>
<ul>
<li>Names: blah_blah_blahblah. Functions, variables, files, the lot. Additionally functions should be prefixed h_</li>
<li>All include files go in /lib</li>
<li>Everything&rsquo;s part of the session, all the pages. If the userid isn&rsquo;t there then nothing will work. Oh well, I&rsquo;m not going to support people who turn off cookies. On the WAP side, I&rsquo;ll use the PHP SID where it&rsquo;s needed.</li>
<li>Definitely gonna go with a page on each site of the transaction. I can&rsquo;t work out this whole one page does all thing.</li>
<li>Having all the content in the database is an interesting idea. Have all the content bits as just another kind of portlet.</li>
<li>MySQL results have result_ prefix and fetch_array&rsquo;s have arr_ to remind me to use fetch_array and not fetch_row. No fetch_row'ing in h2</li>
</ul>
<p>Anyway, back to the work&hellip;</p>

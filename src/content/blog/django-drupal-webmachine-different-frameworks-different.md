---
layout: post
title: 'Django, Drupal, Webmachine: Different frameworks for different projects'
date: '2009-05-13T14:26:02+01:00'
tags:
- django
- drupal
- webmachine
tumblr_url: https://aftnn.org/post/47880411928/django-drupal-webmachine-different-frameworks-different
---
<p><a href="http://www.djangoproject.com/">Django</a> is an awesome framework but different projects have different needs. The last 2 projects I&rsquo;ve been involved with have been using <a href="http://drupal.org/">Drupal</a>. Other projects I&rsquo;m planning call for very RESTful designs. <a href="http://bitbucket.org/justin/webmachine/wiki/Home">Webmachine</a>, an Erlang framework, is a great fit for these.</p>

<p>I do still very much love Python and Django, perhaps even more that I&rsquo;m using PHP day to day. I miss the REPL. I miss first class functions. I miss Django&rsquo;s very tidy organisation of code.</p>

<p>Drupal is something I&rsquo;ve studiously avoided for a long time, thinking it to be a Zope-like mire. That&rsquo;s true to an extent: there are many versions and a lot of code. Drupal apps do have good separation of concerns. The internal organisation of modules and themes is useful, although there&rsquo;s a little bit too much function name magic going on (&ldquo;Why isn&rsquo;t my validator firing? Who knows!&rdquo;). I&rsquo;m interested in hooks, although I haven&rsquo;t needed them yet. The same concept has served Django hackers well.</p>

<h2>Leaky abstractions</h2>

<p>Django and Drupal are both leaky abstractions. It&rsquo;s easy to create great big joins with Django&rsquo;s ORM. Drupal generates a mammoth set of CSS and JS imports per page. Both of these can be addressed with programmer discipline, but sometimes it&rsquo;s nice to have a thinner level of abstraction to make you think carefully about each requirement and how best to implement it. Webmachine is such an abstraction. What it does provide, however, is system management built on top of Erlang and OTP. People doing scale (a group I&rsquo;m not a member of) find that writing the initial app is easy, scaling it is hard.</p>

<h2>Easy hacking, easy scaling</h2>

<p>Newer frameworks seek to make initial implementation easy and scaling easy too. Webmachine is undoubtedly somewhat harder to code for than Django, there are less batteries included, but, in theory at least, scaling is easier. Only a little of that is due to implementation, most is due to architectural style. Webmachine does get in your way a bit less when hacking RESTfully. Django does things like setting cookies on every hit, making caching harder, increasing load on your app.</p>

<p>I think the current leader for easy hacking, easy scaling is Google App Engine. The core of Django runs happily, the system scales to Google&rsquo;s infrastructure, deployment is very simple. GAE has one flaw though, porting to another platform involves work modifying code and extracting data. While the code scales effortlessly, scaling a business around that code seems harder. If your goals don&rsquo;t chime with Google&rsquo;s, you&rsquo;re stuck. Frameworks running on open source software stacks are more trustable and it&rsquo;s for this reason that EC2 is so much more popular than GAE to date.</p>

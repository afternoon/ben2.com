---
layout: post
title: Concurrent functional programming
date: '2006-03-27T19:23:23+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880455922/concurrent-functional-programming
---
<p>Another big advantage of effects-free programming is that it makes developing concurrent applications much safer. Current frameworks seem to stay away from the concurrency issue, each response is generated in a single thread and the web and database servers are used to enable concurrency. E.g. Apache worker thread contains a mod_python which contains an instance of Django. At least it seems this way. FastCGI does a similar thing, spawning multiple instances of the CGI to handle requests. All this means that the framework coder worries not about thread safety. This is a workable solution because HTTP is stateless, just get the cookie, pull the session from the DB and we&rsquo;re ready to go again.</p>
<p>To be quite honest, I&rsquo;m not exactly what the implications of being able to do concurrent code more safely would be in this context, I just don&rsquo;t have enough experience in this area, perhaps the answer is that a Haskell-based framework would feel very similar in this respect. The coder working on top of the framework would not see concurrency-related stuff. However, I would expect that while Python and Ruby assert that no threading problems will leap up out of the framework and bite you, Haskell would guarantee it.</p>
<p>This does have implications for the framework implementation of course. A mod_haskell solution wouldn&rsquo;t be ideal, Apache&rsquo;s threads are more heavyweight than the GHC solution certainly and so would damage performance. Haskell would be a good candidate for building a FastCGI-based system, but it might be optimal to use HWS. However, HWS has nothing like the usage of Apache and so it&rsquo;s hard to assert it demonstrates the same security and reliability.</p>

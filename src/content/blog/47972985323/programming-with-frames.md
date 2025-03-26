---
layout: post
title: Programming with frames
date: '2003-09-26T18:59:51+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47972985323/programming-with-frames
---
<p>It occurred to me last night, as I was debugging some particularly tangly Javascript and Java running in several frames, that programming a complex web application that uses frames is essentially developing a multi-threaded application. You have the synchronisation issues that you get with multiple threads, albeit on a lesser scale as you usually have many more threads than frames.</p>
<p>On top of that, because the round-trip time to the server is so much higher than access times for threads running locally, you just can&rsquo;t use a lot of the typical techniques for solving sync problems. Also, as the frames are <em>meant</em> to act as a coherent whole, you have to ensure that they dance together properly. They can communicate with each other and they can communicate with the server, but only in the most basic ways.</p>
<p>Sometimes, this makes things hard.</p>

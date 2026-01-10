---
layout: post
title: Appletalk forwarding over SSH
date: '2003-09-08T06:49:32+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973006524/appletalk-forwarding-over-ssh
---
<p class="eg"><code>ssh -L 5548:127.0.0.1:548 user@host</code></p>
<p>If the box you&rsquo;re SSHing to is the machine you want to Appletalk to. Awesome. Otherwise change 127.0.0.1 to the name of the server you want to talk to <em>as the remote machine sees it</em>.</p>
<p>The initial 5548 part is a port on your machine that will become the gateway to the remote box. I chose 5548 because you don&rsquo;t have to be root to bind to it and it&rsquo;s moderately memorable. In the style of 8080. Anyway. To connect go to Finder and do Apple-K as normal. Then enter the URL <code>afp://localhost:5548/</code>. The SSH terminal session must be active for the forwarding to be open, unfortunately.</p>

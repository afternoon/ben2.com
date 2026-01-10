---
layout: post
title: VPNs on OS X
date: '2003-09-30T16:45:27+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47972980163/vpns-on-os-x
---
<p>Are really easy to setup! No really:</p>
<ol>
<li>Open Internet Connect</li>
<li>Choose &ldquo;New VPN Connection&rdquo; from the file menu</li>
<li>Enter your VPN server, user name and password details</li>
<li>Hit connect</li>
</ol>
<p>This gave me a connection, but it also jiggered my routing table so that I couldn&rsquo;t see the internet. <code>route</code> made short work of this problem however:</p>
<ol>
<li><code>route delete default</code></li>
<li><code>route add default $ROUTER_IP</code></li>
<li><code>route add $FOREIGN_NETWORK $VPN_IP</code></li>
</ol>
<p>Luckily the network I&rsquo;m connecting to uses a different class C IP range, so the routes were easy to add. If there had been an address space clash I would have had to specify routes for the individual hosts in their network I guess.</p>
<p>Now that&rsquo;s all set up, time to load <code>nmap</code> :-)</p>

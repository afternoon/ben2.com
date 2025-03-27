---
layout: post
title: Apple, why Sendmail?
date: '2003-07-18T16:22:37+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973055934/apple-why-sendmail
---
<p>I use Sendmail for SMTP because the current distribution of qmail is subtly broken for some reason on Jaguar. Can&rsquo;t quite work out why and I need outgoing SMTP too much to sit down and play with it. Anyway, Sendmail requires that / not be group writeable. This is understandable as Sendmail is so riddled with security issues it really needs all the help it can get. Still, I don&rsquo;t quite understand why Apple doesn&rsquo;t change the default sendmail.cf to ignore the permissions at least. It&rsquo;s a bit insecure, but who do they think is using Sendmail? Anybody running a big server will use a decent MTA. For that matter, why are they even shipping Sendmail? qmail is simpler to run, faster, better and more secure, especially if it&rsquo;s being supported by the OS vendor. Postfix is also very good I hear. Exim&rsquo;s pretty tight too. What on earth would make anyone choose Sendmail for a new OS? Especially a desktop one.</p>
<p>By the way, I mention this because they issued a software update this week and instead of removing the group writeable permission I accidentally removed group executable permission. Doh! I locked myself out of the machine and it wouldn&rsquo;t even boot until I remembered about single user mode. Phew!</p>

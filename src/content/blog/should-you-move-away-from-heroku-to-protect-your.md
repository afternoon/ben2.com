---
layout: post
title: Should You Move Away From Heroku To Protect Your Users?
date: '2013-06-07T10:44:00+01:00'
tags:
- heroku
- ssl
- security
tumblr_url: https://aftnn.org/post/52370062780/should-you-move-away-from-heroku-to-protect-your
---
<p>Heroku provides an <a href="https://addons.heroku.com/ssl">SSL add-on</a> for encrypting traffic between browsers and the Heroku network.</p>

<p>However, SSL is terminated at the Heroku routing layer. Traffic is then passed unecrypted through the network to your application. That network is AWS.</p>

<p>A Heroku support agent confirmed this by email:</p>

<blockquote>
  <p>&ldquo;I have confirmed with our routing team that HTTPS traffic will be
  terminated at the SSL Endpoint, and passed over to the runtime (where
  your application resides) in plaintext.&rdquo;</p>
</blockquote>

<p>If your customers are submitting sensitive data to your app, like payment card details or personally-identifiable information, then that data is transmitted between nodes in Heroku&rsquo;s network without encryption.</p>

<h2>Threat?</h2>

<p>Does this mean your traffic can be intercepted by other users? I&rsquo;m not a security expert but I believe it&rsquo;s a risk you might not want to take with customer data.</p>

<p>Apps running on Heroku do not have root access, but it&rsquo;s possible to sniff network traffic even without root access, e.g. <a href="http://packetlife.net/blog/2010/mar/19/sniffing-wireshark-non-root-user/">Sniffing with Wireshark as a Non-Root User</a>.</p>

<p><a href="https://policy.heroku.com/security">Heroku&rsquo;s Security policy</a> claims that packet sniffing is not possible:</p>

<blockquote>
  <p>&ldquo;Managed firewalls prevent IP, MAC, and ARP spoofing on the network
  and between virtual hosts to ensure spoofing is not possible. Packet
  sniffing is prevented by infrastructure including the hypervisor which will
  not deliver traffic to an interface which it is not addressed to. Heroku
  utilizes application isolation, operating system restrictions, and
  encrypted connections to further ensure risk is mitigated at all levels.&rdquo;</p>
</blockquote>

<p>About a month ago, <a href="https://blog.heroku.com/archives/2013/5/2/new_dyno_networking_model">Heroku revised their networking model to improve isolation between dynos</a>:</p>

<blockquote>
  <p>&ldquo;Previously, network interfaces were shared between multiple dynos. [&hellip;]
  The shared network interface [&hellip;] resulted in a low grade information
  leak where one dyno could obtain some information about connections
  made by other dynos. This information did not include any customer
  data or other customer identifying information. But it broke the core
  principle of tenant isolation. With the new networking model, dynos now
  have fully isolated network configurations.&rdquo;</p>
</blockquote>

<h2>PCI</h2>

<p>The PCI standard requires that sensitive data be encrypted at rest and when transmitted over public networks, but not internal networks. Heroku&rsquo;s network is surely public, despite their considerable pains to make it look and feel like an internal network.</p>

<h2>Alternatives</h2>

<p>AWS allows traffic to be encrypted between an Elastic Load Balancer and EC2 instances via a feature called <a href="http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/US_SettingUpLoadBalancerHTTPS.html">backend server authentication</a>.</p>

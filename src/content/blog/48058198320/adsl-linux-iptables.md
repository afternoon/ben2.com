---
layout: post
title: ADSL + Linux + iptables
date: '2001-08-20T18:16:59+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058198320/adsl-linux-iptables
---
<p>Spent all weekend doing it pretty much, but Tullis and I managed to get City Rd&rsquo;s Debian box sharing our brand spanking new lovely speedy ADSL connection around our little LAN. I posted <a href="http://hypothetical.co.uk/viewmsg.php?msgid=1549">this</a> message to Hypothetical to explain how we did it to one of Hype&rsquo;s users. The whole thing was a excellent learning process. We had to rebuild the kernel which was not new but is always fun. Then PPPD has modules for PPPoA/E, and that&rsquo;s about all is needed to support a USB ADSL modem.</p>
<p>Getting our heads around iptables over ipchains or ipfwadm proved to be a steeper learning curve. Basically we spent a day getting ADSL working and a day getting IP masquerading et al working. In the end we just had to download an example set of tight firewall rules and then hack it open a bit. cityroad.hn.org currently reports every known port as open or filtered when basic nmapped, which is not ideal, and it does reply to incoming ICMP type 8 packets (that&rsquo;s ping, hehe), which I&rsquo;m not sure I like, but it will be handy.</p>
<p>Tonight I will get on to shoring the defences up again a bit more. At the end of the day, we are there, no two ways about it, but the fact that we have some security will hopefully discourage any potential h4x0rs and move them along to one of our windoze-runnin&rsquo;, no-clue-havin&rsquo; virtual neighbours.</p>

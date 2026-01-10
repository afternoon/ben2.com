---
layout: post
title: Mrs Marsh hired him to fix the Jagwar
date: '2002-08-22T05:10:28+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973392938/mrs-marsh-hired-him-to-fix-the-jagwar
---
<p>Woo hoo! Mac OS X 10.2! Yay!</p>
<p>Like a new version of Windows this is minor tweaks and new features. There are umpteen lists out there so I won&rsquo;t go into too much detail. Suffice to say that there are enough changes to give it a slightly disorienting feel but by NO means enough of an improvement to warrent the huge sticker price! Bastards always have to charge so much for what is essentially a very big bug fix.</p>
<ul>
<li>There is proper Samba support, both as a client and a server, which is nice. Users can be Samba users or you can stop them logging in from System Preferences.</li>
<li>As usual they&rsquo;ve over-written Internet Explorer. You&rsquo;ll need to follow <a href="http://boingboing.net/2002_08_01_archive.html#85337595">this tip</a> in order to get it to search Google again (link mainly for my benefit). The server appears to be dead right now. Basically, change &ldquo;http://home.microsoft.com/access/autosearch.asp?p=%s&rdquo; in Localized.rsrc to any URL that&rsquo;s 52 characters long. %s will be replaced with what you type after &rsquo;? &rsquo;.</li>
<li>I found the new version of Mail to be totally incompatible (like, instant crash incompatible) with Sen:te&rsquo;s GPG bundle.</li>
<li>Spring-loaded folders is OK, but they fucked it in column-view. It opens a new window instead of moving forward a column! Stupid stupid stupid! I&rsquo;m definitely writing to Apple about that one.</li>
<li>Sendmail isn&rsquo;t working properly again either. It&rsquo;s not open on 25 (no this has nothing to do with the new firewall config). It has another different config file. But I still can&rsquo;t understand it :-). Silly Sendmail. <b>Update</b>: This is the group-writeable root problem that has surfaced before. You can get around it by doing <code>chmod g-w /</code> or you can edit sendmail.cf to tell it not to worry about it.</li>
<li>PHP is turned off! Can&rsquo;t quite work out how to turn it on again, maybe I need to <a href="http://www.entropy.ch/">download the module again</a></li>
<li>It has connection sharing for PPP connections, a la 2000/XP, which is a nice feature.</li>
<li>Tab-tab to display a list of completion possibilites in TCSH seems to have died. I know this one, it&rsquo;s probably in Linux in a Nutshell (buy it! now! essential book). If I could just stop typing long enough to stand&hellip; yep, add <code>set autolist=ambiguous</code> to your .tcshrc file. If you haven&rsquo;t got one it needs to go in your home folder.</li>
<li>New libraries have broken my Vim! Aaarrrggghhh! Ben need vim, vi no do! Wait, the MacVim people have <i>already</i> built a <a href="http://macvim.swdev.org/OSX">new version</a>. Nice one, guys.</li>
</ul>

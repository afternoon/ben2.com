---
layout: post
title: Hypothetical 2 progress
date: '2004-04-06T09:04:51+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880532460/hypothetical-2-progress
---
<p>Saturday I started hacking in some of things I&rsquo;ve been thinking about for a while. Group support basically. &ldquo;Hypothetical gives an established group a place to hang out online&rdquo; is to be the value proposition. So I created a social software style login page, i.e. one that won&rsquo;t let you in until you fill in a form :-). My version allows you to visit however, though that isn&rsquo;t yet implemented. I also implemented the beginnings of the group membership subsystem and started modding the current features so that they exist in a group environment. Cool thought: groups is Hypothetical virtualisation.</p>
<p>Tonight I hacked a profile section together in just over an hour. It reads the config layout like wwWebflow, though there&rsquo;s only basic information there at the moment (very much unlike wwWebflow). That will get fleshed out though. For the first time in Hype 2, it&rsquo;s possible to change your theme! Not that there are any other themes to use :-(. Profile section lacks niceties as well, such as drop downs where appropriate and things like that. Like I said, more context needed in the config layout. Once the data is in the layout, drawing on it is as easy as <a href="http://smarty.php.net/manual/en/language.function.html.options.php">{html_options}</a>.</p>

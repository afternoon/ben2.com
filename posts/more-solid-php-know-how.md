---
layout: post
title: More solid PHP know-how
date: '2001-10-05T16:26:02+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058179338/more-solid-php-know-how
---
<p>Using the putenv and getenv functions UNIX enviroment variables can be used to store info on the server, but without tying it to any particular user (session). Probably only variables called PHP_something can be used, but this is sysadmin configurable. Maybe this can be used thus: getenv(&ldquo;PHP_WHOS_LOGGED_AT_HYPE&rdquo;) would return a list of user id&rsquo;s active recently (maybe their times also as the names will need to be removed at some point). getenv(&ldquo;PHP_HYPE_01010_START&rdquo;) could be used to record when the page generation started, but this would be more usefully put into the code.</p>

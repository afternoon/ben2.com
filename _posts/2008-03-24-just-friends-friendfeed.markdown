---
layout: post
title: Just Friends FriendFeed
date: '2008-03-24T19:31:40+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880426813/just-friends-friendfeed
---
<p>As mentioned earlier, I like <a href="http://friendfeed.com">FriendFeed</a>. One thing I found frustrating was the lack of a feed just tracking what my friends are doing. The nearest thing provided includes my own activities. I know about these!</p>
<p>I posted in <a href="http://groups.google.com/group/friendfeed/browse_thread/thread/77408fe1e81a92da/16b4368a818d46c7#16b4368a818d46c7">FF&rsquo;s Google Group</a>, but after a few days there are still no replies. However, a workaround is to use Yahoo! Pipes to manipulate the feed, filtering out my own activity.</p>
<p>Pipes is quite intuitive, so I&rsquo;ll just outline the design of my FF pipe:</p>
<ol>
<li>Use a Fetch Feed node from the Sources section to retrieve your feed from FriendFeed. There is an authorisation ID in the url, so don&rsquo;t share it!</li>
<li>Add a Filter node from Operators. Set the filter to block all posts where the title contains &ldquo;You &rdquo;. I would have preferred to use a regex here, but the logical values (&ldquo;^You .*&rdquo; etc) didn&rsquo;t work.</li>
<li>Output!</li>
</ol>
<p>Pipes output to RSS, email, SMS, etc, so you can now use your FriendFeed-without-you feed anywhere you like. I&rsquo;m just using it to track how my peeps iz rollin&rsquo;.</p>

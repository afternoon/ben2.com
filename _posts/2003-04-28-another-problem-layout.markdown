---
layout: post
title: Another problem layout
date: '2003-04-28T03:36:49+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973248750/another-problem-layout
---
<p>Blocks with pretty graphical borders.</p>
<p>Often you see content managed sites that feature content split up into multiple blocks. The chief example is probably the weblog. Many people like to put nice graphical borders around each &ldquo;portlet&rdquo;, but this requires tables or a whole bunch of CSS faff. The gist is simple, a particular graphic at each corner and then others that scale either vertically or horizontally to fit the sides, the sizes of which are dictated by the content.</p>
<p>An example would be the portlets down the left of <a href="http://www.amazon.com/">Amazon&rsquo;s front page</a> or the content areas on <a href="http://www.theforumnorfolk.com">The Forum&rsquo;s site</a> (one of mine).</p>
<p>This problem distills down to a more fundamental one: the problem of arranging one piece of content at the left side of a block and another at the right. Another example would be a toolbar that has navigational links on the left, and displays the time on the right. This is a doddle with tables, but in CSS, the <code>float</code> property isn&rsquo;t powerful enough and wasn&rsquo;t really designed for the task. As usual you can go a long with absolute positioning here, but it&rsquo;s usefulness begins to break down as you start including more complex content in your two regions.</p>

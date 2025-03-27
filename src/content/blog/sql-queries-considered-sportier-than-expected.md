---
layout: post
title: SQL Queries Considered Sportier Than Expected
date: '2004-05-17T00:36:47+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880515177/sql-queries-considered-sportier-than-expected
---
<p>Did some optimising of Hype this weekend. When I wrote the new version I didn&rsquo;t think at all about query efficiency, I used <a href="http://pear.php.net/manual/en/package.database.db-dataobject.php">DB_DataObject</a> to handle all the SQL and just got on with implementing the functionality required. When I came to do some optimisation the first thing I looked at was the number of queries that were actually being run. Turns out it&rsquo;s about 100 for the home page. Those portlets are data hungry!</p>

<p>The obvious candidate for optimisation was the high scores portlet. The query behind that did a count on the messages for a group (&gt;36,000 for <em>Class of 2001</em>) and grouped them by user. It was taking at least 2.5 seconds for the big group. Once I eliminated that, the other queries take no time at all. Less than a hundredth of a second for a select.</p>

<p>So the actual mechanism of querying MySQL from PHP itself is pretty efficient. The queries themselves can be slow however. I&rsquo;m going to be timing queries on the MySQL command line from now on, but I won&rsquo;t be thinking of perfomance too much when I next need to trawl something from the DB.</p>

<p>If you&rsquo;re interested at looking at some profiling info for Hype, add <code>?debug=true</code> to any page URL and check out the tail of the HTML source.</p>

<p><small><strong>Note</strong>: My MySQL server and web server aren&rsquo;t even on the same box, but they are in the same rack.</small></p>

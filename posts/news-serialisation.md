---
layout: post
title: News serialisation
date: '2001-08-31T01:41:47+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058188127/news-serialisation
---
<p>In order to cut down on the load on those poor 56k modems long lists of shit need to be serialised into multiple pages. This can be acheived by limiting the SQL query return to a given number (i.e. 25). On the first page that&rsquo;s all that is needed, the front page then passes the id of the last item to the suceeding page. This is used in the query in the form &lt; id and with limit 25, that&rsquo;s the recordset. Next page and previous page links can be provided. The front page only has next and any page that displays less than 25 records doesn&rsquo;t display the next page link. This is a kludge, but getting 26 records and dropping the last one would be a workaround.</p>
<p>Combine this with a simple one page search system and the a comments setup and you have &ldquo; X &rdquo; the weblog product&hellip;</p>

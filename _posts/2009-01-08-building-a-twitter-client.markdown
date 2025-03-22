---
layout: post
title: Building a Twitter client
date: '2009-01-08T07:27:08+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880418500/building-a-twitter-client
---
<p>I&rsquo;m a keen twitterer. When I read my tweets I see find that certain voices shout louder than others, where volume = tweet frequency. Those voices aren&rsquo;t necessarily the ones I care about. I want to know what&rsquo;s going on with my more restrained friends too.</p>

<p>I designed <a href="http://followize.appspot.com/">Followize</a> to solve this problem. Like <a href="http://twitter100.com/">Twitter100</a>, it shows the latest tweet from each friend. The UI is more efficient than Twitter100&rsquo;s and I have some enhancements planned that I hope will make Followize a very quick and convenient way to keep up with the people you&rsquo;re following.</p>

<p>Followize uses the <a href="http://apiwiki.twitter.com/REST+API+Documentation#friends">Twitter API&rsquo;s friends method</a>. Until yesterday, the documentation for that method said it would return &ldquo;up to 100 of the authenticating user&rsquo;s friends who have most recently updated.&rdquo; I.e. that the sort order is the <code>created_at</code> time of each friend&rsquo;s latest status update. Subsequent pages of less-recently-updating friends can be requested as well. Followize is just a nice UI for this data built on <a href="http://code.google.com/appengine/">Google App Engine</a>.</p>

<p>However, after building the app and using it for a little while, I noticed that the data was not sorted in this way at all. I raised this as an <a href="http://code.google.com/p/twitter-api/issues/detail?id=224&amp;colspec=ID%20Stars%20Type%20Status%20Priority%20Owner%20Summary%20Opened%20Milestone">API issue</a>. One of Twitter&rsquo;s engineers responded that this was a documentation error, rather than a software error, and updated the docs. The correct order is (effectively) the date the user began following a given person. Unfortunately this all but kills my application.</p>

<p>If Twitter is sending the data in the wrong order for my app, I have to load all the data and sort it myself. The first person I followed might be the one who has most recently updated and thus the last record in the results of the friends method call. Pulling a page of 100 friends from Twitter to App Engine takes around 0.8 seconds, decoding the JSON then takes another 0.15 seconds. Good old <a href="http://twitter.com/scobleizer">Scobleizer</a> follows 21K people, Obama follows 171K! Loading all the required data for Scoble would take 3.3 minutes, plus some time for sorting, committing to cache etc. Twitter rate limits API requests to 100 per 60 minute period. Loading those 21K friends requires 210 API requests, and that&rsquo;s only for one page. Scoble is likely to reload the page a few minutes later and the whole thing begins again.</p>

<p>I&rsquo;m looking at using Gnip as a workaround, but this is sub-optimal. A rough strategy would be as follows:</p>

<ol>
<li>A user logs in to Followize for the first time.</li>
<li>A background process loads the complete list of their friends from Twitter&rsquo;s API.</li>
<li>Followize adds those friends to a Gnip filter of Twitter users followed by Followize users.</li>
<li>Gnip POSTs updates for each user to a Followize API endpoint.</li>
<li>Followize stores users being followed and their latest update in it&rsquo;s DB.</li>
<li>When the user requests the page, tweets are loaded from the DB.</li>
</ol>

<p>This drawbacks to this approach are:</p>

<ul>
<li>Step 2 could still fall fowl of Twitter&rsquo;s API rate limit, necessitating a 1 hour wait.</li>
<li>The application load doesn&rsquo;t scale with traffic. Scoble could sign up, I&rsquo;ll start getting a tonne of tweets coming in from Gnip, but Scoble may never visit Followize again, rendering that traffic useless. I can pull data up to 60 minutes old from Gnip, so I could minimize the processing overhead by pulling tweets every 60 seconds for example.</li>
<li>All of these API calls would be too long-running for Google App Engine.</li>
<li>The application complexity is dramatically increased and it is now reliant on an additional remote service.</li>
</ul>

<p>I&rsquo;d like Twitter to order the data for me, but Twitter&rsquo;s API as it stands can&rsquo;t be modified to do all the heavy lifting for every application. Gnip has an interesting model in that they allow you to offload some work, filtering of data, to them. A model in which I could write my own view of Twitter&rsquo;s data and upload that to be run locally to their DB would be a great solution. Given the wide range of apps using Twitter&rsquo;s API, I&rsquo;m hopeful.</p>

<p><strong>Update, Jan 9</strong>: <a href="http://www.docstoc.com/docs/3190008/State-of-the-Twittersphere">HubSpot&rsquo;s State of the Twittersphere</a> says that only 12% of Twitter users are following more than 100 people. I&rsquo;d suggest those are not likely the people who will find Followize useful though. In addition, most Twitter users are new to the service and following lists grow with time.</p>

<p><strong>Update, Jan 17</strong>: After initial setbacks, I found simply pulling several pages from the Twitter API and caching them with staggered timeouts provides a good enough user experience. <a href="http://followize.appspot.com/">Followize</a> lives!</p>

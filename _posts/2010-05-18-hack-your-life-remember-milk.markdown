---
layout: post
title: Hack your life with Remember The Milk
date: '2010-05-18T22:35:38+01:00'
tags:
- rememberthemilk
- lifehacks
- webapps
tumblr_url: https://aftnn.org/post/47880402391/hack-your-life-remember-milk
---
<p><img src="http://aftnn.org/stuff/journal_src/rtmtasks.png" alt="Alt text"/></p>

<p>At first glance, <a href="http://www.rememberthemilk.com/">Remember The Milk</a> (henceforth RTM), is a simple todo list web app. Dig deeper and you&rsquo;ll find a very flexible, customisable and programmable platform.</p>

<h2>Getting Things Done</h2>

<p>Like many todo list apps, RTM roughly follows the <a href="http://en.wikipedia.org/wiki/Getting_Things_Done">Getting Things Done</a> (GTD) methodology.</p>

<ul>
<li>The overview allows you to focus on tasks for today, tomorrow or this week.</li>
<li>The tasks view allows you to manage tasks, categorise them into lists (inbox, errands, work, etc), tag them, set due dates, set repeating behaviour and add urls, notes and time estimates.</li>
<li>The locations view lets you assign tags to locations (useful when you use a mobile app).</li>
</ul>

<h2>Hacks</h2>

<h3>Quick task add</h3>

<p>Adding tasks to RTM is a hack in itself. They have a nice terse syntax for specifying the attributes of a task. Days, times and urls are parsed automatically, e.g. &ldquo;Buy tea 1pm,&rdquo; but you can save a lot of time using their <a href="http://www.rememberthemilk.com/services/smartadd/">Smart Add</a> operators. E.g.:</p>

<pre><code>Prioritise issues Monday #Work !2 *weekly
</code></pre>

<p>Means:</p>

<blockquote>
  <p>Add a task called &lsquo;Prioritise issues&rsquo; for Monday, add it to my 'Work&rsquo; list, set the priority to 2 and repeat it every Monday.</p>
</blockquote>

<p>See the <a href="http://www.rememberthemilk.com/services/smartadd/">Smart Add documentation</a> for details and lots of examples.</p>

<h3>Keyboard shortcuts</h3>

<p>RTM&rsquo;s <a href="http://www.rememberthemilk.com/help/answers/basics/keyboard.rtm">keyboard shortcuts</a> save a lot of time when navigating around the application. There are lots of them, they cover the app pretty comprehensively, making it feel more like a desktop app.</p>

<h3>iPhone app</h3>

<p>Before switching to RTM, I used <a href="http://www.omnigroup.com/products/omnifocus/">OmniFocus</a> on 2 Macs and my iPhone. The iPhone app was always very slow to load and sync. I hardly used it. RTM&rsquo;s <a href="http://www.rememberthemilk.com/services/iphone/">iPhone app</a> is simple, fast and useful. It starts fairly quickly (although I wouldn&rsquo;t complain if they shaved off another second or 2). Critically, once it has started, it&rsquo;s very quick to add tasks (thanks to Smart Add) and to sync. RTM pushes reminders as app notifications (which are like richer text messages). The number of incomplete tasks (either for today or in total) is shown as an icon badge. The app does just the things you need and does them well.</p>

<p>There is also an <a href="http://www.rememberthemilk.com/services/android/">Android app</a> and sync tools for <a href="http://www.rememberthemilk.com/services/milksync/blackberry/">Blackberry</a> and <a href="http://www.rememberthemilk.com/services/milksync/windowsmobile/">Windows Mobile</a>.</p>

<h3>Reminders for events with due times</h3>

<p>RTM can send you task reminders via email, SMS, Twitter or iPhone app notifications. You can configure RTM to send reminders for all events or just  events with due times.</p>

<p>I forget to do things, so I set due times for things and RTM sends me an iPhone notification. I guess when I&rsquo;m going to be in the shop and get RTM to remind me when I&rsquo;m there. An alternative way to do this would be to set locations for tasks and then check the location list when I arrive.</p>

<h3>Repeating tasks</h3>

<p>Tasks can be set to repeat and RTM can express quite specific schedules, e.g. &ldquo;every month on the 4th&rdquo; or &ldquo;after 6 months.&rdquo; See the <a href="http://www.rememberthemilk.com/help/answers/basics/repeatformat.rtm">repeat interval documentation</a> for details. I use it to remind me to do my weekly online grocery shop.</p>

<h3>Add to RTM bookmarklet</h3>

<p>RTM&rsquo;s <a href="http://www.rememberthemilk.com/help/answers/quickadd/">Quick Add Bookmarklet</a> makes setting reminders from your browser extra quick and easy. Unfortunately, it doesn&rsquo;t save address of the current page with the new task.</p>

<h3>rtm command using mail</h3>

<p>I&rsquo;m never far from a bash shell, so it&rsquo;s useful to have a command to add things to RTM. This command uses RTM&rsquo;s <a href="http://www.rememberthemilk.com/help/answers/sending/emailinbox.rtm">email to task list</a> feature.</p>

<pre><code>rtm() { echo '' | mail -s "$*" username+12345x@rmilk.com; }
</code></pre>

<p>The Smart Add operators mean I can easily set all the attributes I need on the task from a single command. I haven&rsquo;t gotten into scripting it yet, but it would be simple to add RTM tasks in that way. There are loads of ways this could be helpful. For example, I could create a cron job to check disk space on my servers and add a high-priority RTM task if a disk becomes more than 80% full.</p>

<p>You could also write a version of this command that uses Twitter to upload tasks or goes direct to the API, e.g. using the <a href="http://code.google.com/p/rtmapi/">Python API wrapper</a>.</p>

<h3>Searching and smart lists</h3>

<p>You can search RTM with a bewildering array of Google-like search operators. Search for tasks tagged blah with <code>tag:blah</code> or see work tasks completed yesterday with <code>completedWithin:"1 day of today" and list:Work</code>. You can save any search as a <a href="http://www.rememberthemilk.com/help/answers/smartlists/">Smart List</a>, which adds a tab to your tasks view. Tasks added when viewing a smart lists inherit the attributes of that list.</p>

<p>Smart lists have a million applications. Here are some ways I&rsquo;ve used them:</p>

<ul>
<li>Create a master &ldquo;Work&rdquo; list and then smart lists that filter by tag to show items for individual projects. View the big picture or focus on a project.</li>
<li>Create a list of tasks recently completed. Check it before going along to review meetings.</li>
</ul>

<h3>Even more hacks</h3>

<p>There are loads more RTM hacks I haven&rsquo;t tried yet:</p>

<ul>
<li><a href="http://www.rememberthemilk.com/services/api/">A full-featured API (the uber-hack)</a>.</li>
<li><a href="http://www.rememberthemilk.com/services/gmail/">A nice Gmail widget</a>.</li>
<li><a href="http://www.rememberthemilk.com/help/answers/sharing/">Publish (read-only) and share (read/write) lists</a>.</li>
<li><a href="http://www.rememberthemilk.com/help/answers/icalendar/">Export to your calendar</a>.</li>
<li><a href="http://www.rememberthemilk.com/help/answers/tasks/printlist.rtm">Nice printing</a>.</li>
<li><a href="http://www.rememberthemilk.com/help/answers/atom/">RSS/Atom feeds</a>.</li>
</ul>

<h2>Your life, hacked</h2>

<p>RTM supports a myriad of ways to organise your life and work. It&rsquo;s easy to get started and flexible enough to support many different styles of organisation. Some really powerful features help you work smart. The app is always responsive, it gets out of your way and lets you focus on getting things done.</p>

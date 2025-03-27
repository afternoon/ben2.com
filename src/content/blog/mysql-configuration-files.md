---
layout: post
title: MySQL configuration files
date: '2003-09-24T02:38:00+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47972988164/mysql-configuration-files
---
<p>I use a shell script run as a cron job to back up this database and the Hype database. To do this the scripts needed the correct passwords to get to the data. In an ideal world I might have set up an account with select-only access, but it&rsquo;s a shared server and I only have one account per database. I was specifying the username and password for MySQL on the command line and anyone else could see it with a simple <code>ps</code>.</p>
<p>The much better way is to create a defaults configuration file. MySQL cnf files can consist of any option specified as a command line argument. They are organised by application, e.g.</p>
<p class="eg"><code>
[client]<br/>
user=myname<br/>
password=mypassword<br/>
host=mysql.com</code></p>
<p>The password option has exactly the same effect of putting <code>--password=mypassword</code> on the command line to the MySQL client. You can have sections for <code>mysqld</code>, <code>mysqldump</code> and so on.</p>
<p>By default the MySQL apps will look in <a href="http://www.mysql.com/doc/en/Option_files.html">several files</a> for these kinds of settings. However, you can point it to a particular file with <code>--default-extras-file</code>. This loads your file after the global defaults. I use this to point mysqldump at two different databases.</p>

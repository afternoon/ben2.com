---
layout: post
title: Autocommands
date: '2003-11-26T04:02:13+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880570902/autocommands
---
<p class="eg"><code>au BufRead * set keywordprg=/Users/ben/Documents/bin/google.php<br/>
au BufRead *.java set keywordprg=/Users/ben/Documents/bin/google.php\ java\ site:sun.com</code></p>
<p>Autocommands are a powerful tool in Vim. By assigning autocommands to the BufRead action, I can specify commands to run whenever I move to a buffer. The next argument is a pattern to match on the file name. So here I&rsquo;m saying, when you transfer to a buffer, set the keyword program to my Googling script. Then if the file is a java file, set the keywordprg to the Google script with some extra arguments which make the search more likely to return Javadoc for the thing I&rsquo;m Googling.</p>
<p>Result: a custom editing mode for Java which knows more about the document that the standard environment. As I edit more and more files I&rsquo;ll be adding a lot of autocommands for each filetype using much of Vim&rsquo;s functionality, like macros for tags for an HTML mode. Because the menus in Vim are editable from scripts, I can add custom menus for each filetype as well.</p>
<p>It sounds like I should actually be doing this stuff with ftplugins as of version 6 though&hellip;</p>

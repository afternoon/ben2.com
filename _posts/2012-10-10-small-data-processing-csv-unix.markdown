---
layout: post
title: 'Small Data: Processing CSV In Unix'
date: '2012-10-10T18:14:59+01:00'
tags:
- unix
- awk
tumblr_url: https://aftnn.org/post/47880397601/small-data-processing-csv-unix
---
<p>Unix provides a wealth of great tools for performing simple analysis of small datasets. <code>awk</code> in particular is useful for crunching CSV files.</p>

<p>Why use Unix tools and not Excel? The commands you create can be saved as a script and applied to updated files, multiple files at once, combined with curl to process a file from the web.</p>

<p>Here&rsquo;s a few examples using a fictional data file, <code>emails.csv</code>, which contains data about a number of email campaigns sent to customers.</p>

<h2>Get Started</h2>

<p>First, let&rsquo;s inspect the file format by printing the first few rows.</p>

<pre><code>$ head -5 emails.csv
ReportRunOn,MemberID,StartDate,EndDate
10/10/2012 13:13:10,1038277,10/09/2012 00:00:00,10/10/2012 23:59:59

UserName,UserID,JobID,EmailName,EmailSubject,PickupTime,BCC,CcEmail,NormalSends,NormalSendsBCC,NormalSendsCC,TriggeredSends,TriggeredSendsBCC,TriggeredSendsCC,NormalSends_1,NormalSendsBCC_1,NormalSendsCC_1,TriggeredSends_1,TriggeredSendsBCC_1,TriggeredSendsCC_1
Ben Godfrey,ben.godfrey,1839429,Example Email,Give us your feedback!,05/10/2012 15:22:55,,,1,0,0,0,0,0,470,0,0,0,0,0
</code></pre>

<p>This file has a metadata section at the top. Let&rsquo;s chop that off.</p>

<pre><code>$ tail +4 emails.csv &gt; emails-no-meta.csv
</code></pre>

<h2>Introducing <code>awk</code></h2>

<p>The file has a lot of columns. We can use <code>awk</code> to extract only the columns
we&rsquo;re interested in.</p>

<p>As an intermediate result, let&rsquo;s just print out the first column.</p>

<pre><code>$ awk -F, '{ print $1 }' emails-no-meta.csv | head
UserName
Ben Godfrey
Ben Godfrey
Ben Godfrey
Ben Godfrey
Ben Godfrey
Other User
Other User
Other User
Other User
</code></pre>

<p><code>awk</code>&rsquo;s <code>-F</code> argument sets the field separator. We&rsquo;re using the comma character.
Use <code>-F\\t</code> for tabs. The default separator is the space character.</p>

<p>We provide a program to <code>awk</code> on the command line. <code>awk</code> programs operate on
each line, with <code>BEGIN</code> and <code>END</code> sections to do pre- and post-processing on the
whole file.</p>

<p>This simple program contains a block which is applied to all lines and prints
<code>$1</code>, which is <code>awk</code>&rsquo;s syntax for column 1.</p>

<p>We can go a step futher and add a pattern match to our program so we print the
first column of lines matching &ldquo;Ben Godfrey.&rdquo;</p>

<pre><code>$ awk -F, '/Ben Godfrey/ { print $1 }' emails-no-meta.csv
Ben Godfrey
Ben Godfrey
Ben Godfrey
Ben Godfrey
Ben Godfrey
</code></pre>

<p>This is functionally equivalent to using <code>grep</code> and piping the result to <code>awk</code>.</p>

<pre><code>$ grep "Ben Godfrey" emails-no-meta.csv | awk -F, '{ print $1 }'
Ben Godfrey
Ben Godfrey
Ben Godfrey
Ben Godfrey
Ben Godfrey
</code></pre>

<p>The <code>awk</code>-only solution involves less overhead - only one pass through the file
and only program is used - but <code>grep</code> is such a powerful tool and familiar to so
many that it is often used for the filtering part of a pipeline. Combining
simple tools to create powerful results is a key part of the Unix philosophy.</p>

<h2>More Columns</h2>

<p>We can also use <code>awk</code> to construct a new CSV file with a subset of columns.</p>

<pre><code>$ awk -F, '/Ben Godfrey/ { print $1","$4","$6","$9 }' emails-no-meta.csv
Ben Godfrey,Example Email,05/10/2012 15:22:55,1
Ben Godfrey,Example Email,05/10/2012 17:06:59,1
Ben Godfrey,Example Email,08/10/2012 10:36:45,2
Ben Godfrey,Example Email,08/10/2012 11:32:56,469
Ben Godfrey,Example Email,10/10/2012 12:02:53,4232
</code></pre>

<p>This is a powerful technique, because we can easily rerun that command on an
updated file. This beats performing the same manual steps in Excel for every new
file. We can also run the <code>awk</code> program again many files (potentially sourced
from different locations with <code>find</code> or <code>curl</code>).</p>

<p>As a final trick, let&rsquo;s total up how many emails I&rsquo;ve sent.</p>

<pre><code>$ awk -F, '/Ben Godfrey/ { total = total + $9 } END { print total }' emails-no-meta.csv
4705
</code></pre>

<p>We add the values from column 9 to the <code>total</code> variable as we proceed through
the file (as long as the line matches the expression <code>/Ben Godfrey/</code>). Finally,
we use an <code>END</code> block to print the value of <code>total</code>.</p>

<h2>Vim</h2>

<p>Most Unix tools, including <code>awk</code>, can operate on either a file or <code>stdin</code> and
<code>stdout</code>. Within Vim, you can filter the contents using an external program.</p>

<p>If we open <code>emails.csv</code> in Vim, we can issue the following command to reduce the
list of columns in the current buffer without modifying the original file.</p>

<pre><code>:%! awk -F, '{ print $1","$4","$6","$9 }'
</code></pre>

<p><code>%!</code> is a Vim command to filter the whole file through an external command. You
can also filter a specified range. We could filter every line except the
header.</p>

<pre><code>:2,$! awk -F, '{ print $1","$4","$6","$9 }'
</code></pre>

<p>Also, you can select some lines in visual mode then filter those.</p>

<pre><code>:'&lt;,'&gt;! awk -F, '{ print $1","$4","$6","$9 }'
</code></pre>

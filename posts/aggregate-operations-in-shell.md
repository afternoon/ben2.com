---
layout: post
title: Aggregate operations in shell
date: '2006-02-27T19:25:02+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880458151/aggregate-operations-in-shell
---
<p>You might be familiar with aggregate clauses in SQL, you know, <code>count(*)</code> and friends. I was interested in performing aggregate functions on files of tab-separated data. I&rsquo;d do an aggregate query in SQL, get a set of result rows, then I needed to total one column.</p>
<p>I output the data to TSV, using a <code>mysql -e</code> command and redirecting the output to a file. The data looks something like:</p>

<blockquote><pre>id      viewcount       comments
127067  341     44
127076  66      2
127077  158     6
127111  379     25
127112  83      3
127119  105     10
127131  47      0
127135  51      1
127137  133     17</pre></blockquote>

<p>I found that <code>awk</code> has the required mix of unix command line tool sensibilities and numeric functions. Here <code>awk</code> accumulates the 3rd value of each row and displays the total.</p>

<blockquote><code>cat data.tsv | awk '{x+=$3} END {print x}'</code></blockquote>

<p><code>awk</code> is basically C-like and has a small core set of <a href="http://www.gnu.org/software/gawk/manual/html_node/Numeric-Functions.html#Numeric-Functions">numeric functions</a> built-in. To calculate mean, divide the accumulator result by the <a href="http://www.gnu.org/software/gawk/manual/html_node/Auto_002dset.html#index-_0040code_007bNR_007d-variable-1060">built-in variable NR</a>, which is incremented each time a record (line) is processed and so contains the total line count by the time we reach the END block.</p>

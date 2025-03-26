---
layout: post
title: Vim Auto-closers Compared
date: '2014-02-05T22:14:00+00:00'
tags:
- vim
- plugins
tumblr_url: https://aftnn.org/post/75730734352/vim-auto-closers-compared
---
<p>I type <code>{</code>, Vim types <code>}</code> for me. Vim has a number of plugins to do this and
each does the job slightly differently.</p>

<ol>
<li><a href="https://github.com/Raimondi/delimitMate">delimitMate</a> by Raimondi (484
GitHub stars)</li>
<li><a href="https://github.com/jiangmiao/auto-pairs">Auto-Pairs</a> by Miao Jiang (181)</li>
<li><a href="https://github.com/kana/vim-smartinput">smartinput</a> by Kana Natsuno (239)</li>
<li><a href="https://github.com/vim-scripts/AutoClose">AutoClose</a> by Karl Guertin (44)</li>
<li><a href="https://github.com/Townk/vim-autoclose">AutoClose</a> by Townk (212)</li>
</ol>

<h2>My Requirements</h2>

<ol>
<li>Don&rsquo;t break HTML templates that use double braces, e.g. <code>{{name}}</code></li>
<li>Create a new block easily, i.e. type <code>{</code> and the matching <code>}</code> is inserted and
the cursor is positioned on a blank line between the two, correctly indented.</li>
<li>Handle escaped string terminators</li>
<li>Don&rsquo;t break other plugins</li>
<li>Understand that <code>"</code> is the comment character in Vim</li>
<li>BONUS! Press return within a string splits line, adds delimiters and a string
concatenation operator.</li>
</ol>

<table>
<thead>
<tr>
  <th>Feature</th>
  <th><a href="https://github.com/Raimondi/delimitMate">delimitMate</a></th>
  <th><a href="https://github.com/jiangmiao/auto-pairs">Auto-Pairs</a></th>
  <th><a href="https://github.com/kana/vim-smartinput">smartinput</a></th>
</tr>
</thead>
<tbody>
<tr>
  <td>HTML templates</td>
  <td>Doesn&rsquo;t work with HTML filetype</td>
  <td>✔</td>
  <td>✔</td>
</tr>
<tr>
  <td>New block</td>
  <td>✘</td>
  <td>✔ (type <code>{&lt;CR</code> to open a new block)</td>
  <td>✘</td>
</tr>
<tr>
  <td>Handle escaped string terminators</td>
  <td>✘</td>
  <td>✔</td>
  <td>✔</td>
</tr>
<tr>
  <td>Don&rsquo;t break other plugins</td>
  <td>✔</td>
  <td>✔</td>
  <td>✔</td>
</tr>
<tr>
  <td>Vim comment character</td>
  <td>✘</td>
  <td>✔</td>
  <td>✔</td>
</tr>
<tr>
  <td>String split</td>
  <td>✘</td>
  <td>✘</td>
  <td>✘</td>
</tr>
</tbody>
</table>

<h2><a href="https://github.com/vim-scripts/AutoClose">AutoClose</a> and <a href="https://github.com/Townk/vim-autoclose">AutoClose</a></h2>

<p>The AutoClose plugins are much simpler than the 3 tested above. If you&rsquo;re using
one and happy, great. If you&rsquo;re not using anything, try
<a href="https://github.com/Raimondi/delimitMate">delimitMate</a>,
<a href="https://github.com/jiangmiao/auto-pairs">Auto-Pairs</a> or
<a href="https://github.com/kana/vim-smartinput">smartinput</a>.</p>

<h2>The Winner: <a href="https://github.com/jiangmiao/auto-pairs">Auto-Pairs</a></h2>

<p>I&rsquo;m going with <a href="https://github.com/jiangmiao/auto-pairs">Auto-Pairs</a> unless it
breaks or I find something better.</p>

<p>I&rsquo;d be interested to investigate
<a href="https://github.com/kana/vim-smartinput">smartinput</a> a bit more, but Auto-Pairs
gets the job done with minimal effort.</p>

<h2>What About String Splitting?</h2>

<p>None of the tested plugins wrap strings. One way to implement this would be to
use <code>formatexpr</code> and <code>formatprg</code>, which tells Vim to run lines through a
formatter.</p>

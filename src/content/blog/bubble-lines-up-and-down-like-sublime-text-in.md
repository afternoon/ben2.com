---
layout: post
title: "“Bubble” Lines Up And Down Like Sublime Text In Vim"
date: '2014-02-06T11:51:00+00:00'
tags:
- vim
- sublime
tumblr_url: https://aftnn.org/post/75789536422/bubble-lines-up-and-down-like-sublime-text-in
---
<p><strong>NB</strong>: You can <a href="https://github.com/afternoon/dotvim/blob/master/gvimrc#L175">see this hack in my <code>.vim</code> repo on GitHub</a>.</p>

<p>Sublime Text allows you to use ^⌘↑ and ^⌘↓ to &ldquo;bubble&rdquo; a selected block of text up and down in a file.</p>

<p>For a single line, we could just use the <code>dd</code>, <code>j</code>, <code>p</code> and <code>P</code> motion and editing commands to move the current line around:</p>

<script src="https://gist.github.com/afternoon/9022808.js"></script>

<p>However, this doesn&rsquo;t work for multiline selections and it overwrites the default register, wiping anything you&rsquo;ve previously deleted to there.</p>

<p>A better solution is to use the <code>:move</code> command. We can safely use it in both normal and visual mode because it works with multiline blocks:</p>

<script src="https://gist.github.com/afternoon/9022823.js"></script>

<p>We pass locations relative to the selection to <code>:move</code>, <code>'&lt;-2</code> is 2 lines before the first line of the selection, <code>'&gt;+1</code> is one line after the last line.</p>

<p>In the visual mode mappings, we use <code>gv</code> to return to visual mode with the previous selection highlighted after the <code>:move</code> is complete.</p>

<p>By default, MacVim maps ^⌘↑ and ^⌘↓ to move around the quickfix list. We can disable that by setting the menu option&rsquo;s key to <code>&lt;nop&gt;</code>. Add this to your <code>.gvimrc</code>:</p>

<script src="https://gist.github.com/afternoon/9022843.js"></script>

<p>If you hit ^⌘↑ or ^⌘↓ with a character-wise visual selection, the whole line will still be moved.</p>

<p>You can map different keys for different platforms.</p>

<p>We can also extend this to fix indentation of the block as you move it:</p>

<script src="https://gist.github.com/afternoon/9022851.js"></script>

<p>This is a bit unpredictable in my experience. YMMV.</p>

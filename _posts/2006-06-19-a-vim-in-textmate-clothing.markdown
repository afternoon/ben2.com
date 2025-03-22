---
layout: post
title: A Vim in TextMate clothing
date: '2006-06-19T17:46:18+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880452667/a-vim-in-textmate-clothing
---
<p>I&rsquo;ve been meaning to write all this stuff up for ages, but millions of everything got in the way. After my TextMate trial period expired, it became obvious that I could do most everything I wanted with Vim and a few more downloaded scripts. The great thing about TextMate is that it&rsquo;s all there for you, no <strike>months</strike> years of hacking to get things just so. The great thing about Vim though (and Emacs I&rsquo;m sure) is that it grows with you.</p>
<h2>OS X key mappings</h2>
<p>The first thing I hacked on Vim, setting up as many Mac key bindings as I could think of. As Vim is a unix app, the Mac command key is completely unbound, a fresh keystroke namespace to frolic in. Bind Mac keys with <code>&lt;D-...&gt;</code>.</p>
<h2>Quote/bracket matching dark evil</h2>
<p>TextMate&rsquo;s bracket and quote matching magic is really nice, takes a few days before you stop typing the matching character, but it makes sense in the long run. To mimic this in Vim I simply mapped the characters to their complete equivalents in insert mode, e.g.</p>
<p class="eg"><code>inoremap &lt;buffer&gt; &lt;silent&gt; " ""&lt;Esc&gt;i</code></p>
<p>Now this is pretty brute force. It doesn&rsquo;t support TextMate&rsquo;s nice addition of quoting/bracketing selected text. Select text in TextMate and type &rsquo;(&rsquo; and you&rsquo;ll get the selected text wrapper with brackets correctly. You can map the same in Vim, but &ldquo; has a special meaning (select register). I chose to create alternate versions prefixed with _, e.g.</p>
<p class="eg"><code>vnoremap &lt;buffer&gt; &lt;silent&gt; _" c""&lt;Esc&gt;hgpa</code></p>
<p>Some other people are playing around with similar ideas in <a href="http://www.vim.org/tips/tip.php?tip_id=153">tip #153</a> and <a href="http://www.vim.org/tips/tip.php?tip_id=318">tip #318</a> on the Vim site.</p>
<h2>Snippets and abbreviations</h2>
<p>TextMate&rsquo;s snippets are probably it&rsquo;s most raved about feature. They&rsquo;re useful and easy to user and setup. Vim has some similar ideas with mappings and abbreviations, but nothing quite as powerful. <a href="http://www.vim.org/scripts/script.php?script_id=1318">snippetsEmu</a> is a Vim plugin which attempts to provide similar functionality. It does do the same things but it&rsquo;s not as slick IMHO. Your mileage may vary however. I started using it, but I&rsquo;ve kind of stopped, possibly due to the inaccessibility of the key binding I chose :-).</p>
<h2>Project plugin</h2>
<p>The project tab in TextMate is quite useful but the <a href="http://www.vim.org/scripts/script.php?script_id=69">project plugin</a> by Aric Blumer beats it hands down. It&rsquo;s a wonderfully Vimmish solution to the problem. Highly recommended.</p>
<h2>Ctags</h2>
<p>The quick jump to file functionality is absolutely awesome, certainly the thing I miss by far the most in Vim. Whilst I&rsquo;m pretty sure it would be possible to write something very similar, I haven&rsquo;t had a stab, nor uncovered any plugins as yet (let me know if you find any!). What I have done instead is to make the project plugin a regular part of my setup, and to use Vim&rsquo;s built in support for jumping to related files with the <code>gf</code> command and ctags files. Ctags is excellent, <code>g&lt;click&gt;</code> to go to any token either in your own code or in external references. Double-clicking a file in the project window is slower than staying on the keyboard and using TextMate&rsquo;s quick open, but it&rsquo;s certainly tolerable.</p>
<h2>K mapping and CSS 2.1 ref </h2>
<p>Hit <code>K</code> in normal mode to do a reference lookup on the keyword under the cursor. You can set what kind of lookup by modifying the <code>keywordprg</code> option. I have external programs that do things like invoke Google searches in Safari, often passing parameters like <code>site:docs.python.org</code>. You can also use <code>:help</code> as a valid <code>keywordprg</code> to look stuff up in Vim&rsquo;s help.</p>
<p>This is not just useful for hacking Vim scripts, you can get other content in Vim help format, such as this handy <a href="http://www.vim.org/scripts/script.php?script_id=918">CSS 2.1 reference</a>. I use this a lot. Unfortunately, the basic <code>K</code>/<code>keywordprg</code> approach does not work, as the keywords need to be rewritten before jumping into the help file. I use this mapping on CSS buffers to get around the problem:</p>
<p class="eg"><code>map &lt;buffer&gt; &lt;silent&gt; K :execute "help '" . expand("&lt;cword&gt;:h") . "'"&lt;CR&gt;</code></p>
<h2>Dictionaries</h2>
<p>Vim features a powerful completion system. I find the <a href="http://www.vim.org/scripts/script.php?script_id=182">SuperTab plugin</a> useful to bind this all to the tab key properly. The system itself reads completion words from many locations, the first and often most useful is the set of currently open buffers. However, it&rsquo;s sometimes useful to have a lookup dictionary, such as languages with fairly narrow namespaces such as CSS or HTML. <a href="http://www.vim.org/tips/tip.php?tip_id=91">Tip #91</a> explains how to set up dictionary files and use them with Vim&rsquo;s completion system. It&rsquo;s as straightforward as:</p>
<p class="eg"><code>setlocal dictionary+=~/.vim/dicts/css.txt</code></p>
<p>Where <code>~/.vim/dicts/css.txt</code> is a file full of CSS keywords.</p>
<h2>Vim 7</h2>
<p><a href="http://www.vim.org/download.php">Vim 7</a> has some cool new features which I haven&rsquo;t really got to grips with yet. The most notable is omni-completion, a feature which pretty much invalidates the above tip :-). Omni-completion can use syntax highlighting as a source of keywords, or it can use custom functions. Vim 7 ships with functions for CSS, HTML and many others.</p>
<p>Vim 7 also has built-in spell-checking, with Word-style wiggly red lines, tabs (a la TextMate, Safari, Firefox, etc), browsing through Netrw, syntax highlighting for Django templates built-in and a whole tonne of other stuff which I have no idea how I&rsquo;m going to make use of yet (undo branches anyone?). <a href="http://amix.dk/index.py/permanentLink?id=130">Here are some nice animations of some of the new features</a> (ignore the Vim vs Emacs flame-war!). It&rsquo;s officially released now as well, so <a href="http://www.vim.org/download.php">go get it</a>!</p>

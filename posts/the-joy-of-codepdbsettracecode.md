---
layout: post
title: The joy of pdb.set_trace()
date: '2007-04-25T14:51:37+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880432721/the-joy-of-codepdbsettracecode
---
<p>I&rsquo;ve never been one for debuggers, I&rsquo;m too lazy really and because I&rsquo;ve been a web application developer all these years, debuggers aren&rsquo;t really very often found. I&rsquo;m much happier just slapping a print statement or two into the code. But I may have found a way to use a debugger that suits my (primitive) working style.</p>
<p>First of all, it&rsquo;s worth showing just how easy it is to get started with my debugger, <code>pdb</code>. Add these lines to any stretch of Python.</p>
<p class="eg"><code>import pdb<br/>pdb.set_trace()</code></p>
<p>When the interpreter runs into <code>pdb.set_trace()</code>, it&rsquo;ll drop into the <code>pdb</code> prompt and you can start inspecting the innards of your code. See the <a href="http://docs.python.org/lib/debugger-commands.html"><code>pdb</code> command documentation</a> for everything you can do.</p>
<h2>Use test cases to debug web apps</h2>
<p>A simple trick for making use of the debugger in a web application is to use a test case as the container instead of the web server. In Django&rsquo;s testing framework for example, tests are run inside the standard Python <code>unittest</code> module which works happily with <code>pdb</code>.</p>
<p>You can also set <a href="http://ipython.scipy.org/">IPython</a> to invoke <code>pdb</code> whenever an exception is raised and not caught. Allowing you to debug as you play with your code in a interactive Python session.</p>

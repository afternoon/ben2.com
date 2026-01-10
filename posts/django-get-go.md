---
layout: post
title: Django get-go
date: '2005-12-01T07:18:06+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880472572/django-get-go
---
<p>Tried to start doing some development on Django tonight. Had a bit of a night of it. First I wanted to get mod_python running with Apache on my Powerbook. Decided I wanted to stick to the OS X stock Apache 1.3.33. Getting mod_python 2.7.11 to work with that was a slag. Then I found that Django requires mod_python 3.x! That required Apache 2. So I installed that, which was actually fuggin&rsquo; easy thanks to Fink. Installed mod_python 3.2.5b and managed to produce a stack trace that looked right (no handlers configured yet). Then I spent about an hour trying to force it to reload Python modules per-request. Hint: make sure Apache can write to your Python module dirs.</p>

<p>So then I started about building a bare bones app to test that Django was installed and working. Thinking I knew it all I didn&rsquo;t follow the tutorials much, and kind of did what I remembered. Wrong. Django seems quite sensitive to the way things are done, the way modules are laid out etc. That is fair enough I guess. My only problem is one that&rsquo;s more of a general programming issue, sometimes fundamental problems in an application can be missed until an exception is finally thrown in a weird place, making debugging very tricky. Django needs more early sanity checks that can flag up potential troubles and throw a StupidAdministratorException with a useful message.</p>

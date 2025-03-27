---
layout: post
title: Testing Django apps
date: '2006-02-17T06:15:19+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880459196/testing-django-apps
---
<p>I&rsquo;ve started work on a new, quite large Django project. It will be six weeks until I&rsquo;ve implemented everything in the specification, so I wanted to get in early with some tests.</p>

<p>Building on the code and ideas of <a href="https://simon.bofh.ms/cgi-bin/trac-django-projects.cgi/wiki/DjangoTesting">Hugo</a>, <a href="http://itmaurer.com/blog/?p=2">Ian Maurer</a> and <a href="http://ibofobi.dk/blog/archive/2005/11/08/django-doctest/">Sune Kirkeby</a>, I created a simple Python module that provides:</p>

<ul>
<li>A <code>testenv_setup</code> method that modifies the database settings in the current <code>DJANGO_SETTINGS_MODULE</code> to point to a in-memory <code>sqlite</code> database, installs a specified set of models into that virgin database and changes the <code>MEDIA_ROOT</code> to point to a folder in <code>/tmp/</code>.</li>
<li>A <code>testenv_teardown</code> method which cleans up the temporary <code>MEDIA_ROOT</code>.</li>
<li>A unit test base class (derived from <code>unittest.TestCase</code>) that uses <code>testenv_setup</code> and <code>testenv_teardown</code>.</li>
<li>A new handler, <code>TestHandler</code>, derived from <code>WSGIHandler</code> which allows the user to construct requests to the Django processing framework very easily (e.g. <code>get_response("/my/url/")</code>) and returns the original objects created for the response and allows exceptions to bubble rather than just pushing back the HTML only. This facilitates easy test writing. Of course the HTML is there too, and, like Sune Kirkeby, I push it into a BeautifulSoup object for handy parsing.</li>
</ul>
<p>The result is a simple module that can be used to create either <a href="http://docs.python.org/lib/module-doctest.html">doctests</a> and unit tests that test both models and views. I prefer doctests, because they just seem more pythonic to me. Unit tests are great, but there&rsquo;s a weighty Javaness to them, they&rsquo;re more clunky to write, which is critical. Doctests are also a better fit for Django&rsquo;s model magic. Because of the DB settings monkey-patching, unit tests must import the models after <code>setUp</code>, within each test function. This just adds tonnes of lines of cruft. With doctests, I just have a block of imports at the top of each test docstring.</p>

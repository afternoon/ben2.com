---
layout: post
title: Doctests vs unit tests
date: '2006-02-24T05:11:48+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880458701/doctests-vs-unit-tests
---
<p>OK, I might have to eat my words here. Doctests are quite cool as small dabs here and there, but the module doesn&rsquo;t have the flexibility of unit tests. It&rsquo;s much harder to chunk the tests and refer to them individually. This is hugely exacerbated by the whole Django model magic madness. Hopefully most of the gymnastics I&rsquo;m doing in testing at the moment will become redundant when magic-removal hits the shelves. In the mean time I&rsquo;m considering moving all my tests back to units, which will be a pain because of the whole <code>from django.models...</code> boilerplate that&rsquo;s required everywhere.</p>
<p>Also, having the tests in with code is quite cool in some ways, but it does make getting around the files tricky when the blocks get large. So much for literate programming.</p>

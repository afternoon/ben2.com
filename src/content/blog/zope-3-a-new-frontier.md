---
layout: post
title: 'Zope 3: A new frontier'
date: '2005-04-11T08:44:07+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880490520/zope-3-a-new-frontier
---
<p><em>Excuse the poor grammar and structure, I&rsquo;m exhausted as I write this.</em></p>
<p>I&rsquo;ve spent the weekend reading about <a href="http://www.zope.org/Wikis/DevSite/Projects/ComponentArchitecture/FrontPage">Zope 3</a> and playing around with it a bit. There&rsquo;s lots of things I&rsquo;d like to get down but not knowing Z2/Plone/etc I&rsquo;m not sure that sending this to <a href="http://mail.zope.org/pipermail/zope3-dev/">zope3-dev</a> is something I should do just yet.</p>
<p>Anyway, to summarise, Zope 3 is really a replacement for Zope 2 and CMF, it seems, though not the out-of-the-box products like Plone or CPS. It provides the separation of concerns that made CMF useful. The underlying code is very clean, almost too clean (it&rsquo;s almost Java :-). Basically it&rsquo;s a very high quality implementation of a lot of really useful software development layers.</p>
<p>Interestingly, some of the sentences from the <a href="http://www.zope.org/DevHome/Wikis/DevSite/Projects/ComponentArchitecture/FrontPage/Zope3Book">Zope 3 Book</a> could have been lifted straight from the <a href="http://www.cohack.com/manual/">InfoCMS manual</a> stuff I wrote :-). They&rsquo;ve got the whole define a form schema and generate as much as possible bit going on and writing content plug-ins is at least as simple as with InfoCMS, and has access to that much more power.</p>
<p>The problem is that they haven&rsquo;t really got into the portal/portlets stuff yet. It&rsquo;s possible that they&rsquo;re willfully avoiding it for now, but this does make the thing much less useful for my purposes. My plan is to spend sometime later this week or next weekend looking into Plone and Archetypes and stuff, but until then I thought I&rsquo;d just write down what I think a portal system needs to do.</p>
<ol><li>Allow portal page objects to be created in the ZMI</li>
<li>Allow portlet objects to be created under portal pages, the portal page will then assemble content from its children</li>
<li>Users and admins should be able to add, remove and re-order portlets with their instances of portal pages, no disk-based code or XML should be required for this process.</li>
<li>Allow some &ldquo;global&rdquo; content to be accessed by portlets, for example a calendar like Plone&rsquo;s</li>
<li>Do all this in a way that freely allows content types from currently existing Z3 products, such as zwiki or zblog, to be used as portlets</li></ol>
<p>#3 is really the essence of the thing. With 3 in place a relatively skilled user-but-non-developer (I&rsquo;m thinking my colleague JC here) can log into the ZMI and build a site by assembling a page with a ZPT portlet and blog portlet here, adding a wiki here and writing some basic ZPT pages, e.g. a contact page. He can then hand that site to me, probably by zsyncing it to disk, and I can theme it by <a href="http://www.zope.org/Wikis/DevSite/Projects/ComponentArchitecture/Zope3Book/skin.html">making a skin</a>.</p>
<p>I could write this portal support code myself, but it would be a small-fry approach and wouldn&rsquo;t have any of this workflow/metadata/cool stuff magic that (it sounds like) makes Plone so grrreat.</p>
<p>So, more reading required really. I might have to get in touch with Nuxeo, the guys behind CPS, who seem to be <a href="http://www.cps-project.org/sections/news/zope3_development_at">getting into Zope 3</a> and see what their roadmap looks like. This isn&rsquo;t really <a href="http://www.cohack.com/">Cohack</a>&rsquo;s major focus though, so to some extent I have to wait this one out.</p>
<p>I will definitely be investigating Plone next though. It&rsquo;s going to be a bit of a shock having spent so much time looking at lovely lovely Z3 code, but I&rsquo;m hoping that the upper levels of Plone will be a) almost as nice and b) all I really need to play with.</p>

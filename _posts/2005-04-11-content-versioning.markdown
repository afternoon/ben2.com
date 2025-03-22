---
layout: post
title: Content versioning
date: '2005-04-11T17:47:03+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880489955/content-versioning
---
<p>Everything in a CMS should be versioned. Zope 3 has undo, but that&rsquo;s not object-specific, it&rsquo;s system-wide, so if you make a fatal change and then do ten or so things to another object, you&rsquo;ve lost your undo for your fatal change.</p>
<p>Everything: content object, images, stylesheets and especially products (or modules, InfoCMS&rsquo;s equivalent) should be version managed. The user should be able to just select from the last X versions and branch from there, without destroying newer versions.</p>
<p>Zope 3 does have a versioning package, <a href="http://www.google.co.uk/search?hl=en&amp;btnG=Search&amp;q=zope3%20versioning">apparently</a> but it&rsquo;s unclear what the scope of the facilities is. CPS apparently implements it on Zope 2. InfoCMS used to version page object content, but I honestly can&rsquo;t remember if I kept that feature when I reimplemented it all with page objects.</p>
<p><em>Edit: <a href="http://www.zope.org/Members/vbachs/VersionUI/Z3Versioning">Zope 3 version control</a> is definitely happening in the right way. People have the same ideas as me and while <a href="http://svn.zope.org/Zope3/trunk/src/zope/app/versioncontrol/README.txt?rev=29143&amp;view=markup">the code</a> looks to be in it&rsquo;s early stages, it seems to implement much of the required functionality. The critical thing is: will implementors make use of it for their products?</em></p>

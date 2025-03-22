---
layout: post
title: Moving my blog to Django
date: '2008-06-04T03:40:58+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880426191/moving-my-blog-to-django
---
<p>I&rsquo;ve been meaning to move my blog to Django for about 2 years. I&rsquo;ve got 
plenty of UI mockups, I just haven&rsquo;t got around to coding anything. I decided 
instead to look at some of the pre-existing Django blog applications. It turns 
out there are at least a few that are quite complete.</p>

<h2>Candidates</h2>

<p>Django has been open source for over 2 years now, but it&rsquo;s way behind 
something like Rails or PHP when it comes to packaged software. If I want a PHP 
blog, Wordpress is simply a great choice and there are many, many others. By 
stipulating Django, I&rsquo;m narrowing the field quite severely. This may be because 
it looks trivially easy to build a blog in Django, and most people just roll 
their own.</p>

<p>After doing a bit of searching I unearthed these great projects.</p>

<ul>
  <li>
    <a href="https://launchpad.net/banjo">Banjo</a><br/>
    A project that aims high: plugins, XML-RPC editing, importers, I&rsquo;m just not 
    sure how much of the functionality is stable.
  </li>
  <li>
    <a href="http://code.google.com/p/blogmaker/">BlogMaker</a><br/>
    A pretty complete app, sadly supports Django 0.96 
    only (see Trespams).
  </li>
  <li>
    <a href="http://byteflow.su/">ByteFlow</a><br/>
    Perhaps the most complete and active Django blog project (thank you to Simon Willison for pointing me to it).
  </li>
  <li>
    <a href="http://code.google.com/p/coltrane-blog/">Coltrane</a><br/>
    <a href="http://www.b-list.org/">James Bennett</a>&rsquo;s blog tool, building on 
    his <a href="http://code.google.com/p/django-comment-utils/">django-comment-utils</a> 
    and <a href="http://code.google.com/p/django-template-utils/">django-template-utils</a> 
    projects.</li>
  <li>
    <a href="http://code.google.com/p/django-basic-apps/">Django Basic Apps</a> 
    blog<br/>
    Part of a larger suite of tools, this blog app isn&rsquo;t as basic as it&rsquo;s name 
    makes out.
  </li>
  <li>
    <a href="http://code.djangoproject.com/browser/djangoproject.com/django_website/apps/blog">Django 
      Project site blog code</a><br/>
    The original Django blog app and surely a starting point for many personal 
    sites.
  </li>
  <li>
    <a href="http://code.google.com/p/django-diario/">Diário</a><br/>
    A more internationalised take on the Django blog app.
  </li>
  <li>
    <a href="http://code.google.com/p/geeksite/">Geeksite</a><br/>
    A whole geek site app featuring blog, CV (resumé) and project list.
  </li>
  <li>
    <a href="http://code.google.com/p/trespams/">Trespams</a><br/>
    A fork of BlogMaker which targets Django SVN but also attempts to be more 
    like WordPress.
  </li>
</ul>

<h2>Some notes on software re-use</h2>

<p>There is a low barrier to entry for starting a Django application. It&rsquo;s very 
easy to create some models and check them in to Google Code. Creating a rounded 
reusable product takes much more. I had previously been sceptical about the 
completeness of the code on offer.</p>

<p>I have been reading Robert Glass&rsquo;s excellent <cite><a href="http://books.google.co.uk/books?id=3Ntz-UJzZN0C&amp;pg=PP1&amp;ots=zeMDSNjWtx&amp;sig=ZQvApji16a9hNykZ_mkbq8LIrtY&amp;hl=en&amp;prev=http://www.google.co.uk/search%3Fhl%3Den%26btnG%3DSearch%26q%3Dfacts%2Band%2Bfallacies%2Bof%2Bsoftware%2Bengineering&amp;sa=X&amp;oi=print&amp;ct=title&amp;cad=one-book-with-thumbnail">Facts 
    and Fallacies of Software Engineering</a></cite>. He cites several studies 
which show that if 25% or more of a piece of software is not appropriate to your 
needs, then it is more cost-effective (in terms of time in my case) to start 
from scratch. If I modify one of the above apps, I become responsible for 
merging downstream bug fixes and maintaining my forked version. It would also be 
possible to take code from many apps to create the &ldquo;perfect&rdquo; blog tool, but I 
wouldn&rsquo;t have access to improvements made by other people. It therefore is 
important to select a application that is a very good match for my needs off the 
peg. See Fact 19 in <cite>Facts and Fallacies of Software Engineering</cite> for 
a longer discussion of these issues.</p>

<p>There are certainly many more Django blog apps out there. I did not conduct 
an exhaustive search. These apps have been linked to from either the <a href="http://code.djangoproject.com/wiki/DjangoResources">Django Resources</a> 
page or I have seen them mentioned in previous reading. That a blog app came to 
my attention without much effort suggests a certain level of activity and so 
provides a valid filter for less advanced projects.</p>

<h2>My requirements</h2>

<p>The features I require:</p>

<ol>
  <li>Write entries in Textile.</li>
  <li>Use the admin to write and edit posts.</li>
  <li>Pretty urls e.g. /2008/jun/01/moving-my-blog-to-django/.</li>
  <li>RSS feeds for posts, tags, ideally comments.</li>
  <li>Tags with tag cloud and items-with-tag views.</li>
  <li>Categories. I blog about hacking, cycling, business/startups, personal 
  stuff and more. These posts have separate audiences.</li>
  <li>Comments with moderation.</li>
  <li>Write-edit-publish workflow to allow incremental authoring of posts.</li>
</ol>

<p>Some nice to have features:</p>

<ol start="9">
  <li>Search (required, but trivially easy to build).</li>
  <li>Open ID authentication for commenting <a href="http://simonwillison.net/2007/Jan/22/whitelisting/">like Simon 
    Willison has</a>.</li>
  <li>Highlight source code snippets (this can be done in JS, e.g. <a href="http://shjs.sourceforge.net/">SHJS</a>).</li>
  <li>Ping <a href="http://pingomatic.com">Pingomatic</a> on post.</li>
  <li>Sitemap generation.</li>
</ol>

<p>I think lifestream applications like <a href="http://friendfeed.com">FriendFeed</a> and tumble logs are very cool and 
I would really like my own one. Moving the blog to Django is the first step in 
building my own lifestream site. It gives me the foundation to build code 
on.</p>

<h2>Django blog apps compared</h2>

<p>Features 1-5 are found in every application considered here or can be added 
without modification to the core application, so I will omit them from the 
comparison matrix.</p>

<table border="1">
 <tr>
  <th> </th>
  <th>Categories</th>
  <th>Comment mod</th>
  <th>Workflow</th>
  <th>Tag pages</th>
  <th>Search</th>
  <th>OpenID</th>
  <th>Highlighting</th>
  <th>Ping</th>
  <th>Sitemap</th>
  <th>Active project</th>
 </tr>
 <tr>
  <td>Banjo</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>Y</td>
  <td>N</td>
  <td>Updated Nov 2007</td>
 </tr>
 <tr>
  <td>BlogMaker</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>N</td>
  <td>Y</td>
  <td>N</td>
  <td>Y</td>
 </tr>
 <tr>
  <td>ByteFlow</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
 </tr>
 <tr>
  <td>Coltrane</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>Basic maintenance</td>
 </tr>
 <tr>
  <td>Django Basic Apps blog</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
 </tr>
 <tr>
  <td>Django Project blog</td>
  <td>N</td>
  <td>Y</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>Basic maintenance</td>
 </tr>
 <tr>
  <td>Dirio</td>
  <td>N</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
 </tr>
 <tr>
  <td>Geeksite</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>N</td>
  <td>Y</td>
  <td>Updated Jan 2007</td>
 </tr>
 <tr>
  <td>Trespams</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>Y</td>
  <td>Y</td>
  <td>N</td>
  <td>Updated Dec 2007</td>
 </tr>
</table>

<h2>Conclusion</h2>

<p>Although my feature matrix is skewed to my needs, it shows that the state of 
off-the-shelf Django blogging applications is improving. We certainly don&rsquo;t have 
a WordPress or a Moveable Type yet but hopefully these applications will gain 
more attention leading to more feature contributions.</p>

<p>The matrix doesn&rsquo;t really capture the different levels of work that have gone 
into the projects. I spent a bit of time looking at source code and their is a 
fair amount of variation. Diário and BlogMaker in particular are clearly 
more advanced than the average blog app. The Django Basic Apps project blog and 
Coltrane also appear fairly complete.</p>

<p>A big plus for many of these applications is how they integrate with other 
open source Django code available. <a href="http://code.google.com/p/django-tagging/">django-tagging</a> and <a href="http://code.google.com/p/django-comment-utils/">django-comment-utils</a> 
are almost ubiquitously used. An honourable mentioned has to go to <a href="http://pinax.hotcluboffrance.com/">Pinax/Hotclub</a>, a really 
interesting project to create an integrated suite of applications that can be 
used to build a site on Django. There&rsquo;s lots of code there, but a blog app is 
currently conspicuous by it&rsquo;s absence! Any of the above applications would be an 
excellent choice for inclusion.</p>

<p>So which tool will I use to power my blog? I&rsquo;m going to install ByteFlow locally and have a good play with it. If it is not a good fit or there are show-stopping issues, I may also install Trespams, the Django Basic Apps blog and possibly Diário or Coltrane.</p>

<p><strong>Edited Jun 4, 10:30</strong>: Added ByteFlow (thanks Simon!)</p>

---
layout: post
title: Reading "Architectural Styles and the Design of Network-based Software Architectures"
date: '2009-02-04T09:31:27+00:00'
tags:
- rest
- http
tumblr_url: https://aftnn.org/post/47880416454/reading-architectural-styles-and-the-design-of-network-b
---
<blockquote>
  <p>REST provides a set of architectural constraints that, when applied as a whole, emphasizes scalability of component interactions, generality of interfaces, independent deployment of components, and intermediary components to reduce interaction latency, enforce security, and encapsulate legacy systems.</p>
</blockquote>

<p>Roy Fielding&rsquo;s doctoral dissertation surveys architectural styles for building networked hypermedia systems and introduces the REST architectural style. Fielding was one of the original architects of the web and his dissertation attempts to describe &ldquo;the model for how the modern Web should work&rdquo;.</p>

<p>Designing web applications is a complex task. Each application has a number of requirements and there is a huge range of possible approaches and toolkits available to help software engineers meet those requirements.</p>

<p>Fielding surveys architectural styles, a very high level of abstraction describing the bits of a running networked system and how they fit together. He then describes REST, a style designed to maximise the required properties of a networked hypermedia system (i.e. a world-wide web). It&rsquo;s almost like a memoir of the construction of the web, an explanation of rationale.</p>

<p>The REST style is incredibly elegant. It simplifies so much that it almost seems invisible.</p>

<ul>
<li>Resources are named by urls.</li>
<li>The big 4 HTTP methods <code>GET</code>, <code>POST</code>, <code>PUT</code> and <code>DELETE</code> are the only operations used on resources.</li>
<li>Systems are built as clients, servers and connectors (proxies, caches, etc) speaking a common protocol, HTTP.</li>
</ul>

<p>The properties introduced by these constraints are:</p>

<ul>
<li>Performance, both absolute and user-perceived.</li>
<li>Scalability.</li>
<li>Simplicity.</li>
<li>Modifiability.</li>
<li>Visibility.</li>
<li>Portability.</li>
<li>Reliability.</li>
</ul>

<p>These are obviously very nice properties for a system to have. Visibility is especially interesting and subtle. Use of the HTTP protocol&rsquo;s simple verbs and request and response structures allows the effect of individual requests to be well-understood and verifiable and intermediate tools (such as caches, proxies or transforming middleware) to be constructed easily.</p>

<h2>Writing to your reading list</h2>

<p>If you are developing web applications, I recommend Fielding&rsquo;s dissertation as a summary of styles and as a description of the REST style.</p>

<blockquote>
  <p><a href="http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm">Architectural Styles and the Design of Network-based Software Architectures</a></p>
</blockquote>

<p>I also found the <a href="http://en.wikipedia.org/wiki/Representational_State_Transfer">Wikipedia entry on REST</a> very useful, particularly the grid of HTTP methods and their effects on various types of resource.</p>

<p>Stefan Tilkov has a nice article which lists some <a href="http://www.infoq.com/articles/rest-anti-patterns">REST anti-patterns</a>. It defines REST by subtracting what is not REST. An informative approach.</p>

<p>Finally, you may also be interested in Fielding&rsquo;s presentation at Railsconf Europe last year, entitled &ldquo;<a href="http://conferences.oreillynet.com/presentations/railsconfeurope07/re7_royfielding.pdf">The rest of REST</a>.&rdquo;</p>

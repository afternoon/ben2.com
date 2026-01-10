---
layout: post
title: Client-side MVC is maturing
date: '2009-03-18T01:52:27+00:00'
tags:
- javascript
- mvc
- ria
tumblr_url: https://aftnn.org/post/47880414427/client-side-mvc-maturing
---
<p>Rich Internet Applications (RIAs) are still increasing in popularity. We&rsquo;ve reached the stage where they aren&rsquo;t called RIAs any more, they&rsquo;re just cool websites. (Ever heard someone call Facebook an RIA?) There is a increasing demand for tools to build great UIs easily and to build JavaScript-only applications for platforms such as OpenSocial. There are a range of toolkits for building RIAs but most of them are tied to a specific server platform.</p>

<p>A framework takes care of repetitive tasks. In an RIA, these include building screens, including providing rich controls, validation etc. The framework should also provide an abstraction for maintaining state and requesting data from web services via XHR. While building an OpenSocial application in December, I could have saved a lot of time developing on top of such a framework.</p>

<p>MVC is the dominant model for UI development in the desktop world. A modified form is very popular in web development. It makes a lot of sense to stick to MVC for RIA development. RIAs running in the browser (or Flash or AIR) bear close resemblance to desktop applications.</p>

<p>Of the server-and-client toolkits, <a href="http://code.google.com/webtoolkit/">Google Web Toolkit</a> is perhaps the best known. You write Java code and it compiles it to a web application complete with HTML, JavaScript and CSS. This is an interesting idea, but the server-side component is not interchangeable and requires Java. It also leaves virtually no visibility in the compiled code.</p>

<p>Wouldn&rsquo;t it be great if there were a client-side only JavaScript framework which allowed you to build nice UIs quickly and easily and load data from any server back-end? Given the variety of technologies for server-side web app code, you think this would be an active area. Doesn&rsquo;t it slightly suck that you have an interesting web toolkit in GWT and a cool cloud hosting platform in App Engine, both from the same company, but you can&rsquo;t use them together?</p>

<p>I was pleased to see that the cunningly-named <a href="http://javascriptmvc.com/">JavaScriptMVC</a> framework got it&rsquo;s <a href="http://javascriptmvc.com/wiki/index.php?title=1.5">version 1.5 release</a>. This version adds some new development tools and documentation, but it&rsquo;s still back-end independent. On the other hand it does look a little heavyweight.</p>

<p>Topper Bowers just open-sourced his <a href="http://blog.toppingdesign.com/2009/03/15/mamoo-released-as-open-source/">Mamoo</a> framework. Although Mamoo doesn&rsquo;t seem to be a run-of-the-mill RIA platform, it does provide some of the MVC goodness that those applications need.</p>

<p>I look forward to checking out both of these projects in more depth. Certainly JavaScript-only MVC frameworks are needed if smaller development operations are to produce applications with the level of quality and UI finesse seen in, for example, Facebook or GMail.</p>

---
layout: post
title: Mock To Mobile In Minutes With Codiqa, Trigger.io And TestFlight
date: '2013-03-27T13:06:26+00:00'
tags:
- mobile
- html
- codiqa
- trigger.io
tumblr_url: https://aftnn.org/post/47880395558/mocking-mobile-apps-codiqa-and-triggerio
---
<p>I&rsquo;m a fan of HTML for building mobile apps. Its incredibly quick and easy to build simple apps. I already know HTML, CSS and JavaScript. Lots of other developers do too, so it&rsquo;s easier to find people to work with than native platforms.</p>

<p>When I recently started working on a mobile project, I used <a href="http://codiqa.com/">Codiqa</a> to build a mockup of the app interface and generate HTML and <a href="http://trigger.io">Trigger.io</a> and <a href="https://testflightapp.com/">TestFlight</a> to turn that mock into an app running on my iPhone.</p>

<h2>Get Creative With Your Mock</h2>

<p><a href="http://codiqa.com/">Codiqa</a> makes it easy to create app mocks.</p>

<ol>
<li>Sign up for <a href="https://codiqa.com/signup/plans/2013basic-monthly">Codiqa basic account</a> so you can build more than 3 pages and export your mock as HTML</li>
<li>Build an awesome mock by dragging and dropping</li>
<li>Optional: customise your app by creating a theme with <a href="http://jquerymobile.com/themeroller/index.php">jQuery Mobile Themeroller</a> and <a href="https://codiqa.com/dash/themes">uploading it to Codiqa</a></li>
<li>Download your mock as HTML and unzip</li>
</ol>

<h2>From Mock To Mobile In Minutes</h2>

<p>Next, I used <a href="http://trigger.io">Trigger.io</a> to create an app from the mock HTML and <a href="https://testflightapp.com/">TestFlight</a> to release it to my phone.</p>

<ol>
<li>Install <a href="https://trigger.io/forge/toolkit/">Trigger.io&rsquo;s tools</a></li>
<li>Create a directory for your new app</li>
<li>Run <code>forge create</code> (See <a href="http://">Trigger.io&rsquo;s OS-specific instructions</a> for more detail)</li>
<li>Replace the contents of the <code>src</code> dir Download HTML from Codiqa to the <code>src</code> dir of your new app</li>
<li>Rename <code>app.html</code> to <code>index.html</code> so that Trigger knows it&rsquo;s your start page</li>
<li><a href="http://docs.trigger.io/en/v1.4/best_practice/release_mobile.html#ios">Change your app&rsquo;s config to include your package name and point to your provisioning profile</a> (there&rsquo;s an <a href="https://gist.github.com/afternoon/5254489#file-local_config-json">example <code>local_config.json</code> here</a>)</li>
<li>Run <code>forge build ios</code> to compile the app</li>
<li>Run <code>forge package ios</code> to generate an IPA package file for iPhones</li>
</ol>

<h2>Distribute Your Mock App</h2>

<p>Once you&rsquo;ve followed these steps, you can upload your build to TestFlight and push it out to your testers.</p>

<p>To deploy apps to iPhones, you will need an Apple developer account and a provisioning profile.
TestFlight have a good resource on <a href="http://help.testflightapp.com/customer/portal/articles/829857-how-do-i-prepare-a-build-for-distribution-through-testflight-">preparing a build for distribution through TestFlight</a>. Also, Handshake have a good overview of <a href="http://www.handshake20.com/2011/07/testing-ios-apps-with-testflight.html">Testing iOS Apps with TestFlight</a>.</p>

<p>Apple&rsquo;s document <a href="https://developer.apple.com/library/ios/#documentation/ToolsLanguages/Conceptual/DevPortalGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011159">About iOS Development Team Administration</a> provides a wealth of info on the iOS development workflow.</p>

---
layout: post
title: Nginx+Django+FastCGI
date: '2009-01-23T14:03:54+00:00'
tags:
- nginx
- django
- fastcgi
tumblr_url: https://aftnn.org/post/47880417429/nginx-django-fastcgi
---
<p>A lot of people seem to have posts like this, but there were some  things that I got stuck on when moving to Nginx from Apache.</p>

<h2><code>location ^~</code></h2>

<p>The <code>^~</code> match can not be used with regular expressions.</p>

<p>This will not work as expected:</p>

<pre><code>location ^~ /(foo|bar)/ {
    ...
}
</code></pre>

<p>Use the ~ match operator if you want to use an RE. Make sure that your RE matches don&rsquo;t clash with you plain string matches. The latter will be preferred in this event.</p>

<h2><code>location + root</code></h2>

<p>If you want to specify a different <code>root</code> within a <code>location</code> block, be mindful that the uri is unchanged.</p>

<p>For example, if you want to publish Django&rsquo;s admin media, you might write something like this:</p>

<pre><code>location ^~ /admin/media/ {
    root /usr/local/django/django/contrib/admin/media;
}
</code></pre>

<p>When a request comes in, Nginx will concatenate the root and the uri to find the file to server. With this config, it will try to serve <code>/usr/local/django/django/contrib/admin/media/admin/media/css/base.css</code>.</p>

<h2><code>SCRIPT_NAME and PATH_INFO</code></h2>

<p>Django uses <code>PATH_INFO</code> to match against <code>urlpatterns</code>. Nginx&rsquo;s <code>fastcgi_params</code> include doesn&rsquo;t set that. It does set <code>SCRIPT_NAME</code>. If both <code>PATH_INFO</code> and <code>SCRIPT_NAME</code> are set to <code>$fastcgi_script_name</code>, Django seems to get an empty path for all requests. Just set <code>PATH_INFO</code>!</p>

<h2>Request buffering to file</h2>

<p>Nginx buffers large requests to file before passing them to an upstream server. There is no option to stop this from happening. If you want to track the progress of request uploads, you will need to use the <a href="http://wiki.codemongers.com/NginxHttpUploadProgressModule">Upload Progress Module</a>.</p>

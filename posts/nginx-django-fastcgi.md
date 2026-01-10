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
A lot of people seem to have posts like this, but there were some  things that I got stuck on when moving to Nginx from Apache.

## `location ^~`

The `^~` match can not be used with regular expressions.

This will not work as expected:

```nginx
location ^~ /(foo|bar)/ {
    ...
}
```

Use the `~` match operator if you want to use an RE. Make sure that your RE matches don't clash with you plain string matches. The latter will be preferred in this event.

## `location + root`

If you want to specify a different `root` within a `location` block, be mindful that the uri is unchanged.

For example, if you want to publish Django&rsquo;s admin media, you might write something like this:

```nginx
location ^~ /admin/media/ {
    root /usr/local/django/django/contrib/admin/media;
}
```

When a request comes in, Nginx will concatenate the root and the uri to find the file to server. With this config, it will try to serve `/usr/local/django/django/contrib/admin/media/admin/media/css/base.css`.

## `SCRIPT_NAME and PATH_INFO`

Django uses `PATH_INFO` to match against `urlpatterns`. Nginx&rsquo;s `fastcgi_params` include doesn&rsquo;t set that. It does set `SCRIPT_NAME`. If both `PATH_INFO` and `SCRIPT_NAME` are set to `$fastcgi_script_name`, Django seems to get an empty path for all requests. Just set `PATH_INFO`!

## Request buffering to file

Nginx buffers large requests to file before passing them to an upstream server. There is no option to stop this from happening. If you want to track the progress of request uploads, you will need to use the <a href="http://wiki.codemongers.com/NginxHttpUploadProgressModule">Upload Progress Module</a>.

---
layout: post
title: Use SSH public key authentication with Fabric
date: '2009-04-24T15:13:12+01:00'
tags:
- fabric
- ssh
tumblr_url: https://aftnn.org/post/47880413289/use-ssh-public-key-authentication-fabric
---
<p><a href="http://www.nongnu.org/fab/">Fabric</a> is a very useful Python tool for scripting administration of remote servers. Like <a href="http://www.capify.org/">Capistrano</a> it allows you to define tasks as a mixture of local and remote operations and then run them for lots of hosts, different groups of hosts, etc.</p>

<p>Increasingly I&rsquo;m using configuring <code>sshd</code> to allow public key authentication only. Using this method makes your server more secure against increasingly common SSH brute force attacks. You can also configure an <code>ssh-agent</code> app to allow password-less logins.</p>

<p>If you want your Fabric tasks to access machines using public key authentication, add something like to your Fabfile:</p>

<pre><code class="python">from paramiko import RSAKey

config.fab_user = "jhacker"
config.fab_pkey = RSAKey.from_private_key_file("/path/to/keyfile")</code></pre>

<p>Simple, and very useful.</p>

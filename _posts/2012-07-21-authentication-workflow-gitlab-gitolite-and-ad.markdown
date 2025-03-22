---
layout: post
title: Authentication workflow for gitlab, gitolite and AD
date: '2012-07-21T00:39:20+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880399455/authentication-workflow-gitlab-gitolite-and-ad
---
<p><a href="http://gitlabhq.com">gitlab</a> and <a href="http://sitaramc.github.com/gitolite/">gitolite</a> can be integrated with Active Directory (or another LDAP server), but how it works is a bit roundabout.</p>

<ul>
<li>User logs in to gitlab web interface</li>
<li>gitlab checks user&rsquo;s credentials against Active Directory (<a href="https://github.com/gitlabhq/gitlabhq/wiki/Setting-up-ldap-auth">via ominauth plugin</a>) and allows log in</li>
<li>User uploads SSH key via gitlab web interface</li>
<li>gitlab writes key to gitolite keys dir?</li>
<li>User attempts to access repo via SSH (e.g. <code>git clone git@host:repo.git</code>)</li>
<li>SSH key is sent</li>
<li>gitolite checks keys dir and finds key</li>
<li>gitolite checks repository permissions and decides to allow the operation

<ul>
<li>This could be because user is a member of an AD group which has been assigned perms in <code>gitolite.conf</code></li>
<li><a href="https://gist.github.com/1710266">Script to pull group info from AD</a></li>
</ul></li>
<li>repo is cloned</li>
</ul>

<p>Simples!</p>

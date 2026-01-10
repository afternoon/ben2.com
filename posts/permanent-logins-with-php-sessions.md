---
layout: post
title: Permanent logins with PHP sessions
date: '2004-05-03T19:09:16+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880521099/permanent-logins-with-php-sessions
---
<p><strong>Disclaimer</strong>: I think this works, but it&rsquo;s only endured light testing so far. I may be wrong. Please let me know if you think I am.</p>
<p>PHP sessions are a great addition to the application programming environment. The first time I used cookies I used PHP&rsquo;s <code>setcookie()</code> function to roll my own system, which can only be described as flaky. Browsers seem to have an overwhelming disdain for cookies in general, each one requiring a complex set of chicken dances to work. PHP sessions may or may not do lots of clever stuff under the hood to address these problems, but they have always worked 100% reliably for me and that confidence has been enough for me to deploy and forget the technology, something which is critical if we are to get on with the business of developing actual software and not constantly writing our own libraries.</p>
<p>But eventually the time came when I wanted to have the option for people to be logged in permanently (or at least for a very long time, let&rsquo;s say 90 days). Finding a solution to this problem took me a little while, so I thought I&rsquo;d write it up. I got quite a lot of help from <a href="http://www.experts-exchange.com/Web/Web_Languages/PHP/Q_20890175.html">this discussion at the Experts Exchange</a> and obviously the <a href="http://www.php.net/manual/en/ref.session.php">sessions section of the PHP manual</a>.</p>
<p>First piece of knowledge: PHP garbage collects session files when their modified time reaches a predefined timeout, the default being 1440 seconds - about 24 minutes. PHP has a series of INI file settings that govern the sessions system. These allow you, amongst other things, to control this garbage collection, by either raising the timeout, or reducing the probability of collection after that timeout has expired. For my purposes, I wanted the session files to remain intact on disk for up to 90 days (7776000 seconds). The php.ini key for garbage collection is <code>session.gc_maxlifetime</code>. If you have control over your php.ini file, simply locate and alter that value. If you don&rsquo;t, you can change these options via a .htaccess file (see below). It&rsquo;s not enough to change these options using the <code>ini_set</code> function as the value needs to be maintained for all instances of PHP that are working in the session dir.</p>
<p>According to one expert at the Experts Exchange, changing your <code>session.gc_maxlifetime</code> will cause problems when PHP instances running other scripts (e.g. belonging to others on a shared server). This can be fixed by moving the session save path to a different location. This can be acheived with <code>session.save_path</code> parameter.</p>
<p>Presumably, if you set your <code>session.gc_maxlifetime</code> and then move your session path with <code>ini_set()</code>, your sessions will be untouched by other PHP instances, meaning you can use just <code>ini_set</code> to do the initial lifetime change. I haven&rsquo;t tested this however.</p>
<p>I also decided to specify that my sessions should use cookies only. I set both <code>session.use_cookies</code> and <code>session.use_only_cookies</code> to &ldquo;on&rdquo; and <code>session.use_trans_sid</code> to &ldquo;off&rdquo;.</p>
<p>As I don&rsquo;t have access to the php.ini on my production server, I put the following block into the .htaccess for my application:</p>
<p class="eg"><code>
&lt;IfModule mod_php4.c&gt;<br/>
    php_value session.gc_maxlifetime "7776000"<br/>
    php_value session.save_path "sessions"<br/>
    php_value session.use_cookies "on"<br/>
    php_value session.use_only_cookies "on"<br/>
    php_value session.use_trans_sid "off"<br/>
&lt;/IfModule&gt;
</code></p>
<p>OK, so now a user&rsquo;s session will be waiting on the server for them to come back, we have to ensure that the other half of the equation - the browser cookie - will wait just as long.</p>
<p>Second piece of knowledge: <code>session_start()</code> always sends a Set-Cookie header with the default path and no expiry time. No expiry time means that the cookie will be removed when the browser is closed. If <code>session_start()</code> sends a cookie with an expiry we don&rsquo;t want, don&rsquo;t we have something of a chicken egg situation? We need to run <code>session_start()</code> before we can access our session data, but to make the cookie optionally permanent you have to store that somebody wants a permanent cookie somewhere: the session. There are other options, but they are less then ideal. For example you could store the option in a database, but what if the user wants to be permanently logged in on their home machine, but not when they visit your site from a net café?</p>
<p>The solution is to stop and then restart the session with the new timeout parameter. The algorithm looks like this:</p>
<ol>
<li>Call <code>session_start()</code>, this sends a duff cookie, but it does give us access to <code>$_SESSION</code></li>
<li>Look in the session for the permanent flag, and copy it</li>
<li>If the user wants a permanent login:
<ol>
<li>Run <code>session_write_close()</code>, this commits the session to file and closes it</li>
<li>Use <code>session_set_cookie_params()</code> with just one argument to set the cookie timeout, 7776000 seconds in our case.</li>
<li>Run <code>session_start</code> again, this time it sends a good cookie</li>
</ol>
</li>
</ol>
<p>All you need to do when the user logs in is create the permanent flag in the session if they want it.</p>
<p>This solution has been tested and works on Mozilla, IE5/Mac, Safari, IE6/PC and IE5/PC.</p>
<p>Because two Set-Cookie headers are sent with each response, it&rsquo;s conceivable, even likely, that some browser somewhere will get confused and set the expiry time wrong. In this case it should be possible to do the work of the original <code>session_start()</code> call manually. Get the cookie using the <code>$_COOKIE</code> array, find the session file, parse the file for the perma flag (<code>unserialize()</code> didn&rsquo;t work as I hoped it might have done) and then resume the original process at step 3. I haven&rsquo;t implemented such a system myself as yet, so this approach is untested.</p>

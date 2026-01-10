---
layout: post
title: Site-specific stylesheets
date: '2003-12-09T05:08:24+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880564080/site-specific-stylesheets
---
<p>A new thing that&rsquo;s coming around, I think perhaps down to <a href="http://archivist.incutio.com/viewlist/css-discuss/13291">Eric Meyer</a>, is giving the body tag of your pages an ID related to your URL so that people can create styles in their user sheets that specifically tackle issues they might have with your site. E.g. this site now has <code>&lt;body id="aftnn-org"&gt;</code>, you can put a style like the following in your user sheet, if you can&rsquo;t read my fonts:</p>
<p class="eg">
<code>body#aftnn-org * { font-size: larger; }</code>
</p>
<p>This idea found it&rsquo;s way to www-style today. Apparently something similar has been proposed before, in 1999! Way to go W3C. This would be a valuable technology for users with accessibility problems to leverage. It&rsquo;s a bandaid, yes, but one which empowers the user to make good on the individual mistakes of each author. However, it&rsquo;s only valuable if those users can actually find and use the feature. At the moment there is no form of site-specific syntax in CSS itself (although it does lend itself to the above hack) and I think that a push from the W3C will be required if this is to help the minority of users who really need it. It gives user sheets the power they really need to be useful.</p>
<p>I&rsquo;m arguing in favour of the addition of something along the lines of:</p>
<p class="eg"><code>
@scope url="http://www.yahoo.com" {
<div style="margin-left:2em;">color: red;</div>
}
</code></p>
<p>Which is very close to the original proposal, but we&rsquo;ve been discussing some potential enhancements as well.</p>

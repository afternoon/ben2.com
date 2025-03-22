---
layout: post
title: Paypal's solution to the multiple submissions problem
date: '2003-10-24T20:14:26+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47972962283/paypals-solution-to-the-multiple-submissions-problem
---
<p>When a user submits a form, sometimes it can take a long time for the result to come through. In this situation the user often clicks the button repeatedly to try and get results. This results in many requests being sent to the system, all of which are valid and are then processed. Hence the double posts on Hype and multiple purchases on ecom sites.</p>
<p>Paypal have a nice hack. Disable the button with Javascript once it&rsquo;s been clicked.</p>
<p>The only worry with this is what happens if the page load genuinely fails? You could set a timeout of say 60 seconds to re-enable the button. Or maybe just repond to successive clicks with an input box, checking that the user isn&rsquo;t just being impatient.</p>

---
layout: post
title: Modelling cost of delay of technical debt
date: '2016-05-02T22:06:00+01:00'
tags:
- prioritisation
- estimation
- costofdelay
tumblr_url: https://aftnn.org/post/143756019147/modelling-cost-of-delay-of-technical-debt
---
<p><a href="https://www.amazon.co.uk/Principles-Product-Development-Flow-Generation/dp/1935401009">Don
Reinertsen</a>
and others propose <a href="http://blackswanfarming.com/cost-of-delay/">Cost of Delay</a>
as a metric for prioritising work in product delivery teams (read: agile). This
can be applied building new features and to <a href="http://reinertsenassociates.com/technical-debt-adding-math-metaphor/">repaying technical
debt</a>.</p>

<p>There are multiple types of technical debt:</p>

<ul>
<li>Issues which are the root cause of failures affecting customers and therefore
affecting profits, like a database query that doesn&rsquo;t scale and makes your
site unusably slow at busy times</li>
<li>Issues which might cause a failure in the future, like a <a href="https://en.wikipedia.org/wiki/Single_point_of_failure">single point of
failure</a></li>
<li>System design issues which make the software harder to maintain and affect
cycle time, like lack of test coverage or <a href="https://en.wikipedia.org/wiki/God_object">god
objects</a></li>
</ul>

<p>Could we build a model for each type of debt? This would allow us to capture a
few inputs for each new issue and calculate the cost of delay quickly. We could
also update our cost of delay calculations when we gain new information, either
by plugging in new inputs or by changing the assumptions in the model.</p>

<h2>Issues affecting product availability</h2>

<pre><code>Cost of delay per week = probability of failure occuring each week * mean time
to recovery in hours * cost of hour of downtime.
</code></pre>

<p>We can create a general model for technical debt which has caused failures in
the past or which might cause failures in the future. For past failures, we can
calculate the probability of failure each week from availability metrics or
incident post-mortems. For things that might happen in the future, we must
estimate that probability, but the input is the same. You can use base rates
from other sources, e.g. if your point of failure is a single server, you could
use industry server failure rate data to guide your estimation.</p>

<p>Likewise, the <a href="https://en.wikipedia.org/wiki/Mean_time_to_recovery">mean time to
recovery</a>, how long it
takes to get everything working normally again, can be calculated from records
or estimated based on similar failures.</p>

<p>The cost of an hour of downtime depends on the type of failure. It might be any
revenue you make for an hour if your whole site or app is down. If
non-transactional features are not working, the cost might be more to your
reputation, which knocks on to your revenue/profit in ways which are hard to
predict. The trick is to come up with a consistent model for different issues,
based on your company goals. You may not know the monetary cost of a flakey
application, but if one organisation and your customers value reliability, then
you should weight it high in your prioritisation.</p>

<p>To keep things simple, we could count the cost of an hour of downtime as the
lifetime value of the customers we would have acquired in that hour, and assume
that our returning customers are perfectly loyal - that we will not churn a
single one. obviously that&rsquo;s naive, but the extent to which that introduces
error into the model varies from business to business.</p>

<h2>Issues that increase cycle time</h2>

<pre><code>Cost of delay per week = total dev hours lost per week
</code></pre>

<p>A developer hour is worth <code>(average annual salary / working hours in a year) *
employee cost multipler</code>. An employee costs not just their salary. They receive
other benefits, need space to work, a desk, a computer, etc. We represent this
as the employee cost multiplier.</p>

<p>Increased cycle time has a large effect on which opportunities you pursue. What
new features would we build and launch if our cycle times were 10 times shorter?
What profits would they generate? This is impossible to estimate. The simplest
approach from the perspective of cost of delay is not to try.</p>

---
layout: post
title: Serve HTTPS From Elastic Beanstalk Application Instances
date: '2013-04-05T16:15:00+01:00'
tags:
- aws
- elb
- elasticbeanstalk
- https
tumblr_url: https://aftnn.org/post/47880394770/serve-https-elastic-beanstalk-application-instances
---
<p><a href="http://aws.amazon.com/elasticbeanstalk/">Elastic Beanstalk</a> is Amazon&rsquo;s platform-as-a-service built on top of EC2, S3 and other Amazon services.</p>

<p>An Elastic Beanstalk application consists of one or more EC2 instances running your application and a set of supporting resources, including an <a href="http://aws.amazon.com/elasticloadbalancing/">Elastic Load Balancer</a>. By default, the load balancer listens on port 80 and forwards traffic to port 80 on your app servers. You can <a href="http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https.html">configure the load balancer to listen on 443 easily</a>, but traffic from the LB to the app servers is not encrypted. To encrypt the traffic on this hop, you must configure your app servers to listen for HTTPS requests.</p>

<h2>Options For Configuring App Servers To Serve HTTPS</h2>

<p>This can be done one of 2 ways (examples specific to Tomcat, but the methods should be applicable to any app server).</p>

<ol>
<li>Use Elastic Beanstalk configuration files to install packages, create Apache configuration files, certificate and key files in the relevant locations.</li>
<li>Create your own app server AMI with HTTPS enabled. For Tomcat, <a href="https://forums.aws.amazon.com/message.jspa?messageID=235332#310452">443 forwarding to 80 (HTTPS)&hellip; How can I set up REAL HTTPS on Beanstalk</a> outlines the required steps.</li>
</ol>

<p>Method 1 seems preferable as it avoids the need to keep AMIs up-to-date, e.g. when security patches are released.</p>

<h2>Using Elastic Beanstalk Configuration Files</h2>

<ol>
<li>Create an <code>.ebextensions</code> dir at the root of your app dir or WAR file</li>
<li>Copy in any files you want to create</li>
<li>Create an Elastic Beanstalk configuration file to describing the required instance configuration changes</li>
</ol>

<h3>Example Configuration File</h3>

<script src="https://gist.github.com/afternoon/5384087.js" type="text/javascript"></script>

<p>Custom commands are run before services are started. There&rsquo;s no need to restart services if you&rsquo;re changing their configuration (e.g. Apache in this case).</p>

<p>Note for Scala developers: SBT ignores hidden directories when building projects (and I can&rsquo;t work out how to override that). You can use <code>jar uf /path/to/file.war .ebextensions</code> to insert the <code>.ebextensions</code> dir into the WAR file after packaging.</p>

<h3>References</h3>

<ul>
<li><a href="http://www.infoq.com/news/2012/11/elastic-beanstalk-config-files">Customize AWS Elastic Beanstalk with Configuration Files</a> is a good starting point for Elastic Beanstalk configuration files.</li>
<li><a href="http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers-ec2.html#customize-containers-format-container_commands">Customizing the Software on EC2 Instances</a> describes the use of Elastic Beanstalk configuration files in detail.</li>
</ul>

<h3>Login With SSH To Verify Changes</h3>

<p><a href="http://stackoverflow.com/a/4921866/26201">SSH to one of your Elastic Beanstalk instances</a> to ensure that the changes have been applied correctly.</p>

<h3>Initialisation Logging</h3>

<p>The Elastic Beanstalk startup process writes any errors raised by custom container commands to <code>/var/log/cfn-init.log</code>. If your instance doesn&rsquo;t start properly, for example services don&rsquo;t start, look there.</p>

<h3>Backend Authentication</h3>

<p>Backend authentication is a feature of Elastic Load Balancer. It uses the public key of a certificate to verify that the backend app server is encrypting traffic with a valid certificate. This needs to be enabled for LB to app server HTTPS to work (otherwise you&rsquo;ll get timeouts when making requests to the LB on port 443).</p>

<h2>Security Group And Load Balancer Config File</h2>

<p>A new load balancer and security group are created each time you deploy your application. Their configuration will revert back to the default, listen on port 80 only, whenever an environment is started. To avoid this, creating a second Elastic Beanstalk configuration file describing the required resource properties. E.g.</p>

<script src="https://gist.github.com/afternoon/5384101.js"></script>

<p>You&rsquo;ll need to change this to point to your certificate in IAM, to restrict SSH access to the right IP range and to add your public key.</p>

<p><a href="http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-resources.html">Customizing Environment Resources</a> describes how to write configuration files for the other AWS resources in an Elastic Beanstalk environment.</p>

<p>How to write policies to manage backend authentication is described in the examples in <a href="http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-elb-policy.html">ElasticLoadBalancing Policy Type</a>.</p>

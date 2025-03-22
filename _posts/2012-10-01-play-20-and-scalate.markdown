---
layout: post
title: Play 2.0 And Scalate Step-By-Step
date: '2012-10-01T17:20:00+01:00'
tags:
- play2
- scala
- scalate
tumblr_url: https://aftnn.org/post/47880398858/play-20-and-scalate
---
<p>Jan Helwich has done a great job of describing <a href="http://janhelwich.wordpress.com/tag/scalate/">how to use Scalate with Play 2.0</a>. He&rsquo;s even provided an <a href="https://github.com/janhelwich/Play-2-with-Scala-and-Scalate">example Play 2.0 project which uses Scalate</a>. This post contains step-by-step instructions for a new project based on his work.</p>

<p>For convenience, I&rsquo;ve also wrapped these changes up as a <a href="https://gist.github.com/3812769">patch that can be applied to a new Play 2.0 project</a>. Apply it with <code>git am --signoff play20-with-scalate.patch</code>.</p>

<ol>
<li><p>Create a new Play project.</p>

<pre><code>play new myproject
# choose "1 - Create a simple Scala application"
</code></pre></li>
<li><p>Add Scalate to your project dependencies in <code>project/Build.scala</code></p>

<pre><code>val appDependencies = Seq(                                                   
  // Add your project dependencies here,                                     
  "org.fusesource.scalate" % "scalate-core" % "1.5.3"                        
)    
</code></pre></li>
<li><p>Place a copy of Jan Helwich&rsquo;s <code>ScalateIntegration.scala</code> in <code>app/lib</code></p>

<pre><code>curl -o app/lib/ScalateIntegration.scala <a href="https://raw.github.com/janhelwich/Play-2-with-Scala-and-Scalate/master/app/controllers/ScalateIntegration.scala">https://raw.github.com/janhelwich/Play-2-with-Scala-and-Scalate/master/app/controllers/ScalateIntegration.scala</a>
</code></pre></li>
<li><p>Set the default Scalate template type in <code>conf/application.conf</code>.</p>

<pre><code># Default Scalate template format (mustache, scaml, jade, ssp)
scalate.format=jade
</code></pre></li>
<li><p>Create a layout and a template.</p></li>
</ol>

<p><code>app/views/layouts/default.jade</code></p>

<pre><code>    -@ var body: String
    -@ var title: String = "Page"

    !!!5
    html
      head
        title= title
      body
        != body
</code></pre>

<p><code>app/views/index.jade</code></p>

<pre><code>    -@ var title: String = "Page"

    h1= title
</code></pre>

<ol start="5">
<li><p>Use your templates in a controller.</p>

<pre><code>package controllers

import play.api._
import play.api.mvc._

object Application extends Controller {
  def index = Action {
    Ok(Scalate("index.jade").render('title -&gt; "Hello world!"))
  }
}
</code></pre></li>
</ol>

<p>Done! Try out your app with <code>play run</code></p>

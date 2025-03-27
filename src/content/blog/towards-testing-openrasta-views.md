---
layout: post
title: Towards testing OpenRasta views (OR 2.0.3, .NET 4, VS 2010)
date: '2010-06-18T19:38:26+01:00'
tags:
- openrasta
- csharp
- ".net"
tumblr_url: https://aftnn.org/post/47880401632/towards-testing-openrasta-views
---
<p><a href="http://www.wonga.com/">My employer</a> is a .NET shop. Despite my open source upbringing, I&rsquo;ve been getting to grips with some of the newer .NET technologies, <a href="http://www.openrasta.com/">OpenRasta</a> for exposing objects RESTfully, <a href="http://fluentnhibernate.org/">Fluent NHibernate</a> for simple object-RDBMS mapping. Some pretty cool stuff coming from the <a href="http://altdotnet.org/">ALT.NET</a> scene.</p>

<p>I&rsquo;m building a RESTful XML service with OpenRasta. I encountered a couple of problems that weren&rsquo;t covered by the <a href="http://trac.caffeine-it.com/openrasta/wiki/Doc">community documentation</a> so I&rsquo;ve written them up here. As such this is not a complete introduction. See this <a href="http://stackoverflow.com/questions/2264839/getting-started-with-openrasta">question on StackOverflow about getting started with OpenRasta</a> for help on that front.</p>

<h2>A quick note about Web.config</h2>

<p>The minimal changes to Web.config suggested by the <a href="http://trac.caffeine-it.com/openrasta/wiki/Doc/Tutorials/FirstSite">first site tutorial</a> wasn&rsquo;t enough for me in VS 2010. However, borrowing the <a href="http://trac.caffeine-it.com/openrasta/browser/branches/2.0.3000/src/demo/OpenRasta.Demo/Web.config">Web.config from OpenRasta.Demo</a> (included in the OR repo) and hacking it a little bit worked a treat. Here is the <a href="http://gist.github.com/429870">complete Web.config for an OR 2.0.3 project hosted on ASP.NET in VS2010</a> that&rsquo;s working for me right now.</p>

<h2>A note about NUnit versions</h2>

<p>OpenRasta.DI.Unity.Tests.Unit introduces a dependency on nunit.framework.dll version 2.5.1.9189. If you&rsquo;re using a different version, you can redirect the binding in App.config. See <a href="http://blueonionsoftware.com/blog.aspx?p=03fe209c-db64-4a04-9adc-cec25b36f68b">Resolving Dependent .NET Assembly Version Conflicts</a> for more info.</p>

<h2>Testing views</h2>

<p><a href="http://docs.djangoproject.com/en/1.2/topics/testing/#module-django.test.client">Django&rsquo;s test client</a> makes it easy to test a view.</p>

```python
>>> from django.test.client import Client
>>> c = Client()
>>> response = c.get("/retailer/1")
>>> response.content
'<?xml version="1.0" encoding="utf-8"?>...'</code></pre>
```

<p>I want to do the same thing to my OpenRasta views.</p>

<ol>
<li>Set up a lightweight environment with 1 or 2 lines of code.</li>
<li>Pass an URL to a method which returns the view output.</li>
<li>Parse response content and inspect data contained therein.</li>
</ol>

<p>I would prefer not to have to set up a dev web server or use Selenium or Twill or some other tool to test my view code. Although those are valid integration tests, they&rsquo;re complicated and slow. My purpose is just to demonstrate that I&rsquo;ve wired my domain model and OpenRasta together correctly, so I want to test the shortest code path.</p>

<p>OpenRasta provides <code>InMemoryHost</code> which looks like it should solve the problem nicely. OpenBastard, OpenRasta&rsquo;s suite of regression tests, also provides some tools for solving this problem. Sadly, both are undocumented and work in progress at the time of writing.</p>

<p>After spending some time looking through the source and asking questions on the mailing list, I wasn&rsquo;t able to create a test environment using either <code>InMemoryHost</code> or OpenBastard. I&rsquo;ll update this post as and when I make any progress.</p>

<p>However, in the meantime, here is an integration test that passes a request to OR through IIS running on localhost.</p>

```csharp
[TestFixture]
public class RetailerTests
{
    [Test]
    public void GetRetailer_RetailerExists_RetailerRepresentationReturned()
    {
        var uri = new Uri("http://localhost/retailers/1");
        var webRequest = (HttpWebRequest)WebRequest.Create(uri);
        webRequest.Method = "GET";
        webRequest.ContentType = "application/x-www-form-urlencoded";
        webRequest.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";

        Retailer retailer;
        DataContractSerializer dcs = new DataContractSerializer(typeof(Retailer));
        using (var response = webRequest.GetResponse())
        {
            retailer = (Retailer)dcs.ReadObject(response.GetResponseStream());
        }

        Assert.AreEqual(retailer.Id, 1);
        Assert.AreEqual(retailer.Name, "Retailer");
        Assert.AreEqual(retailer.Products.Count, 1);
    }
}
```

<p>Based on code <a href="http://groups.google.com/group/openrasta/msg/b93992b038a2c42b">posted to the OpenRasta mailing list by David Lawton</a>.</p>

---
layout: post
title: Inspecting CSS in Python with cssutils
date: '2007-03-12T14:53:38+00:00'
tags: []
tumblr_url: https://aftnn.org/post/47880435651/inspecting-css-in-python-with-codecssutilscode
---
<p>For a new <a href="http://mymart.com/">MyMart</a> feature, we&rsquo;re allowing our members to customise the look of parts of the site.They can choose custom colours with a palette widget. The values they give us are used to generate a CSS stylesheet which alters the rendering of certain page items.</p>
<p>I wanted to write test cases to ensure that the CSS is being generated correctly, so I used Christof Hoecke&rsquo;s <a href="http://cthedot.de/cssutils/"><code>cssutils</code></a> module to parse and then inspect the CSS.</p>
<p><code>cssutils</code> parses a stylesheet into a hierarchy of DOM Level 2 objects. A stylesheet is typically made up of several <code>CSSStyleRule</code>s which are broken down into a list of <code>Selector</code> objects and a <code>CSSStyleDeclaration</code> object which can be interrogated for the actual values we&rsquo;re looking for.</p>
<p>First pull the CSS text into a variable, load it from file, enter it by hand, what ever is appropriate.</p>

<p class="eg"><code>
&gt;&gt;&gt; pagecsstext = """div.data-key { color:#333333; }"""
</code></p>

<p>Once we have the CSS in hand, parse it using <code>cssutils</code>&rsquo; 
<code>parseString</code> method.</p>

<p class="eg"><code>
&gt;&gt;&gt; from cssutils import parseString<br/>
&gt;&gt;&gt; pagecss = parseString(pagecsstext)<br/>
&gt;&gt;&gt; pagecss.cssRules<br/>
[&lt;cssutils.css.cssstylerule.CSSStyleRule object at 0x1480230&gt;]
</code></p>

<p>For the tests, I then need to search out and evaluate specific rules and values. <code>cssutils</code> doesn&rsquo;t make this as easy as we might like, my hope here was that I would be able to say something like <code>pagecss.get_rule_for_selector("div.data-key")</code> or something similar. There are problems with this for the implementor, I might request <code>.data-key</code> which should match in some situations. However, it would be nice to see a naive implementation added to the module. Here&rsquo;s one I made earlier:</p>

<p class="eg"><code>
def get_rule_for_selector(stylesheet, selector):<br/>
    for rule in stylesheet.cssRules:<br/>
        if hasattr(rule, "selectorList") and selector in [s.selectorText for s in rule.selectorList]:<br/>
            return rule<br/>
</code></p>

<p>We can then write expressions to get to the values of the stylesheet as follows.</p>

<p class="eg"><code>
&gt;&gt;&gt; div_data_key = get_rule_for_selector(pagecss, "div.data-key")<br/>
&gt;&gt;&gt; div_data_key = div_data_key.style.getPropertyValue("color") u'#333333'
</code></p>

<p>Bringing it all together, here is my first test case. The page is served by <a href="http://www.djangoproject.com">Django</a>, so I use their <code>Client</code> object to make a request.</p>

<p class="eg"><code>
class ShopTests(MyMartTestCase):<br/>
    def test_shop_css(self):<br/>
        c = Client()<br/>
        r = c.get("/somebody/screen.css")<br/>
        self.assertEqual(r.headers["Content-Type"], "text/css; charset=utf-8")<br/>
<br/>
        rcss = parseString(r.content)<br/>
<br/>
        tc_h2 = get_rule_for_selector(rcss, "table#content h2")<br/>
        self.assertEqual(tc_h2.style.getPropertyValue("background-color"),<br/>
                "#ff99cc")<br/>
        self.assertEqual(tc_h2.style.getPropertyValue("color"),<br/>
                "#000000")<br/>
<br/>
        tc_body = get_rule_for_selector(rcss, "table#content div.block-body")<br/>
        self.assertEqual(tc_body.style.getPropertyValue("background-color"),<br/>
                "#ffccdd")<br/>
        self.assertEqual(tc_body.style.getPropertyValue("color"),<br/>
                "#333333")
</code></p>

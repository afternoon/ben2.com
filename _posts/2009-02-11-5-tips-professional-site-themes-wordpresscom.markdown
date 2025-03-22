---
layout: post
title: 5 tips for professional site themes on WordPress.com
date: '2009-02-11T10:06:42+00:00'
tags:
- wordpress
- css
tumblr_url: https://aftnn.org/post/47880415714/5-tips-professional-site-themes-wordpresscom
---
<p>WordPress is a great platform for building a simple website. It&rsquo;s a featureful and flexible blogging engine and CMS. Even better <a href="http://wordpress.com">WordPress.com</a> allows you host your site for free. Reasonably priced upgrades allow you to host your site on your own domain and apply custom CSS. This all adds up to a great tool for hosting even professional sites.</p>

<p>WordPress.com has some restrictions compared to the version you download. Super-cheap, zero-hassle hosting is very compelling though, so it&rsquo;s worth bending your requirements to fit work WordPress.com&rsquo;s constraints. I&rsquo;ve built a few sites this way. The latest, <a href="http://yakeba.wordpress.com/">Yakeba</a>, for a Balinese charity, took me just a day preparing images and writing custom CSS. The <a href="http://yakeba.wordpress.com/?css=css&amp;rev=17">final custom CSS</a> is not drastically more horrible than a stylesheet prepared for a site over who&rsquo;s HTML you have full control.</p>

<p>Here are 5 techniques I found particularly useful while building Yakeba:</p>

<ol>
<li><a href="#pages">Using a static home page</a></li>
<li><a href="#theme">Picking the right theme</a></li>
<li><a href="#css">CSS hackery</a></li>
<li><a href="#html">Using the classes and IDs in the theme HTML</a></li>
<li><a href="#widgets">Widgets</a></li>
</ol>

<p><a name="pages"></a></p>

<h2>1. Static home page</h2>

<p>The ability to create static pages and to use one as a home page is what lifts WordPress from being a blogging engine to being a simple CMS. You can use this feature even on a blog hosted on WordPress.com.</p>

<ol>
<li>Create a page in the WordPress admin, title it &ldquo;Home.&rdquo;</li>
<li>Create a second page, call it &ldquo;Blog.&rdquo;</li>
<li>Go to Settings &gt; Reading.</li>
<li>Select &ldquo;A static page&rdquo; for the Front page displays option.</li>
<li>Select your &ldquo;Home&rdquo; page in the drop down menu for the Front page option.</li>
<li>Select your &ldquo;Blog&rdquo; page for the Posts page option. This tells WordPress to use the url from the &ldquo;Blog&rdquo; page as an index of your blog posts. It will ignore the actual page content and put a list of the latest posts there.</li>
</ol>

<p>Any pages you create will automatically appear in your theme&rsquo;s navigation. If you want more control over the navigation, create a text widget and position it absolutely with CSS.</p>

<p><a name="theme"></a></p>

<h2>2. Pick the right theme for custom CSS</h2>

<p>WordPress.com&rsquo;s theme selection is not perfect, but there are a range of different layouts and the themes have good separation of content and presentation. The theme defines the HTML, so spend a bit of time working out which theme has the best HTML for you to start with. For Yakeba that meant the theme had to have 3 columns and navigation links.</p>

<p>Once you pick a theme, you can add custom CSS to either modify that theme a little, to change colours for example. Or you can get serious with the CSS magic and create a new look altogether.</p>

<p><a name="css"></a></p>

<h2>3. Know your CSS</h2>

<p>CSS has got steadily better and better since it&rsquo;s introduction in 1996. Even IE 6 will let you drastically change the layout of a page, create effects like buttons and menus and much more. If you have a good command of CSS, you can create a really excellent theme without changing a site&rsquo;s HTML. You&rsquo;ll need to buy WordPress.com&rsquo;s Custom CSS upgrade, but it&rsquo;s very cheap.</p>

<p>Here are some examples from Yakeba:</p>

<h3>Create navigation menus and buttons with rounded corners</h3>

<p>Yakeba has a big donate button on the right side. If you&rsquo;re sensible and are using Firefox or Safari, you&rsquo;ll see nice rounded corners. It&rsquo;s all CSS and degrades nicely to square borders in IE and older browsers.</p>

<p>Here is the CSS I used:</p>

<pre><code class="css">.bigbtn {
    text-align: center;
    padding: 8px 0;
}
.bigbtn a {
    background-color: #060;
    border: 2px outset #090;
    color: white;
    padding: 6px 14px;
    font-size: large;
    font-weight: bold;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}
.bigbtn a:link, .bigbtn a:visited {
    color: white;
    text-decoration: none;
}
.bigbtn a:hover, .bigbtn a:active {
    text-decoration: underline;
}</code></pre>

<h3>Clickable logo with a large header background</h3>

<p>The Yakeba header is an image applied with the CSS <code>background-image</code> property. The image stretches the width of the page and contains the logo on the left. The actual header in the theme HTML is the blog name. I hid the text by setting <code>font-size:0;</code> and setting the same colour as the image background. I then hard-coded the sized of the <code>&lt;a&gt;</code> tag linking to the homepage (<code>#header p a</code>) so that it covered the area of the header background containing the Yakeba logo. Bingo, clickable logo.</p>

<p><a name="html"></a></p>

<h2>4. Learn to love WordPress.com&rsquo;s HTML</h2>

<p>The HTML generated by WordPress.com&rsquo;s limited selection of themes can be frustrating at times. You&rsquo;re forced to find a &ldquo;good enough&rdquo; fit and then work around it. However, there are a broad range of IDs, classes and structures which can use to your benefit if you are canny with your CSS selectors. Some examples that I employed when building Yakeba:</p>

<h3>Main content and sidebars</h3>

<p>The Fadtastic theme defines a main content area in <code>#content</code> (wrapped by <code>#content_wrapper</code>) and 2 side bars, <code>#side_one</code> and <code>#side_two</code>. These are the main areas of content in the page and the elements you should lay out. I built a simple <code>float</code> layout for the columns and then created vertical separators using a vertically repeating <code>background-image</code>. This is a nice trick if you&rsquo;re happy with a fixed-width layout. The required CSS is simple enough for mere mortals and IE 6.</p>

<h3>Hiding elements to remove content</h3>

<p>I hid the footer (mainly because it attributes the theme to someone else!) and several areas of the navigation. Hide elements with <code>display:none;</code> On the homepage I even hid the page title (<code>#post-24 h1 { display:none; }</code>) because I wanted the navigation link text to be &ldquo;Home&rdquo; but for the page to have a single paragrah overview in large type. All pages, blog posts and widgets have IDs like this which you can use to apply CSS properties to specific parts of the page.</p>

<h3>Lists within lists within widgets</h3>

<p>The Fadtastic theme creates widgets as lists and then creates content within those widgets as more lists. Selectors like <code>.side ul</code> and <code>h3.widgettitle, li.linkcat h3</code> allowed me to grab those lists by the horns and pull them into shape.</p>

<p><a name="widgets"></a></p>

<h2>5. Widgets are wonderful</h2>

<p>Another feature that sets WordPress apart is widgets. Widgets are just little blobs of content that you can add to your theme&rsquo;s sidebars. Widgets include recent posts, RSS feeds, content from a select few other sites (e.g. <a href="http://flickr.com/">Flickr</a>), and, most usefully, boxes of custom HTML.</p>

<h3>Text boxes</h3>

<p>You can add as many boxes of text (actually HTML) as you need and optionally give each one a title. This allows you to create bits of static content that appear on all pages. Because the boxes can contain HTML, you can create any kind of content and then style it with custom CSS. You can also embed widgets from other sites, which gives you quite a few options for customisations.</p>

<h3>RSS feed magic</h3>

<p>I wanted to display latest posts in the central column of Yakeba&rsquo;s pages. WordPress.com doesn&rsquo;t actually have a widget to do that, but it does have an RSS widget which will display a snippet of each item. Adding an RSS widget and setting the feed url to the feed of the site&rsquo;s blog gave me enough of what I wanted.</p>

<h2>Conclusion</h2>

<p>This wasn&rsquo;t meant to be an exhaustive list of WordPress.com tricks. Their forums have a lot more info. I hope, however, I&rsquo;ve given you a sense of how much can be done with WordPress.com&rsquo;s features if you set your mind to it.</p>

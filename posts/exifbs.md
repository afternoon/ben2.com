---
layout: post
title: Exif/BS
date: '2003-04-14T05:56:03+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973276521/exifbs
---
<p>After installing several CPAN modules to dig Exif data out of JPEGs (including Image::Info) I was appalled that none of them found a thing. PHP&rsquo;s <code>read_exif_data</code> function found a mine of information (literally I guess) in my digital picture library.</p>
<p>I&rsquo;ve been meaning to do a gallery section for this site for a while, but I want to keep my iPhoto library and my online library in sync and make it easy for me to add new photos to both. Plus I didn&rsquo;t want a database. iPhoto can export to HTML. It outputs an index page and a page with previous/next navigation for each image. It also generates scaled versions for thumbnails and for actual-size pictures if you wish. After toying with the idea of reformatting the output HTML in Perl or PHP, it occurred to me that this would mean that the design of the gallery section became static and that I would have to regenerate every time I wanted to tweak the pages.</p>
<p>So instead I&rsquo;ve written a PHP script which reformats the iPhoto index page into an XML document and supplements it with interesting data from the Exif block of the images (e.g. date). The next step is to write PHP that will read these XML gallery definitions and produce an interface.</p>
<p>One note: Almost all of my images are 1600x1200, around 400k a piece. This is really too large for me to fit the several hundred I want on to my ISP&rsquo;s disks so I have scaled them all to 1024. I&rsquo;d rather have the flexibility provided by the <a href="http://ninj4.org/gallery/">Zope gallery used by Mat</a>, which is really nice, but I haven&rsquo;t the space. I will add a disclaimer stating that larger versions of images are available.</p>

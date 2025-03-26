---
layout: post
title: Ahhhh ha hahaha!
date: '2004-08-13T08:00:28+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880504904/ahhhh-ha-hahaha
---
<p>I&rsquo;ve been hacking heavily on <a href="http://www.cohack.com/tools/infocms/">InfoCMS</a> and I&rsquo;m really starting to create cool stuff now:</p>
<ul>
<li>I created a form representation system which describes a form spec in XML and then provides methods to allow generation of an HTML form with notes and hints and things, validate data entered into that form, redraw the form with friendly field-specific error messages and more.</li>
<li>I created a metadata system that allows forms to be concatenated and the metadata bits reduced to XML. Once you add a metadata field (with rich type options) to a form, the system takes care of gathering and letting users edit that data through all the usual web controls. This allows me to have a very simple layout for my user table, for example, but for hackers to be able to add as many fields as they like just by editing the metadata XML definition. A user&rsquo;s metadata can then be queried by creating an object from the stored representation. Because I&rsquo;m using DB_DataObject which supports overloading, hackers can add get and set functions to the DataObject class, and have those allow manipulation of the metadata fields exactly as if they were real columns.</li>
<li>I created a simple system for paging lists of records, built on top of a previous hack I made for Hype to integrate DB_Pager with DB_DataObject. It creates everything including the back and forward navigation.</li>
<li>And then, the crowning glory, I pulled it all together to create a class called ManagerView. This uses forms, metadata, database classes and InfoCMS&rsquo;s view hierarchy to allow hackers to create database table management interfaces with a minimum of no code, but by overloading methods in ManagerView, they can control the flow of data as it is created and edited down to the smallest detail. The code for the interface for managing user roles in InfoCMS is now 15 lines. This includes paged listing, adding, editing and removing of records. The interfaces created by ManagerView are rich and friendly and are only going to get better as I distill more of my experience as a web hacker into the class and it&rsquo;s friends.</li>
</ul>
<p>I&rsquo;m feeling pretty chuffed now.</p>

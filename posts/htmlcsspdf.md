---
layout: post
title: "htmlcsspdf: A Tool For Quickly Creating Beautiful PDFs"
date: "2026-08-28T11:21:00+01:00"
tags: ["html", "css", "pdf"]
---
[htmlcsspdf](https://htmlcsspdf.ben2.workers.dev/) lets you generate PDFs from HTML and CSS with a live preview. If that sounds like an almost masochistic way to create documents, let me explain.

Creating a beautiful document takes time and attention to detail. Updating it later can then be painful. Agents are great for trying out content changes, but they struggle to preserve a document's design in document formats like docx or PDF. They don't yet have the eye for detail that humans have.

For writing code, tools like [codepen](https://codepen.io) are great sandboxes for experimentation. Quickly testing out an idea has almost no friction, just click "New" and type, and see the results immediately.

I wanted a workflow to update my document _content_ quickly without having to redo all the _styling_. This is the exact separation that HTML and CSS were created for. CSS is a wildly powerful tool for implementing design that flexes with different content.

All that was missing was a tool with preview, reducing editing friction and shortening the feedback loop. So I built it. This version is basic, you can't save files, but you can use an agent browser extension to create content. Try uploading an existing doc and asking the agent to create the HTML and CSS for you.

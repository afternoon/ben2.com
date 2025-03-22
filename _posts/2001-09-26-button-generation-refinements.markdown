---
layout: post
title: Button generation refinements.
date: '2001-09-26T21:31:28+01:00'
tags: []
tumblr_url: https://aftnn.org/post/48058180927/button-generation-refinements
---
<p>The button generators are in a good state. They work! Their potential hasn&rsquo;t been explored yet and won&rsquo;t be until people start compositing Fireworks output with TTF text on the fly. However, a useful addition would be to size the TTF text first and create taller, multi-line buttons automatically. This can be done easily in PHP/GD with imageTTFBBox(), which returns the size of a text phrase. The tricky bit is working out where to insert the newlines. Maybe a best guess based on multiplication of the pixel width of a nice-sized character (perhaps n) followed by refinements. It should only need one refinement as the words must be split at the spaces. </p>

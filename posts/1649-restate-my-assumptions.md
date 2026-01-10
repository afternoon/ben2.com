---
layout: post
title: 16:49. Restate my assumptions
date: '2003-04-28T19:49:09+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973228685/1649-restate-my-assumptions
---
<p>I&rsquo;ve just been reading design books in Books Etc and looking at pavements and thinking about the discussion so far. My thoughts:</p>
<ol>
<li>Grids are a great layout tool. Tables are a bad implementation of grids. There&rsquo;s no rotation or layering. Elements that should interact weakly (like borders) sometimes have to interact strongly with the content. A good idea might be to formalise layout grids into something other than <code>&lt;table&gt;</code>s, splitting them from data tables completely.</li>
<li>Positioning hierarchies are also very useful. Grids and indeed complex borders would be halfway implemented if we could nest layouts within blocks and define rigid rules for the sizing of those blocks. CSS2 states &ldquo;<a href="http://www.w3.org/TR/CSS2/visuren.html#choose-position">[Positioning proerties] specify offsets with respect to the box&rsquo;s containing block</a>.&rdquo; This is cool, but it also states &ldquo;Absolutely positioned boxes are taken out of the normal flow. This means they have no impact on the layout of later siblings.&rdquo;  Thus the result is not what you might predict. See <a href="/stuff/journal_src/abs-container.html">this demo</a>.</li>
<li>CSS is too dumb to suit authors. Authors can specify very quickly what they want to do in different situations, CSS does not allow them to write these specifications down. Example. If Hype is scaled so that it&rsquo;s only 200 pixels wide, I would want the columns to be stacked, but not in the order they are defined in the HTML. I&rsquo;d want 1,3,2 instead of 1,2,3. This ties in with a lot of Coises&rsquo; problems and constraints seem like a good way to express these nuances. However, I think that conditionals are really what&rsquo;s needed here and the constraints proposal doesn&rsquo;t really address that.</li>
</ol>

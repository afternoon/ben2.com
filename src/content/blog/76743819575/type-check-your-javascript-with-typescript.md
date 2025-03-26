---
layout: post
title: Type-check Your JavaScript With TypeScript
date: '2014-02-15T17:06:00+00:00'
tags:
- typescript
- definitelytyped
- javascript
tumblr_url: https://aftnn.org/post/76743819575/type-check-your-javascript-with-typescript
---
<p>TypeScript is a superset of JavaScript with optional static typing. The
<a href="#https://github.com:borisyankov/DefinitelyTyped">DefinitelyTyped</a> project
contains type definitions for major JavaScript libraries contributed by the
community. You can use these definitions and TypeScript&rsquo;s compiler to check your
code for errors, just by adding references.</p>

<p>We have a large AngularJS project. I&rsquo;d like to type-check all our code and maybe find a few bugs.</p>

<h2>Install TypeScript</h2>

<script src="https://gist.github.com/afternoon/9022879.js"></script>

<h2>Clone DefinitelyTyped to <code>references</code></h2>

<p>The <a href="#https://github.com:borisyankov/DefinitelyTyped">DefinitelyTyped</a> project
provides type definitions for AngularJS, Jasmine and about 100 other common
JavaScript libraries.</p>

<p>To keep it simple, I&rsquo;m just going to clone the whole lot into my project, where
I can reference anything I need.</p>

<script src="https://gist.github.com/afternoon/9022894.js"></script>

<h2>Rename All <code>.js</code> Files To <code>.ts</code></h2>

<p>By renaming all our files, we let <code>tsc</code> and other tools know the code should be
treated as TypeScript.</p>

<p>Let&rsquo;s give our unix skills a workout and do this with a <code>find</code> one-liner:</p>

<script src="https://gist.github.com/afternoon/9022899.js"></script>

<h2>Create References Includes For The Project</h2>

<p>TypeScript code needs to be annotated with <references></references> comments to link to the
type definitions we downloaded from DefinitelyTyped. E.g. for a Jasmine spec
which tests an Angular controller, we might need the following block at the top
of the file:</p>

<script src="https://gist.github.com/afternoon/9022906.js"></script>

<p>You&rsquo;ll need a reference for each library you&rsquo;re using. To
simplify things, let&rsquo;s create a couple of reference files which define the shared references for our module definitions and test specs and include those in
our code.</p>

<script src="https://gist.github.com/afternoon/9022921.js"></script>

<script src="https://gist.github.com/afternoon/9023044.js"></script>

<p>Note that <code>test.ts</code> references <code>module.ts</code>.</p>

<h2>Add References To All <code>.ts</code> Files</h2>

<p>Now, let&rsquo;s add the references to every TypeScript file with a couple more <code>find</code>
one-liners (requires GNU <code>sed</code>, if you&rsquo;re on OS X, install with <code>brew install gnu-sed
  --default-names</code>).</p>

<script src="https://gist.github.com/afternoon/9022928.js"></script>

<p>Phew!</p>

<p>The <code>path</code> attribute needs to be right. Luckily, all of the code in our project
is 5 levels deep in the directory structure. If your code doesn&rsquo;t have such a
regular structure, you&rsquo;ll need to do something more clever.</p>

<h2>Compile Everything With <code>tsc</code></h2>

<p>Finally, let&rsquo;s run everything through the TypeScript compiler and see the issues
we have to resolve:</p>

<script src="https://gist.github.com/afternoon/9022932.js"></script>

<h2>Adding Definitions For Missing Modules</h2>

<p>Adding type definitions for your own modules or 3rd-party modules missing from
DefinitelyTyped is straightforward. A few examples:</p>

<script src="https://gist.github.com/afternoon/9022941.js"></script>

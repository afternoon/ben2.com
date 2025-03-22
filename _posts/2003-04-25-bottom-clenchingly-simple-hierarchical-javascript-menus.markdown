---
layout: post
title: Bottom-clenchingly simple hierarchical Javascript menus
date: '2003-04-25T04:26:14+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47973255312/bottom-clenchingly-simple-hierarchical-javascript-menus
---
<ol>
<li>
<p>Create your HTML as a set of divs, nested like so:</p>
<p><img src="/stuff/journal_src/nesting.gif" width="403" height="107" alt="DIV nested diagram, the system comprises a recursive set of divs of class node, each node keeps it's children within another div of class child"/></p>
</li>
<li>
<p>Whack this in your stylesheet:</p>
<p class="eg"><code>
.child { margin-left:15px; display:none; }
</code></p>
</li><li>
<p>Stick the following function in the page and call it from onclick on every node that has children:</p>
<p class="eg"><code>
function selectNode(id) {<br/>
    node = document.getElementById("child" + id);<br/>
    if (node) {<br/>
        if (node.open) {<br/>
            node.style.display = "none";<br/>
            document.images["node" + id].src = "closed.gif";<br/>
            node.open = false;<br/>
        }<br/>
        else {<br/>
            node.style.display = "block";<br/>
            document.images["node" + id].src = "open.gif";<br/>
            node.open = true;<br/>
        }<br/>
    }<br/>
}<br/>
</code></p>
</li>
</ol>
<p>The best bit is that sub trees remain open while hidden. To explain, imagine Blah and Blah 2 have been clicked and Blah 3 is visible. If you know click Blah you will hide Blahs 1, 2, 3 and 4. But if you click Blah again, Blah 3 will still be visible under Blah 2. You really have to see it in action, so <a href="/stuff/journal_src/tree-demo.html">here&rsquo;s one I made earlier</a>.</p>

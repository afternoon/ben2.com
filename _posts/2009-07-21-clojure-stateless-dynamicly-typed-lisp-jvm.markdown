---
layout: post
title: 'Clojure: a stateless dynamically-typed Lisp on the JVM'
date: '2009-07-21T14:15:38+01:00'
tags:
- functionalprogramming
- clojure
- lisp
- erlang
- haskell
tumblr_url: https://aftnn.org/post/47880410552/clojure-stateless-dynamicly-typed-lisp-jvm
---
<p>I&rsquo;m a big fan of programming without state in languages like Haskell and Erlang. <a href="http://clojure.org/">Clojure</a> is a modern Lisp, but follows the stateless style very closely, taking ideas from Haskell and ML. Clojure is implemented in Java and runs on the JVM, providing full access to all of Java&rsquo;s libraries.</p>

<h2>Modern</h2>

<p>Clojure is a lot less crufty than other Lisp implementations, some of which are now pretty long in the tooth. Maps and vectors and a few other things are given syntax. Macros still work though, so I guess it&rsquo;s still all s-expressions (<code>[1 2 3]</code> could trivially map to <code>(vector 1 2 3)</code>). Clojure has a terse syntax with lots of good code smells (e.g. <code>*constant*</code> and <code>predicate?</code>).</p>

<h2>Structural sharing</h2>

<p>Clojure benefits from state of the art data structure research. Clojure&rsquo;s key data structures (lists, vectors, maps) are implemented using a technique called structural sharing. If you add an element to the front of an existing list, the new list is simply the new item plus the existing list. The existing list can be stored once. The new item simply points to the head of the existing list. This technique preserves complexity characteristics of operations on data structures (insert, remove, access, etc), minimises memory footprint and provides immutable state! Very cool stuff.</p>

<h2>Dynamic typing</h2>

<p>Clojure is dynamically-typed like Python or Ruby. This makes it a good entry point from these languages. For programmers looking to program without state other options are Haskell or Erlang. Erlang is awesome for building highly available, concurrent applications. It&rsquo;s syntax is kind of fun, but not for everyone. Haskell is strongly typed, pure and lazy. This unique mix of features can be very powerful, but can also trip you up. Both languages have a sweet spot, Clojure feels more general purpose. For me, that means great for scripting and writing web apps :-).</p>

<p>I like Django&rsquo;s minimal template language. There is an implementation in Erlang, but Erlang&rsquo;s string processing is somewhat weak. Templating and other string processing, like parsing JSON, is a bit long-winded. Haskell doesn&rsquo;t have any good template languages, the best option is <a href="http://www.haskell.org/ghc/docs/latest/html/libraries/xhtml/Text-XHtml.html">Text.Xhtml</a>, a combinator library. Not very designer-friendly. Haskell&rsquo;s powerful type system isn&rsquo;t very useful for implementing a text template language. It gets in the way more than it helps. It feels like an impedance mismatch. It would be an interesting project to build a template processor compatible with Django in Clojure.</p>

<h2>Recommended viewing</h2>

<p>For a more complete description <a href="http://blip.tv/file/812787">watch Clojure creator Rich Hickey describing Clojure and walking through a concurrent application</a>.</p>

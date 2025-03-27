---
layout: post
title: Erlang summary
date: '2008-12-01T02:35:00+00:00'
tags:
- erlang
- otp
tumblr_url: https://aftnn.org/post/47880419107/erlang-summary
---
<p>I just finished reading Joe Armstrong&rsquo;s &ldquo;<a href="http://www.pragprog.com/titles/jaerlang/programming-erlang">Programming Erlang: Software for a Concurrent World</a>.&rdquo; The first part was a bit slow for a someone familiar with other functional languages. I thought a brief summary of the language might be useful.</p>

<p>What you need to know:</p>

<ul>
<li><a href="http://www.erlang.org">Erlang</a> is a strict functional language similar in syntax to the ML family of functional programming languages (like Caml, Miranda and Haskell), but not a descendant (lists have commas for example).</li>
<li>Erlang has immutable state only (there are some mutable state options, you&rsquo;re not supposed to go there).</li>
<li>Erlang uses pattern matching to define functions, unpack data structures, etc. A set of function clauses have the same arity. A function with the same name and different arity is a different function. The pattern matching is heavily used and is pretty cool.</li>
<li>Erlang has case statements, exceptions, anonymous functions (&ldquo;funs&rdquo;), list comprehensions and pattern guards.</li>
<li>Atoms are just handy values. Like <code>blah</code>. Yes, <code>blah</code> is a valid atom. Erlang doesn&rsquo;t really have strings. On a full moon, when the weather is just right, lists of numbers become strings for a short time, but immediately change back. I&rsquo;ve heard that if you fire 2 Erlang number lists around the LHC, they concatenate.</li>
<li>Erlang doesn&rsquo;t have abstract types, just literals, lists, tuples and records (tuples with named members). There is an interesting convention of representing data structures as a tuple tagged with an atom prefix, e.g. <code>{point, 5, 15}</code>. This works nicely with pattern matching.</li>
<li>Erlang is really sweet for writing concurrent programs. It uses messaging passing to communicate between processes. No shared memory, no locks, programs can break out into multiprocessing way more easily than in other languages, particularly imperative ones. Work can be moved to other processes easily, other processes can be on other nodes easily. What Perl is to text processing, Erlang is to concurrency.</li>
<li>Open Telecoms Platform (OTP) is an environment for running server applications, a bit like a J2EE container. It provides a bunch of useful generic code for things like supervising processes so you don&rsquo;t have to. Dynamic code loading is part of the Erlang VM. There&rsquo;s a lot of useful systems code and tools in the Erlang distribution.</li>
<li>Amazon&rsquo;s SimpleDB is written in Erlang (real world example!).</li>
</ul>

<p>Armstrong&rsquo;s book is a great intro. I picked it up because I had a few conversations about Erlang over the last few months. It&rsquo;s an interesting language. I can&rsquo;t quite remember what, but something made me feel that Erlang was going to be an interesting skill to have in the coming years, that we would be hearing more of it. It may just be a passing fad, but it has delivered some heavyweight systems.</p>

<p>Armstrong designed and implemented the first version of Erlang in 1986.</p>

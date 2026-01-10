---
layout: post
title: Prog2a
date: '2004-03-16T04:28:00+00:00'
tags:
- ocaml
tumblr_url: https://aftnn.org/post/47880540179/prog2a
---
<p>I&rsquo;ve completed my <a href="https://gist.github.com/afternoon/5384066">OCaml implementation of problem 2a</a> in the BCS programming contest.</p>

<p>The problem:</p>

<blockquote>
<h2>2A Software Dependencies</h2>
<p>Writers of software installer packages have to cope with inter-dependencies between packages - instances where package A can only work if package B is already installed. Your task is to write a dependency validator, which takes a list of packages already installed and a list of packages the user wishes to install, and reports back (a) whether or not the installation is possible; and (b) in what order packages will be installed.</p>
<p>For example, assume we have a computer that already has packages A and B installed. We wish to install packages C and D. Package C depends on packages A and D, and package D depends on package B. The installation can go ahead, but the new packages must be installed in the order (D, C) because of C&rsquo;s dependency on D.</p>
<p>The input to your program will be a set of lines. Each line has a pair of strings, each enclosed in parentheses (). The first string in each pair states the list of packages already installed on the target computer (which could be empty), separated by commas:</p>
<p class="eg"><code>(A,B)</code></p>
<p>The second string lists the packages (at least one) and their dependencies; each package name is followed by a colon and then one or more package names, representing the packages upon which that element depends. The latter list&rsquo;s elements are separated by semi-colons:</p>
<p class="eg"><code>(C:A;D,D:B)</code></p>
<p>Note that is possible for a package to have no dependencies, in which case just the package identifier will be listed. You may assume that there will be no cyclic dependencies (e.g. A depends on B and B depends on A).</p>
<p>Each package name comprises one or more letters. Your program should disregard whitespace, which may be included in the strings except within a package name.</p>
<p>If all dependencies are satisfied, your program should output the order in which the packages should be installed, in the form exemplified in the sample output, below; where items are not constrained by dependencies, the names should be listed in alphabetical order. Case should be ignored in all instances (i.e. &ldquo;Pkg&rdquo; is the same as &ldquo;PKG&rdquo;).</p>
<p>If there is a problem with the dependency check, you should report &ldquo;Dependency check failed:&rdquo; and then list the failed dependencies as shown in the sample output, in alphabetical order of the package name before the colon.</p>
<p>You may assume a maximum of 10 distinct package names.</p>
<h3>Sample input</h3>
<p class="eg"><code>
() (B,A)<br/>
(A,B) (C:A;D,D:B)<br/>
(A,B) (C:E)<br/>
(A,B) (C:A;B;E,D:F)<br/>
(A,B) (C:A;B;D;E;F,E:A,D:F)
</code></p>
<h3>Sample output</h3>
<p class="eg"><code>
Install order: A,B<br/>
Install order: D,C<br/>
Dependency check failed: C:E<br/>
Dependency check failed: C:E, D:F<br/>
Dependency check failed: C:D;F, D:F
</code></p>
</blockquote>

<p>You can download my <a href="https://gist.github.com/afternoon/5384066/raw/00f1d23eb8a0587299e2d00528fc3657fe415d86/Prog2a.dat">example data file</a>, which has the sample input and some more stuff. Running the program will yield a Prog2a.out file containing the result.</p>

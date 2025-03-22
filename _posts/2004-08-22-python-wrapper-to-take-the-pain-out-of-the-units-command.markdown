---
layout: post
title: Python wrapper to take the pain out of the units command
date: '2004-08-22T20:04:01+01:00'
tags: []
tumblr_url: https://aftnn.org/post/47880504452/python-wrapper-to-take-the-pain-out-of-the-units-command
---
<style type="text/css">
<!--
.Keyword { color: #0000d4; }
.Statement { color: #008000; }
.Special { color: #008000; }
pre { color: #000000; background-color: #ffffff; }
body { color: #000000; background-color: #ffffff; }
.Comment { color: #666666; }
.Normal { color: #000000; background-color: #ffffff; }
.Constant { color: #f20884; }
.PreProc { color: #a020f0; }
-->
</style>
<pre>
#!/usr/bin/python

"""Wrap the standard Unix units command but do the calculation as well.
Arguments are the amount, the from-unit and the to-unit"""

import os, sys

a = sys.argv
if (len(a) &lt; 4):
    print "usage: convert.py quantity from-units to-units"
    sys.exit()

cmd = "/usr/bin/units"
pipe = os.popen("%s -q %s %s" % (cmd, a[2], a[3]))

try:
    numberpart = lambda x: float(x.readline().strip()[2:])
    mult, div = numberpart(pipe), numberpart(pipe)
    print "%0.3f %s = %0.3f %s" % \
            (float(a[1]), a[2], float(a[1]) * mult, a[3])

except ValueError, e:
    message = str(e).split(":")
    unit = message[len(message) - 1].split(" ")
    print "Unknown unit: \"%s\"" % unit[len(unit) - 1].strip()[1:-1]
</pre>

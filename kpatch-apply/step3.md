# Applying a Kernel Live Patch

You could now install the specific kpatch-patch package you discovered from the
previous step.  However, if you were wanting to do this action on a population
of systems, which may each be running a different kernel (because of where they
are in your normal population maintenance, perhaps).  Instead, Red Hat
recommends using a yum install or update command that embeds a uname -r
command to dynamically determine the running kernel version and utilize it
when making the decision of which kpatch to install:

`yum -y install "kpatch-patch = $(uname -r)"`{{execute}}

<pre class="file">
<< OUTPUT ABRIDGED >>

=========================================================
 Package                          Architecture    Version
=========================================================
Installing:
 kpatch-patch-4_18_0-305          x86_64          1-1.el8

Transaction Summary
=========================================================
Install  1 Package

<< OUTPUT ABRIDGED >>
</pre>

The previous `yum` command, based on the result of the embedded uname -r
command, installed kpatch-patch-4_18_0-305-1-1.el8, which is what you had 
determined on the previous step to be the patchset for this system.

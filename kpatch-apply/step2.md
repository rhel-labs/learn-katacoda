# Determine what Live Kernel Patches are available

When Live Kernel Patches are applied to the kernel, functions within the
kernel are re-routed from their initial instructions to instead use the
functions provided by the kpatch.  The following diagram provides a bit
more detail on how this process operates.

![Web Console Login](/rhel-labs/scenarios/kpatch-apply/assets/rhel_kpatch_overview.png)

This means that a kpatch is produced and tied to a specific version of the 
kernel.  Before you look at available kernel patches, you should first know 
the version of the kernel running on your target system.

`uname -r`{{execute}}

<pre class=file>
4.18.0-147.el8.x86_64
</pre>

Our lab system is running kernel version (also known as release, hence the -r 
option used by uname) 4.18.0-147.el8.x86_64.

Now that you know the version of the kernel running on the lab machine, look
at all of the aviailable kpatch packages avaiable from the Red Hat Enterprise
Linux repos.

`yum list available kpatch-patch*`{{execute}}

<pre class='file'>
<< OUTPUT ABRIDGED >>

kpatch-patch-4_18_0-147.x86_64                                     1-4.el8                                   rhel-8-for-x86_64-baseos-rpms
kpatch-patch-4_18_0-147_0_2.x86_64                                 0-0.el8_1                                 rhel-8-for-x86_64-baseos-rpms
kpatch-patch-4_18_0-147_0_3.x86_64                                 0-0.el8_1                                 rhel-8-for-x86_64-baseos-rpms
kpatch-patch-4_18_0-147_3_1.x86_64                                 0-0.el8_1                                 rhel-8-for-x86_64-baseos-rpms
kpatch-patch-4_18_0-147_5_1.x86_64                                 0-0.el8_1                                 rhel-8-for-x86_64-baseos-rpms

</pre>

From the above output, there are five different kpatch-patch patches available,
but only one of them is the one intended for the kernel running on your system.
The one needed for your system is `kpatch-patch-4_18_0-147.x86_64` because the
version information included in the kpatch-patch package matches the version
of your kernel reported by `uname -r`, specifically, 4.18.0-147.

The second kpatch-patch package listed, `kpatch-patch-4_18_0-147_0_2.x86_64` is
for another kernel, specifically, version 4.18.0-147.0.2.  You can see that
the additional listings are also for addtional kernel releases, __not__ the one
running on your system.  

In the next step, you will be applying the kpatch available for your system
to the kernel.

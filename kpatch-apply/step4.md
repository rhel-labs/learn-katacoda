# Verifying a Kernel Live Patch

To validate that you have properly applied the Kernel Live Patch, run the
same `kpatch list` command you ran on the first step.  You will notice that
this time the output is no longer blank.

`kpatch list`{{execute}}

<pre class="file">

Loaded patch modules:
kpatch_4_18_0_147_1_4 [enabled]

Installed patch modules:
kpatch_4_18_0_147_1_4 (4.18.0-147.el8.x86_64)

</pre>

From the list output, you can see that the kpatch installed in the previous
step has been applied to the system and is enabled.  Now, your system has
been updated to resolve the Critical CVEs in the systems running kernel.

On the next step, you will look deeper into the patch to see what CVEs were
resolved with the applied kpatch and where to find additional information
from Red Hat on these CVEs and mitigations.

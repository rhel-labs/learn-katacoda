Install nodejs version 8.

`yum -y module install nodejs:8`{{execute}} 

After the installation is complete, verify that nodejs version 8 is installed on the system.

`yum module list nodejs`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                Stream             Profiles                                               Summary
nodejs              10 [d]             development, minimal, s2i, default [d]                 Javascript runtime
nodejs              8 [e]              development, minimal, s2i, default [d] [i]             Javascript runtime

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

Notice that version 8 is now marked as [e]nabled under the Stream column and is flagged as [i]nstalled in the Profiles column of the listing for nodejs.

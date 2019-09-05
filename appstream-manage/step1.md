Determine the available versions of postgresql.

`yum module list postgresql`{{execute}}

<pre class=file>
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d]              client, default [d]              postgresql module
postgresql           9.6                 client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed

</pre>

There are two versions of postgresql available as modules in the Application Stream, version 9.6 and version 10.   

postgresql version 10 is set as the default, meaning if someone installed postgresql with no specific options or arguments, version 10 would be the one installed.


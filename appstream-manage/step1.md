Determine the available versions of postgresql.

`yum module list postgresql`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>

Red Hat Enterprise Linux 8 for x86_64-AppStream (RPMs)
Name                 Stream         Profiles           
postgresql           9.6            client, server [d]
postgresql           10 [d]         client, server [d]
postgresql           12             client, server [d]
postgresql           13             client, server [d]

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>

There are four versions of postgresql available as modules in the Application Stream, version 9.6, version 10, version 12, and version 13.   

postgresql version 10 is set as the default, meaning if someone installed postgresql with no specific options or arguments, version 10 would be the one installed.


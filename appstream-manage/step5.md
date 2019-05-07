Now that the Postgres version 10 stream is enabled, install it on the system.

`yum -y module install postgresql:10`{{execute}}

The Postgres 10 stream should now be listed as [i]nstalled.

`yum module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream Beta (RPMs)
Name                 Stream              Profiles                         Summary
postgresql           10 [d][e]           client, default [d] [i]          postgresql module
postgresql           9.6                 client, default [d]              postgresql module

Hint: [d]efault, [e]nabled, [x]disabled, [i]installed
</pre>

Finally, check the version reported by the postgres command.

`postgres --version`{{execute}}

<pre class="file">
postgres (PostgreSQL) 10.6
</pre>

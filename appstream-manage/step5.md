Now that the Postgres version 10 stream is enabled, install it on the system.

`yum -y module install postgresql:10`{{execute}}

The Postgres 10 stream should now be listed as [i]nstalled.

`yum module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
Name                      Stream                   Profiles                              Summary
postgresql                9.6                      client, server [d]                    PostgreSQL server and client module
postgresql                10 [d][e]                client, server [d] [i]                PostgreSQL server and client module
postgresql                12                       client, server [d]                    PostgreSQL server and client module

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>

Finally, check the version reported by the postgres command.

`postgres --version`{{execute}}

<pre class="file">
postgres (PostgreSQL) 10.14
</pre>

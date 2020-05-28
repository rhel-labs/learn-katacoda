Determine the available versions of postgresql.

`yum module list postgresql`{{execute}}

<pre class=file>
ed Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
Name                        Stream                  Profiles                           Summary
postgresql                  9.6                     client, server [d]                 PostgreSQL server and client module
postgresql                  10 [d]                  client, server [d]                 PostgreSQL server and client module
postgresql                  12                      client, server [d]                 PostgreSQL server and client module

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>

There are three versions of postgresql available as modules in the Application Stream, version 9.6, version 10, and version 12.   

postgresql version 10 is set as the default, meaning if someone installed postgresql with no specific options or arguments, version 10 would be the one installed.


Prior to installing the newer version of postgresql that is available, first, the older (now removed) version of the software
should be disabled.

`yum -y module disable postgresql:9.6`{{execute}}

Likewise, version 10, while it is the default, should be enabled.

`yum -y module enable postgresql:10`{{execute}}

Take a look at the Application Stream information to verify that postgresql version 10 is now the enabled
version.

`yum  module list postgresql`{{execute}}

<pre class="file">
Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
Name                       Stream                    Profiles                           Summary
postgresql                 9.6                       client, server [d]                 PostgreSQL server and client module
postgresql                 10 [d][e]                 client, server [d]                 PostgreSQL server and client module
postgresql                 12                        client, server [d]                 PostgreSQL server and client module

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>

The [e]nabled flag is now present for postgresql version 10.

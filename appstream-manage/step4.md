When postgresql version 9.6 was installed the enabled flag, [e], moved to apply
to that version of the application stream.  The other versions of postgresql 
available as application streams are not active on this machine while version 
9.6 is enabled.  This is to ensure administrators do not 
accidentally remove or install other versions of the software unintentionally.

However, you want to move to postgresql version 10.  First, you will disable 
the postgresql application streams.

`yum -y module disable postgresql`{{execute}}

Now that no application streams for postgresql are available, you will enable the version you want to install on the machine.

`yum -y module enable postgresql:10`{{execute}}

You should now be able to review the list of postgresql application streams and see that the desired version, 10, is now enabled, making it available to be installed on the machine.

`yum module list postgresql`{{execute}}

<pre class="file">
<< OUTPUT ABRIDGED >>
Red Hat Enterprise Linux 8 for x86_64-AppStream (RPMs)

Name                 Stream         Profiles          
postgresql           9.6            client, server [d]
postgresql           10 [d][e]      client, server [d]
postgresql           12             client, server [d]
postgresql           13             client, server [d]

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>


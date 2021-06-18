To support the web application deployed on this machine, install postgresql version 9.6.

`yum -y module install postgresql:9.6`{{execute}} 

After the installation is complete, verify that postgresql version 9.6 is installed on the system.

`yum module list postgresql`{{execute}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Red Hat Enterprise Linux 8 for x86_64-AppStream (RPMs)
Name                Stream         Profiles              
postgresql          9.6 [e]        client, server [d] [i]
postgresql          10 [d]         client, server [d]    
postgresql          12             client, server [d]    
postgresql          13             client, server [d]    

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
</pre>

Notice that version 9.6 is now marked as [e]nabled under the Stream column and is flagged as [i]nstalled in the Profiles column of the listing for postgresql.

Finally, run the postgres command to inspect the version it reports.
`postgres --version`{{execute}}
<pre class=file>
postgres (PostgreSQL) 9.6.22
</pre>

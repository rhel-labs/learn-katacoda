# Columnstore Indexes in SQL Server

> Columnstore indexes in SQL Server gives great performance to queries that scan large sets of rows (millions of rows typically), and also provides huge savings in storage space. Typical compression rates can be 90%. They are best used for analytics queries, and are default for many data warehouse schemas. 

In our query example, we are 

Check the currently active tuned profile
`tuned-adm active`{{execute}}

<pre class="file">
TBD
</pre>

List all the tuned profiles that can be set
`tuned-adm list`{{execute}}

<pre class="file">
TBD
</pre>

Install the tuned profile for Microsoft SQL Server (tuned-profiles-mssql), which can be used to optimize tuning for decision support workloads
`yum install tuned-profiles-mssql`{{execute}}

<pre class="file">
TBD
</pre>

Again, list all the tuned profiles that can be set
`tuned-adm list`{{execute}}

<pre class="file">
TBD
</pre>

Notice that MSSQL tuned profile is now available and can be used.

Updates to the mssql tuned profile optimize tuning for decision support workloads
`tuned-adm profile mssql`{{execute}}

<pre class="file">
TBD
</pre>

You can now verify that the tuned profile for MSSQL, has been applied to the system.    
`tuned-adm active`{{execute}}

<pre class="file">
TBD
</pre>

If you are interested in more details about the RHEL tuned profiles that ship with Red Hat Enterprise Linux 8:    
`man tuned-adm`{{execute T1}}

<pre class="file">
TBD
</pre>


`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -Q "RESTORE FILELISTONLY FROM DISK= '/var/opt/mssql/backup/WW.bak'" | tr -s ' ' | cut -d ' ' -f 1-2`{{execute}}

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -Q "RESTORE DATABASE WideWorldImporters FROM DISK = '/var/opt/mssql/backup/WW.bak' WITH MOVE 'WWI_Primary' TO '/var/opt/mssql/data/WideWorldImporters.mdf', MOVE 'WWI_UserData' TO '/var/opt/mssql/data/WideWorldImporters_userdata.ndf', MOVE 'WWI_Log' TO '/var/opt/mssql/data/WideWorldImporters.ldf', MOVE 'WWI_InMemory_Data_1' TO '/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1'"`{{execute}}



The Chief Security Officer sends out the following e-mail:
<pre class="file">
Database and Infrastructure Administrators,

I recently returned from an industry security conference, and at that
conference, I learned of some recommended security industry practices
that our Applications and services should be using.  Specifically, we
should disable some less-secure encryption algorithms and enforce some
minimum strength used by others.

Those of you that have applications and services that utilize asymmetric
encryption through RSA based certificates, your certificates should use
at least a 3072 bit public key for their cipher.

Additionally, please ensure that sensitive data in databases is encrypted 
at rest for additional protection.

-CSO
</pre>

As it happens, these requirements can be configured and enforced using
system-wide cryptographic policies that come with Red Hat Enterprise Linux, and 
additional database security controls like TDE in SQL Server.

In order to comply with the new organization policy, you will update the 
system to use the **FUTURE** cryptographic policy.  Changing to the **FUTURE** 
policy will configure the cryptography libraries and services used on the
machine or by applications running on the machine such that they comply with
the requirements set forth by the Chief Security Officer above.   

`update-crypto-policies --set FUTURE`{{execute T1}}

<pre class="file">
Setting system policy to FUTURE
Note: System-wide crypto policies are applied on application start-up.
It is recommended to restart the system for the change to policies
to fully take place.
</pre>

You can now verify that the new policy, FUTURE, has been applied to the system.    

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
FUTURE
</pre>

If you are interested in more details about the cryptographic policies that
ship with Red Hat Enterprise Linux 8:    

`man crypto-policies`{{execute T1}}

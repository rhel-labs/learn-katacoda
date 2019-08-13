# Reconcile service issues

You will need to restart the Microsoft SQL Server service after changing the system-wide
crypto policy so that it runs under the new policy.   

> **NOTE:** Red Hat recommends rebooting the system for all services to be
initialized with the new cryptographic policy, however, for this exercise you
will be individually working with Microsoft SQL Server.

`systemctl restart mssql-server.service`{{execute T1}}

Now that SQL Server has restarted, let's try connecting to it using -N option of sqlcmd to 
indicate that we want to request an encrypted connection to the server.

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -N`{{execute T1}}

<pre class="file">
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] SSL Library Error: error: 140AB18F: SSL routines: SSL_CTX_use_certificate:ee key too small
</pre>

> **NOTE:** Your log date, time, process ID, or other metadata may be different.  The important part is the message at the end of the entries.

Due to the new FUTURE policy, RSA certificates now require a public key of at least 3072 bits.
The FUTURE system-wide crypto policy is stopping sqlcmd from establishing a connection with the 
server since running with the existing server certificate, and public key, would violate the policy
settings.  In the next steps, you will resolve this issue.

# Validate the Environment
Using the provided system terminal session, validate the initial environment.

First, verify the current system-wide cryptographic policy.

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
DEFAULT
</pre>

The default configuration on Red Hat Enterprise Linux for the system-wide
cryptographic policy (sometimes referred to as "crypto policy") is a
policy named `DEFAULT`.

Secure Socket Layer (SSL) is one of the cryptography methods managed by
the system-wide cryptography policy.  Throughout the exercise, you will
work with SQL Server as it is a service that utilizes SSL.  Hence, changes
to how SSL is managed will potentially impact those services that utilize
those cryptography frameworks.

Verify that SQL Server is running on the machine.

`systemctl status mssql-server.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

By default, SQL Server does not encrypt connections unless specified by client or configured on the server
using the forceencryption setting. You can verify that the connection is not encrypted by querying the
system DMV in SQL Server(sys.dm_exec_connections).

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -Q "select session_id, encrypt_option from sys.dm_exec_connections where session_id = @@spid"`{{execute T1}}

<pre class="file">
session_id  encrypt_option
----------- ----------------------------------------
         XX FALSE
</pre>

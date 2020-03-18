# Connect to SQL Server and Query Data

Now that the service certificates comply with the policy, the client should be able to connect
without any issue, and the connection should be encrypted

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -N -C -Q "select session_id, encrypt_option from sys.dm_exec_connections where session_id = @@spid"`{{execute T1}}

<pre class="file">
session_id  encrypt_option
----------- ----------------------------------------
         XX TRUE

(1 rows affected)
</pre>

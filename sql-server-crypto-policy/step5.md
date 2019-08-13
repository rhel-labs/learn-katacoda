# Connect to SQL Server with updated certificate

Chmod the key files so that the mssql user can access it
`chmod 444 mssql.pem mssql.key`{{execute T1}} 

Move the files into the respective folders for SQL Server to access
`mkdir /etc/ssl/private/`{{execute T1}} 
`mv mssql.key /etc/ssl/private/`{{execute T1}} 
`mv mssql.pem /etc/ssl/certs/`{{execute T1}} 

Tune SQL Server configuration to read the new key files, and force encryption only from client
`/opt/mssql/bin/mssql-conf set network.tlscert /etc/ssl/certs/mssql.pem`{{execute T1}} 
`/opt/mssql/bin/mssql-conf set network.tlskey /etc/ssl/private/mssql.key`{{execute T1}} 
`/opt/mssql/bin/mssql-conf set network.forceencryption 0`{{execute T1}} 

Restart SQL Server
`systemctl restart mssql-server.service`{{execute T1}}

Now that the service certificates comply with the policy, the client should be able to connect
without any issue, and the connection should be encrypted

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 1Password! -N -C -Q "select session_id, encrypt_option from sys.dm_exec_connections where session_id = @@spid"`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Wed 2019-07-17 09:54:40 EDT; 2s ago

<< OUTPUT ABRIDGED >>
</pre>

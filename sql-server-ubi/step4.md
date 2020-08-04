# Connect to SQL Server running in the container

Get the ID of the container running SQL Server
`CONTAINER=$(podman ps -a | grep server | cut -c1-12)`{{execute T3}}

Launch an interactive bash shell in the container
`podman exec -it $SERVER_CONTAINER "/bin/bash"`{{execute T3}}

Once inside the container, verify that SQL Server is running 

`systemctl status mssql-server.service --no-pager`{{execute T3}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

Connect  with **sqlcmd** and run the @@version T-SQL statement to get the version of the running SQL Server 

> **NOTE:** sqlcmd is not in the path by default, so you have to specify the full path

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -Q "select @@version"`{{execute T3}}
 
<pre class="file">
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Microsoft SQL Server 2019 (RTM-CU5) (KB4552255) - 15.0.4043.16 (X64)
        Jun 10 2020 18:25:25
        Copyright (C) 2019 Microsoft Corporation
        Developer Edition (64-bit) on Linux (Red Hat Enterprise Linux 8.2 (Ootpa)) <X64>

(1 rows affected)
</pre>

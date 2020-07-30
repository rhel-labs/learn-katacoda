# Deploy and configure SQL Server

In *Terminal Server* tab of the lab interface, create a container runtime using podman which -
passes in-container accesses to /var/opt/mssql/data directory through to the host's /var/mssql/data
directory, and binds the host's port 1433 to pass traffic to the container's port 1433.

`CONTAINER=$(podman run -v /var/mssql/data:/var/opt/mssql/data:Z -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=RedHat1!' -p 1433:1433 -it mcr.microsoft.com/mssql/rhel/server:2019-latest)`{{execute T2}}

<pre class="file">
TBD
</pre>


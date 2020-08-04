# Deploy and configure SQL Server

In *Terminal Server* tab of the lab interface, create a container runtime using podman which -
passes in-container accesses to /var/opt/mssql/data directory through to the host's /var/mssql/data
directory, and binds the host's port 1433 to pass traffic to the container's port 1433.

Pass in the flag to programatically accept the EULA agreement, and setup SQL Server with the provided sa account password 

`podman run -v /var/mssql/data:/var/opt/mssql/data:Z -v /var/mssql/log:/var/opt/mssql/log:Z -v /var/mssql/secrets:/var/opt/mssql/secrets:Z -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=RedHat1!' -p 1433:1433 -it mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T2}}

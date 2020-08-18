# Deploy and configure multiple SQL Server instances

In *Terminal Server* tab of the lab interface, create a shell as the __rhel__ user so that we can deploy the container using
a non-root user.

Recall that the __rhel__ user's password is __redhat__.

`ssh rhel@localhost`{{execute T2}}

Create a container runtime using podman which - passes in-container accesses to /var/opt/mssql directories through to 
the host's /var/mssql directories, and port mapping the host ports (1401 and 1402) to the container's port (1433). 
TCP port *1433* is the default port for SQL Server.

Pass in the flag to programatically accept the EULA agreement, and setup SQL Server with the provided sa account password. 
Set the hostname of the container to *mssqlcontainer*

`podman run --name mssqlDB1 --hostname=mssqlcontainer1 -d -v /var/mssqlDB1/data:/var/opt/mssql/data -v /var/mssqlDB1/log:/var/opt/mssql/log -v /var/mssqlDB1/secrets:/var/opt/mssql/secrets -v /var/mssql/scripts:/var/opt/mssql/scripts -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=RedHat1!' --cap-add cap_net_bind_service -p 1401:1433 -it mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T2}}

Similarly, repeat the command to spin up database instance 2 of SQL Server by passing through in-container access to the appropriate 
host directories, and host port (1402) to podman. Set the hostname of the container to *mssqlcontainer2*

`podman run --name mssqlDB2 --hostname=mssqlcontainer2 -d -v /var/mssqlDB2/data:/var/opt/mssql/data -v /var/mssqlDB2/log:/var/opt/mssql/log -v /var/mssqlDB2/secrets:/var/opt/mssql/secrets -v /var/mssql/scripts:/var/opt/mssql/scripts -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=RedHat1!' --cap-add cap_net_bind_service -p 1402:1433 -it mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T2}}

> **NOTE:** We have instantiated the container runtime using a non-root *rhel* user.

Get the top 2 lines of the container logs for database instance 1

`podman logs -t mssqlDB1 | head -2`{{execute T2}}

<pre class="file">
SQL Server 2019 will run as non-root by default.
This container is running as user mssql.
<< OUTPUT ABRIDGED >>
</pre>

Get the top 2 lines of the container logs for database instance 2

`podman logs -t mssqlDB2 | head -2`{{execute T2}}

<pre class="file">
SQL Server 2019 will run as non-root by default.
This container is running as user mssql.
<< OUTPUT ABRIDGED >>
</pre>


> **NOTE:** In SQL Server 2019, the container runs using a non-root user by default. The default user is mssql. In step 1, we changed user ownership of the /var/mssql directories to uid:10001 that maps to the mssql user. 

Now, the container is spinned up using a non-root user (*rhel*), and SQL Server running inside the container is also running using non-root (*mssql*) user.

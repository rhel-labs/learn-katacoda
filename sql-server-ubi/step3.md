# Deploy and configure SQL Server

In *Terminal Server* tab of the lab interface, create a shell as the __rhel__ user so that we can deploy the container using
a non-root user.

Recall that the __rhel__ user's password is __redhat__.

`ssh rhel@localhost`{{execute T2}}

Create a container runtime using podman which - passes in-container accesses to /var/opt/mssql directories through to 
the host's /var/mssql directories, read-only access to the hosts /sys/fs/cgroup directory, and port mapping the host port (1433) to the container's port (1433). TCP port *1433* is the default port for SQL Server.

Pass in the flag to programatically accept the EULA agreement, and setup SQL Server with the provided sa account password. Set the hostname of 
the container to *mssqlcontainer*

`podman run --name mssqlDB1 --hostname=mssqlcontainer -d -v /var/mssql/data:/var/opt/mssql/data -v /var/mssql/log:/var/opt/mssql/log -v /var/mssql/secrets:/var/opt/mssql/secrets -v /var/mssql/scripts:/var/opt/mssql/scripts -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=RedHat1!' --cap-add cap_net_bind_service -p 1433:1433 -it mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T2}}

> **NOTE:** We have instantiated the container runtime using a non-root *rhel* user.

Get the top 2 lines of the container logs 

`podman logs -t mssqlDB1 | head -2`{{execute T2}}

<pre class="file">
SQL Server 2019 will run as non-root by default.
This container is running as user mssql.
<< OUTPUT ABRIDGED >>
</pre>

> **NOTE:** In SQL Server 2019, the container runs using a non-root user by default. The default user is mssql. In step 1, we changed user ownership of the /var/mssql directories to uid:10001 that maps to the mssql user. 

Now, the container is spinned up using a non-root user (*rhel*), and SQL Server running inside the container is also running using non-root (*mssql*) user.

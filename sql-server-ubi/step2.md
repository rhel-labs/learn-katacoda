# Download the Microsoft SQL Server container image

With the new container image for SQL Server on Linux for RHEL 8  from Microsoft, you get the reliability, security features, and performance of SQL Server running fully supported on RHEL regardless of whether you are running on baremetal or virtual servers in private or public clouds.

In the context of the *rhel* user, use *podman* to get the container image that includes SQL Server. The server image also includes the client tools necessary to connect to SQL Server.

`podman pull mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T1}}

Verify that the SQL Server container image is now available on the host system

`podman images`{{execute T1}}

In the output, you will notice that the SQL Server container image is downloaded and available for use

<pre class="file">
REPOSITORY                            TAG           IMAGE ID       CREATED       SIZE
mcr.microsoft.com/mssql/rhel/server   2019-latest   9ab439659123   6 weeks ago   1.59 GB
</pre>

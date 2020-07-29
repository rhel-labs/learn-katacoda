# Download the Microsoft SQL Server container image

With Microsoft’s new SQL Server container for Linux built using RHEL UBI, you can now take 
advantage of the reliability, security features, and performance of SQL Server running in 
official Red Hat container images wherever OCI-compliant Linux containers run whether on 
baremetal servers, public and private clouds, or virtualized infrastructure.  

Use *podman* to get the container image that includes SQL Server

`podman pull mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T1}}

SQL Server client tools provide the necessary command line tools like *sqlcmd* to connect to
and administer SQL Server. These tools are made available in a separate container.Use *podman* 
to get the container image that contains SQL Server client tools

`podman pull mcr.microsoft.com/mssql-tools`{{execute T1}}

Verify that the SQL Server and client tool container images are now available on the host system

`podman images`{{execute T1}}

In the output, you will notice that there are 3 container images available for use.

<pre class="file">
REPOSITORY                            TAG           IMAGE ID       CREATED       SIZE
mcr.microsoft.com/mssql/rhel/server   2019-latest   9ab439659123   6 weeks ago   1.59 GB
localhost/rhel8-httpd                 latest        69aac470f62d   7 weeks ago   617 MB
mcr.microsoft.com/mssql-tools         latest        bc2b6cd40cb9   2 years ago   224 MB
</pre>

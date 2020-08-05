# Download the Microsoft SQL Server container image

With Microsoft’s new SQL Server container for Linux built using RHEL UBI, you can now take 
advantage of the reliability, security features, and performance of SQL Server running in 
official Red Hat container images wherever OCI-compliant Linux containers run whether on 
baremetal servers, public and private clouds, or virtualized infrastructure.  

Use *podman* to get the container image that includes SQL Server. The server image also includes the client tools necessary to connect to SQL Server.

`podman pull mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T1}}

Verify that the SQL Server container image is now available on the host system

`podman images`{{execute T1}}

In the output, you will notice that the SQL Server container image is downloaded and available for use

<pre class="file">
REPOSITORY                            TAG           IMAGE ID       CREATED       SIZE
mcr.microsoft.com/mssql/rhel/server   2019-latest   9ab439659123   6 weeks ago   1.59 GB
localhost/rhel8-httpd                 latest        69aac470f62d   7 weeks ago   617 MB
</pre>

# Download the Microsoft SQL Server container image

Microsoft has made available official container images for the SQL Server and client tools

Use *podman* to get the container image that includes SQL Server

`podman pull mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T1}}

Next, use *podman* to get the container image that includes client tools

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

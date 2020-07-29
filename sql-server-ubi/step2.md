# Download the Microsoft SQL Server container image

Microsoft has made available official container images for the SQL Server and client tools

Use *podman* to get the container image that includes SQL Server

`podman pull mcr.microsoft.com/mssql/rhel/server:2019-latest`{{execute T1}}

Next, use *podman* to get the container image that includes client tools

`podman pull mcr.microsoft.com/mssql-tools`{{execute T1}}

Verify that the SQL Server and client tool container images are now available on the host system

`podman images`{{execute T1}}


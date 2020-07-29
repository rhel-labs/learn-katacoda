# Verify the environment

> **NOTE:** In this scenario we assume that you understand the fundamentals about UBI and RHEL container tools.

On the host system, create a directory to persist the SQL Server database files

`mkdir -p /var/mssql/data`{{execute T1}}

Now modify and set the appropriate permissions for the created directory

`chmod 755 -R /var/mssql/data`{{execute T1}}

Use *podman* to list the container images available on the host system

`podman images`{{execute T1}}

Now that you have verified that podman is available on the host system, use it to download SQL Server container 
images.

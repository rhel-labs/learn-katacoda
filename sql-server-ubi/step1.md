# Verify the environment

Today hundreds of developers now offer their software in freely redistributable containers. Microsoft 
has leveraged RHEL UBIs, and released SQL Server 2019 for Linux as a UBI 8 container. In this lab, we
will demonstrate how you can use these available images using RHEL container tools.

> **NOTE:** In this scenario we assume that you understand the fundamentals about UBI and RHEL container tools. If you are not familiar with RHEL container tools (such as *podman*), you should consider reviewing the [Podman lab](https://lab.redhat.com/podman-deploy)

There are 3 terminal tabs that will be used in this lab - a terminal on the container host (indicated by *Terminal*), a terminal where we will run the SQL Server container (indicated by *Terminal SQL Server*), and a terminal where we will run the SQL Server client tools (indicated by *Terminal SQL Client*)

On the host system, create a directory to persist the SQL Server database, log and secrets

`mkdir -p /var/mssql/data; mkdir -p /var/mssql/log; mkdir -p /var/mssql/secrets`{{execute T1}}

On the host system, create another directory to store the script to be used for SQL Server Pubs database

`mkdir -p /var/mssql/scripts`{{execute T1}}

Move the script file from the /root directory to the newly created scripts directory

`mv ./InstPubs.sql /var/mssql/scripts/`{{execute T1}}

Now modify and set the appropriate user ownership for the directory to uid:10001 (the mssql default user uid) 

`chown -R 10001:0 /var/mssql/data; chown -R 10001:0 /var/mssql/log; chown -R 10001:0 /var/mssql/secrets; chown -R 10001:0 /var/mssql/scripts`{{execute T1}}

Use *podman* to list the container images available on the host system

`podman images`{{execute T1}}

Now that you have verified that podman is available on the host system, use it to download SQL Server container images.

# Verify the environment

Containers are an extremely popular way for developers to deliver software today.  They are more portable and lightweight than the VM images traditionally used to package software in the cloud,  while at the same time, more consistent and efficient to deploy and patch than traditional software packages used on-premises.  Microsoft delivers SQL Server 2019 for Linux containers which are supported on Red Hat Enterprise Linux (RHEL) 8 and OpenShift 4.  These containers are built using the Red Hat Universal Base Image (UBI) runtime.  In this lab, we will demonstrate how to deploy these images on RHEL 8.

> **NOTE:** In this scenario we assume that you understand the fundamentals about UBI and RHEL container tools. If you are not familiar with RHEL container tools (such as *podman*), you should consider reviewing the [Podman lab](https://lab.redhat.com/podman-deploy)

There are 3 terminal tabs that will be used in this lab - a terminal on the container host (indicated by *Terminal*), a terminal where we will run the SQL Server container (indicated by *Terminal SQL Server*), and a terminal where we will run the SQL Server client tools (indicated by *Terminal SQL Client*).

In this lab, we will be spinning up 2 instances of SQL Server, each running in a container. 

On the host system, create a directory to persist the SQL Server database, log and secrets for database instance 1 (or *DB1* in short)

`mkdir -p /var/mssql/dataDB1; mkdir -p /var/mssql/logDB1; mkdir -p /var/mssql/secretsDB1`{{execute T1}}

On the host system, create a directory to persist the SQL Server database, log and secrets for database instance 2 (or *DB2* in short)

`mkdir -p /var/mssql/dataDB2; mkdir -p /var/mssql/logDB2; mkdir -p /var/mssql/secretsDB2`{{execute T1}}

On the host system, create another directory to store the script to be used for SQL Server Pubs database

`mkdir -p /var/mssql/scripts`{{execute T1}}

Move the script file from the /root directory to the newly created scripts directory

`mv ./InstPubs.sql /var/mssql/scripts/`{{execute T1}}

Now modify and set the appropriate user ownership for the directories created to uid:10001 (the *mssql* default user uid)  

`chown -R 10001:0 /var/mssql/dataDB1; chown -R 10001:0 /var/mssql/logDB1; chown -R 10001:0 /var/mssql/secretsDB1; chown -R 10001:0 /var/mssql/scripts`{{execute T1}}

`chown -R 10001:0 /var/mssql/dataDB2; chown -R 10001:0 /var/mssql/logDB2; chown -R 10001:0 /var/mssql/secretsDB2`{{execute T1}}

Now, create a shell as the __rhel__ user so that we don't use root privileges for the podman commands.

Recall that the __rhel__ user's password is __redhat__.

`ssh rhel@localhost`{{execute T1}}

Use *podman* to list the container images available on the host system

`podman images`{{execute T1}}

<pre class="file">
REPOSITORY              TAG      IMAGE ID       CREATED       SIZE
</pre>

*Podman* is available on the host system, and there are no images available in the local podman repository.

To run SQL Server in a container, download the SQL Server container images.

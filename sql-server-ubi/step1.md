# Verify the environment

Containers are an extremely popular way for developers to deliver software today.  They are more portable and lightweight than the VM images traditionally used to package software in the cloud,  while at the same time, more consistent and efficient to deploy and patch than traditional software packages used on-premises.  Microsoft delivers SQL Server 2019 for Linux containers which are supported on Red Hat Enterprise Linux (RHEL) 8 and OpenShift 4.  These containers are built using the Red Hat Universal Base Image (UBI) runtime.  In this lab, we will demonstrate how to deploy these images on RHEL 8.

> **NOTE:** In this scenario we assume that you understand the fundamentals about UBI and RHEL container tools. If you are not familiar with RHEL container tools (such as *podman*), you should consider reviewing the [Podman lab](https://lab.redhat.com/podman-deploy)

There are 3 terminal tabs that will be used in this lab - a terminal on the container host (indicated by *Terminal*), a terminal where we will run the SQL Server container (indicated by *Terminal SQL Server*), and a terminal where we will run the SQL Server client tools (indicated by *Terminal SQL Client*).

In this lab, we will be spinning up 3 instances of SQL Server, each running in a container. 

On the host system, create a directory to store the script to be used for SQL Server In-memory OLTP dataset

`mkdir -p /var/mssql/scripts`{{execute T1}}

Copy the script file from the /root directory to the newly created scripts directory

`cp ./imoltp.sql /var/mssql/scripts/`{{execute T1}}

> **NOTE:** In SQL Server 2019, the container runs using a non-root user by default. The default user is *mssql* with uid *10001*. Modify and 
set the appropriate user ownership for the script directory created to uid:10001 that maps to the *mssql* user. 

`chown -R 10001:0 /var/mssql/scripts`{{execute T1}}

Use *podman* to list the container images available on the host system

`podman images`{{execute T1}}

<pre class="file">
REPOSITORY              TAG      IMAGE ID       CREATED       SIZE
localhost/rhel8-httpd   latest   69aac470f62d   3 months ago   617 MB
</pre>

*Podman* is available on the host system, and there is only a single RHEL 8 apache image available to use.

To run SQL Server in a container, download the SQL Server container images.

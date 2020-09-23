# Checkpoint and restore the SQL Server container

One of Podman’s features is to be able to checkpoint and restore running containers. Podman uses CRIU (Checkpoint/Restore In Userspace) to do the actual checkpointing and restoring of the processes inside of the container. 

Install the CRIU dependency package (__criu__) that is needed for checkpoint-restore podman functionality -

`yum -y install criu`{{execute T2}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Downloading Packages:
criu-3.14-2.module+el8.2.1+6750+e53a300c.x86_64.rpm                           1.5 MB/s | 500 kB     00:00
--------------------------------------------------------------------------------------------------------------
Total                                                                         1.5 MB/s | 500 kB     00:00
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                      1/1
  Upgrading        : criu-3.14-2.module+el8.2.1+6750+e53a300c.x86_64                                      1/2
  Cleanup          : criu-3.12-9.module+el8.2.0+5029+3ac48e7d.x86_64                                      2/2
  Running scriptlet: criu-3.12-9.module+el8.2.0+5029+3ac48e7d.x86_64                                      2/2
  Verifying        : criu-3.14-2.module+el8.2.1+6750+e53a300c.x86_64                                      1/2
  Verifying        : criu-3.12-9.module+el8.2.0+5029+3ac48e7d.x86_64                                      2/2
Installed products updated.

Upgraded:
  criu-3.14-2.module+el8.2.1+6750+e53a300c.x86_64

Complete!
</pre>

After installing the criu package, create a configuration file to adjust the maximum ghost file limit. By default, 1MB is the maximum size of a deleted file that criu can handle, but in the case of SQL Server, temporary files might exceed this limit and hence the ghost-file size must be adjusted.

`echo ghost-limit = 40000000 > /etc/criu.conf`{{execute T2}}

In the *Terminal Server* tab of the lab interface, checkpoint the running SQL Server container and export the checkpoint to a compressed file

`podman container checkpoint -l --config /etc/criu.conf --export=/tmp/checkpoint1.tar.gz`{{execute T2}}

<pre class="file">
cb88e6ff3f5e671211b000c7fa4f2006951302145885d87d50e7bbadefd85f27
</pre>

At this point, confirm that there is no running container -

`podman ps`{{execute T2}}

<pre class="file">
CONTAINER ID  IMAGE  COMMAND  CREATED  STATUS  PORTS  NAMES
</pre>

Now, restore the container from the stored checkpoint file. This capability can be quite useful in the case of a migration or debugging scenario. 

`podman container restore --import=/tmp/checkpoint1.tar.gz --name mssqlserver-restored`{{execute T2}}

<pre class="file">
ea72c83f945af03d2b03fedd21c3b6743310b7cacc77d6152f453c37cc8cf56c
</pre>

Finally, verify that the container restored from the checkpoint file is running - The name of the container should be *mssqlserver-restored*

`podman ps`{{execute T2}}

<pre class="file">
CONTAINER ID  IMAGE                                            COMMAND               CREATED             STATUS                 PORTS                   NAMES
ea72c83f945a  mcr.microsoft.com/mssql/rhel/server:2019-latest  /opt/mssql/bin/sq...  About a minute ago  Up About a minute ago  0.0.0.0:1400->1433/tcp  mssqlserver-restored
</pre>

Also, notice that the port mapping matches the original port mapping (Host port *1400* maps to container port *1433*). 

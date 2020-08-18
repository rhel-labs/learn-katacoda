# Checkpoint and restore the SQL Server container

One of Podman’s features is to be able to checkpoint and restore running containers. Podman uses CRIU (Checkpoint/Restore In Userspace) to do the actual checkpointing and restoring of the processes inside of the container. 

In the *Terminal Server* tab of the lab interface, checkpoint the sql server 

`podman container checkpoint -l --export=/tmp/checkpoint1.tar.gz`{{execute T2}}

<pre class="file">
cb88e6ff3f5e671211b000c7fa4f2006951302145885d87d50e7bbadefd85f27
</pre>

At this point, confirm that there is no running container using the *podman ps* command - 

`podman ps`{{execute T2}}

<pre class="file">
CONTAINER ID  IMAGE                                            COMMAND               CREATED        STATUS        PORTS                   NAMES
</pre>

Now, restore the container from the stored checkpoint file. This capability can be quite useful in the case of a migration or debugging scenario. 

`podman container restore --import=/tmp/checkpoint1.tar.gz --name mssqlserver-restored`{{execute T2}}

<pre class="file">
TBD2
</pre>

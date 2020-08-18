# Checkpoint and restore the running SQL Server container

One of Podman’s features is to be able to checkpoint and restore running containers. Podman uses CRIU (Checkpoint/Restore In Userspace) to do the actual checkpointing and restoring of the processes inside of the container. In this case, 

`podman container checkpoint sqlserver-test --export=/tmp/checkpoint1.tar.gz`{{execute T3}}

<pre class="file">
cb88e6ff3f5e671211b000c7fa4f2006951302145885d87d50e7bbadefd85f27
</pre>


The exported checkpoint file can then be transferred to another system in the case of a migration or debugging scenario. To restore a container from a 
stored checkpoint -

`podman container restore --import=/tmp/checkpoint1.tar.gz --name mssqlserver-restored`{{execute T3}}

<pre class="file">
TBD2
</pre>

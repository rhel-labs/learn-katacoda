# Checkpoint and restore the running SQL Server container

One of Podman’s features is to be able to checkpoint and restore running containers. Podman uses CRIU (Checkpoint/Restore In Userspace) to do the actual checkpointing and restoring of the processes inside of the container. The *--leave-running* option tells podman to generate the checkpoint while keeping
the container running.

`podman container checkpoint -l --leave-running --export=/tmp/checkpoint1.tar.gz`{{execute T3}}

<pre class="file">
TBD1
</pre>

The exported checkpoint file can then be transferred to another system in the case of a migration or debugging scenario. To restore a container from a 
stored checkpoint -

`podman container restore --import=/tmp/checkpoint1.tar.gz --tcp-established`{{execute T3}}

<pre class="file">
TBD2
</pre>

The __rhel8-httpd__ container includes a bash shell.  In this step, you will
deploy the container in an interactive fashion, which will allow you to run commands within the deployed container. Use the *Terminal 1*.

`podman run -it rhel8-httpd /bin/bash`{{execute T1}}

You should now be looking at a generic bash shell prompt:
<pre class="file">
bash-4.4#
</pre>

In *Terminal 1*, the displayed shell is running inside the container image, not the host operating system.  To confirm this, take a look at the mounted filesystems:

`df -hP`{{execute T1}}

<pre class="file">
Filesystem      Size  Used Avail Use% Mounted on
overlay          17G  6.1G   11G  36% /
tmpfs            64M     0   64M   0% /dev
tmpfs           915M  9.8M  905M   2% /etc/hosts
shm              63M     0   63M   0% /dev/shm
tmpfs           915M     0  915M   0% /sys/fs/cgroup
tmpfs           915M     0  915M   0% /proc/acpi
tmpfs           915M     0  915M   0% /proc/scsi
tmpfs           915M     0  915M   0% /sys/firmware
</pre>

You will notice that all of the filesystem contents are either memory-based (tmpfs, shm) or the overlay file associated with this runtime of the container image (overlay).

Switch to *Terminal 2*.  *Terminal 2* is running on the host system.  Use this shell to verify that the container is running:

`podman ps -a`{{execute T2}}
<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED         STATUS                    PORTS                   NAMES
df54b664f133  localhost/rhel8-httpd:latest  /bin/bash             34 seconds ago  Up 33 seconds ago                                 heuristic_cray
</pre>

__Note:__ Your CONTAINER ID and NAMES will be different than the output displayed above as each container is assigned a unique ID and Name.

# KATACODA Markdown additions
More examples available on [Katacoda GitHub] (https://github.com/katacoda/scenario-examples)

EXECUTING MARKDOWN CODE BLOCKS NEEDS COMMAND AND TARGET *Terminal 1*.

`podman run -it rhel8-httpd /bin/bash`{{execute T1}}

ALLOWING MARKDOWN CODE BLOCKS TO BE COPIED TO CLIPBOARD

`podman run -it rhel8-httpd /bin/bash`{{copy}}

PASSING TO EDITOR INTERFACE REQUIRES HTML TAG:

<pre class="file">
bash-4.4#
</pre>

EXAMPLE TASK: Execute a basic command in primary terminal

In *Terminal 1*, examine the layout and available disk space on the host system:

`df -hP`{{execute T1}}

```
Filesystem      Size  Used Avail Use% Mounted on
overlay          17G  6.1G   11G  36% /
tmpfs            64M     0   64M   0% /dev
tmpfs           915M  9.8M  905M   2% /etc/hosts
shm              63M     0   63M   0% /dev/shm
tmpfs           915M     0  915M   0% /sys/fs/cgroup
tmpfs           915M     0  915M   0% /proc/acpi
tmpfs           915M     0  915M   0% /proc/scsi
tmpfs           915M     0  915M   0% /sys/firmware
```

EXAMPLE TASK: Execute a command using multiple terminals:

Switch to *Terminal 2*.  *Terminal 2* is running on the host system.  Use this shell to verify that the container is running:

`podman ps -a`{{execute T2}}

```
CONTAINER ID  IMAGE                         COMMAND               CREATED         STATUS                    PORTS                   NAMES
df54b664f133  localhost/rhel8-httpd:latest  /bin/bash             34 seconds ago  Up 33 seconds ago                                 heuristic_cray
```

__Note:__ Your CONTAINER ID and NAMES will be different than the output displayed above as each container is assigned a unique ID and Name.

# Software installation and configuration
SELinux is a technology to isolate processes/containers running on the system to mitigate attacks which take 
advantage of privilege escalation. 

>_NOTE:_ This demo assume that you have a sound understanding of SELinux basics and container fundamentals. 

Prior to getting started, we need certain packages such as Udica (which is a tool for generating 
SELinux policies for containers), and setools-console (which is a set of tools that can facilitate 
SELinux policy analysis). In this demo, the container runtime related packages are already installed.

First, install the udica and setools-console packages -

`yum install -y udica setools-console`{{execute}}

Use `podman` to list the available container images -
`podman images`{{execute}}

You should notice that there is already a container image available called **localhost/rhel8-httpd**. 
This image contains Apache server application. 

In terminal window 2, run the container using podman and open a shell inside the container and mount home and /var/spool directory 
`CONTAINERID=$(podman run -v /home:/home:ro -v /var/spool:/var/spool:rw -d -p 80:80 -it localhost/rhel8-httpd /bin/bash)`{{execute T2}}

>_NOTE:_ The home directory is mounted with read-only access, and the /var/spool/ directory is mounted with read-write access.

In terminal window 1, Check the status of the application container using podman.  

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED        STATUS           PORTS               NAMES
6fdbc37a72ef  localhost/rhel8-httpd:latest  /usr/sbin/httpd -...  2 seconds ago  Up 1 second ago  0.0.0.0:80->80/tcp  trusting_mclean
</pre>

By default, on the host RHEL system, SELinux is enabled and you can confirm this by inspecting the SELinux status. Also, confirm that the enabled mode
is set to enforcing.

`sestatus`{{execute T1}}

<pre class="file">
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
<< OUTPUT ABRIDGED >>
</pre>

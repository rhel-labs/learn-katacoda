# Software installation and configuration
SELinux is a technology to isolate processes/containers running on the system to mitigate attacks which take 
advantage of privilege escalation. Udica is a new tool which complements the containers tools (Podman, Skopeo, Buildah, etc.) 
family supported by Red Hat to help improve the security of customers container environments.

>_NOTE:_ This lab assumes that you have a sound understanding of SELinux basics and container fundamentals. 

Prior to getting started, we need certain packages such as Udica (which is a tool for generating 
SELinux policies for containers), and setools-console (which is a set of tools that can facilitate 
SELinux policy analysis). In this demo, the container runtime related packages are already installed.

There are 2 terminal tabs that will be used in this lab - a terminal on the container host (indicated by *Terminal*), and a second terminal 
where we will run the container (indicated by *Terminal 2*).

Install the udica and setools-console packages on the container host

`yum install -y udica setools-console`{{execute T1}}

Get the latest RHEL8 UBI image 
`podman pull registry.access.redhat.com/ubi8/ubi:latest`{{execute T1}}

Use `podman` to list the available container images 

`podman images`{{execute T1}}

In 'Terminal 2' tab of the lab interface, create a container runtime using podman which -
passes in-container accesses to /home through to the host's /home read-only, passes in-container 
accesses to /var/spool through to the host's /var/spool read-write, and binds the 
host's port 80 to pass traffic to the container's port 80.

`CONTAINER=$(podman run -v /home:/home:ro -v /var/spool:/var/spool:rw -d -p 80:80 -it registry.access.redhat.com/ubi8/ubi)`{{execute T2}}

>_NOTE:_ The home directory is mounted with read-only access, and the /var/spool/ directory is mounted with read-write access.

In the 'Terminal' tab of the lab interface, check the status of the application container using podman and get the running container id 

`podman ps; CONTAINERID=$(podman ps | grep registry.access.redhat.com | cut -b 1-12)`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED        STATUS           PORTS               NAMES
e47a11d3e2c5  registry.access.redhat.com/ubi8/ubi:latest  /bin/bash  3 seconds ago  Up 2 seconds ago0.0.0.0:80->80/tcp  naughty_golick
</pre>

When using SELinux, container processes get assigned a container type called 'container_t'. Verify the SELinux type assigned to the running container

`ps -eZ | grep container_t`{{execute T1}}

<pre class="file">
system_u:system_r:container_t:s0:c182,c1016 25755 pts/0 00:00:00 bash
</pre>

On Red Hat Enterprise Linux, SELinux is enabled by default and in enforcing mode.  You can confirm this by inspecting the output of `sestatus` 
on the system.

`sestatus`{{execute T1}}

<pre class="file">
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
<< OUTPUT ABRIDGED >>
</pre>

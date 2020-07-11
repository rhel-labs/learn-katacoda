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

Now, in terminal window 2, run the container using podman and open a shell inside the container
`podman run -d -p 80:80 -it localhost/rhel8-httpd bash`{{execute T2}}

<pre class="file">
f4d9db69e9b512517f9490d3bcc5096e69cca5e9b3a50b3890430da39ae46573
</pre>

In terminal window 1, Check the status of the application container using podman.  

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED        STATUS           PORTS               NAMES
6fdbc37a72ef  localhost/rhel8-httpd:latest  /usr/sbin/httpd -...  2 seconds ago  Up 1 second ago  0.0.0.0:80->80/tcp  trusting_mclean
</pre>

By default, SELinux is enabled on RHEL, and you can confirm this by inspecting the SELinux status. Also, confirm that the enabled mode
is set to enforcing.

`sestatus`{{execute T1}}

<pre class="file">
SELinux status:                 **enabled**
...
Current mode:                   **enforcing**
...
</pre>

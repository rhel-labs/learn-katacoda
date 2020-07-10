# Software installation and configuration
Prior to getting started, we need certain packages such as Udica (which is a tool for generating 
SELinux policies for containers), and setools-console (which is a set of tools that can facilitate 
SELinux policy analysis). In this demo, the container runtime related packages are already installed.

>_NOTE:_ We assume that you have a sound understanding of SELinux basics and container fundamentals. 

First, install the udica and setools-console packages -

`yum install -y udica setools-console`{{execute}}

Use podman to list the available container images -
`podman images`{{execute}}

You should notice that there is already a container image available called **localhost/rhel8-httpd**. 
This image contains Apache server application. 

Now, run the container using podman 
`podman run -d -p 80:80 localhost/rhel8-httpd`{{execute T1}}

<pre class="file">
f4d9db69e9b512517f9490d3bcc5096e69cca5e9b3a50b3890430da39ae46573
</pre>

Check the status of the application container using `podman`.  

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
f4d9db69e9b5  localhost/rhel8-httpd  /sbin/init  16 seconds ago  Up 16 seconds ago  0.0.0.0:80->80/tcp  relaxed_wilson
</pre>


# Generating SELinux container policies with Udica

To create the custom SELinux security policy, Udica scans the container JSON file to discover which Linux capabilities are required 
by the container. The network ports are a similar situation where Udica uses the SELinux userspace libraries to get the correct 
SELinux label of a port that is used by the inspected container. 

In terminal 1, inspect the running container using podman to generate a container inspection file in JSON format
`podman inspect $CONTAINERID > container.json`{{execute T1}}

Tell Udica to generate the custom SELinux security policy by using the container JSON file. In this case the name of the 
custom SELinux security policy is called 'my_container'
`udica -j container.json my_container`{{execute T1}}

<pre class="file">
Policy my_container created!
</pre>

You just created a custom SELinux security policy for the container. Now you can load this policy into the kernel and make it active.
`semodule -i my_container.cil /usr/share/udica/templates/{base_container.cil,net_container.cil,home_container.cil}`{{execute T1}}

For the policies to take effect, stop and re-launch the container
`podman stop $CONTAINERID`{{execute T1}}

Restart the container to allow the container engine to use the new custom policy
`CONTAINER=$(podman run --security-opt label=type:my_container.process -v /home:/home:ro -v/var/spool:/var/spool:rw -d -p 80:80 -it localhost/rhel8-httpd /bin/bash)`{{execute T2}}

Verify the SELinux type assigned to the running container is my_container.process.
`ps -eZ | grep my_container.process`{{execute T1}}

<pre class="file">
system_u:system_r:my_container.process:s0:c163,c711 34982 pts/0 00:00:00 bash
</pre>

In terminal window 1, check the status of the application container using 'podman' and get the running container id 

`podman ps; CONTAINERID=$(podman ps | grep localhost/rhel8-httpd:latest | cut -b 1-12)`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
f4d9db69e9b5  localhost/el-httpd1:latest  /sbin/init  16 seconds ago  Up 16 seconds ago  0.0.0.0:80->80/tcp  relaxed_wilson
</pre>

Query the SELinux policy on the host to search for allow enforcement rules applied to access /home and /var/spool directories 
`sesearch -A -s my_container.process -t home_root_t -c dir -p read`{{execute T1}}

<pre class="file">
allow my_container.process home_root_t:dir { getattr ioctl lock open read search };
</pre>
There is an allow rule in place that allows read access to the root home folder.

`sesearch -A -s my_container.process -t var_spool_t -c dir -p read`{{execute T1}}

<pre class="file">
allow my_container.process var_spool_t:dir { add_name getattr ioctl lock open read remove_name searchwrite };
</pre>
There is an allow rule in place that allows read access to the var spool folder.

Query the SELinux policy for network access 
`sesearch -A -s my_container.process -t port_type -c tcp_socket`{{execute T1}}

<pre class="file">
allow my_container.process http_port_t:tcp_socket { name_bind name_connect recv_msg send_msg };
</pre>
There is an allow rule in place to only access port 80.

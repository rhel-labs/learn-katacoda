# Crafting SELinux container policies with Udica

In terminal 1, inspect the running container using Udica
`podman inspect $CONTAINERID | udica my_container`{{execute T1}}

Udica will inspect the running container, and will create an SELinux policy for that container. In this case the name of the SELinux security policy is 'my_container'
<pre class="file">
Policy my_container with container id 37a3635afb8f created!
</pre>

Udica has generated the policies, so install the policies 
`semodule -i my_container.cil /usr/share/udica/templates/{base_container.cil,net_container.cil,home_container.cil}`{{execute T1}}

So that the polcies take affect, stop the container and re-launch it
`podman stop $CONTAINERID`{{execute T1}}

`CONTAINER=$(podman run --security-opt label=type:my_container.process -v /home:/home:ro -v/var/spool:/var/spool:rw -d -p 80:80 -it localhost/rhel8-httpd /bin/bash)`{{execute T2}}

Check the status of the application container using `podman`.  

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
f4d9db69e9b5  localhost/el-httpd1:latest  /sbin/init  16 seconds ago  Up 16 seconds ago  0.0.0.0:80->80/tcp  relaxed_wilson
</pre>

Query the SELinux policy to search for allow enforcement rules applied to access /home and /var/spool directories 
`sesearch -A -s my_container.process -t home_root_t -c dir -p read`{{execute T1}}

There is an allow rule in place that allows read access to the root home folder.

`sesearch -A -s my_container.process -t var_spool_t -c dir -p read`{{execute T1}}

There is an allow rule in place that allows read access to the var spool folder.

Query the SELinux policy for network access 
`sesearch -A -s my_container.process -t port_type -c tcp_socket`

There is an allow rule in place to only access port 80.

Unlike interactive containers, detached containers are stopped using __podman stop <CONTAINER ID>__.

`podman stop $(podman ps -a | grep Up | cut -d" " -f1)`{{execute T1}}

In the command above, we use a bit of bash scripting to determine the __CONTAINER ID__ as it is going to be a value unique to each container image.

You can verify that the container is now exited:

`podman ps -a`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED        STATUS                     PORTS                   NAMES
2b2571efec6f  localhost/rhel8-httpd:latest  /usr/sbin/httpd -...  9 minutes ago  Exited (0) 50 seconds ago  127.0.0.1:8081->80/tcp  priceless_mahavira
</pre>

Also, if you access the __Web Service__ tab in the lab interface, it will now report unable to connect; as the container offering the Apache web server is no longer available.

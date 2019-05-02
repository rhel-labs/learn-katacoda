Running an interactive container is all well and good, however, if the container is offering applications or services, you do not need to interact with it.

The __rhel8-httpd__ container, for example, is configured with an Apache web server running within it.  You will create a new instance of this container in a detached mode.  Further, the command provided will configure port forwarding for the Apache web server so that connections to the host's port 8081 will redirect to the running container's port 80 (Apache service).

`podman run -dt -p 127.0.0.1:8081:80/tcp rhel8-httpd`{{execute HOST1}}

You can verify the state of the container using __podman ps__

`podman ps -a`{{execute HOST2}}

<pre class="file">
CONTAINER ID  IMAGE                         COMMAND               CREATED         STATUS             PORTS                   NAMES
2b2571efec6f  localhost/rhel8-httpd:latest  /usr/sbin/httpd -...  13 seconds ago  Up 12 seconds ago  127.0.0.1:8081->80/tcp  priceless_mahavira
</pre>

Note the __STATUS__ is __Up__ and there is a new section in the output __PORTS__ that indicates the port forwarding defined for the container.

You can also now connect to the web server running on the container by using the __Web Service__ tab at the top of your lab interface.  This tab should now display the Apache test page.

Using the top terminal session, view the container images available.

`podman images`{{execute HOST1}}

<pre class=file>
REPOSITORY              TAG      IMAGE ID       CREATED        SIZE
localhost/rhel8-httpd   latest   c12e3720df7b   43 hours ago   499 MB

</pre>

There is one container available in the local (localhost) repository, 
__rhel8-httpd__.  If there were multiple updated iterations of the conatiner 
available, you would use the __IMAGE ID__ to work with those that are not 
tagged as __latest__.  Also, from this list you are able to see the size, on 
disk, of the container image. 

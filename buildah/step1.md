# Creating an application image from an existing base

In the terminal, list the container images available on the host.  

`buildah images`{{execute T1}}

<pre class="file">
IMAGE NAME                                               IMAGE TAG            IMAGE ID             CREATED AT             SIZE
registry.access.redhat.com/ubi8/ubi-init                            latest               8c376a94293d         Apr 29, 2019 07:42     231 MB
</pre>

The Red Hat Enterprise Linux 8 Universal Base Image is provided as the starting point.

To build an application container from the `ubi-init` base image, we will create a working container with `buildah`.  

`buildah from registry.access.redhat.com/ubi8/ubi-init`{{execute T1}}

<pre class="file">
ubi-init-working-container
</pre>

A working container is a temporary container used as the target for buildah commands.

Buildah will append `-working-container` to the image name used.  If that name already exists, a number will also be appended.

# Creating an application image from an existing base

**Buildah** has two main ways to create images:
* Using subcommands to modify contents
* Using host tools to modify a container filesystem

First, we'll look at using subcommands to modify the container contents before saving an image.  Many **buildah** subcommands act like directives from an OCIfile.  This allows for a familiar experience while automating builds.

The Red Hat Enterprise Linux 8 Universal Base Image is provided as the starting point for creating containers with Red Hat Enterprise Linux packages.  More information on UBI can be found in the [introductory blog post.](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image)

To build an application container from the `ubi-init` base image, we will create a working container with `buildah`.  A working container is a temporary container used as the target for buildah commands.

`buildah from registry.access.redhat.com/ubi8/ubi-init`{{execute T1}}

<pre class="file">
ubi-init-working-container
</pre>

This subcommand acts like the FROM directive in an OCIFile and makes the source image available on the host.

Buildah will append `-working-container` to the image name used.  If that name already exists, a number will also be appended.

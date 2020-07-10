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


`systemctl restart cockpit; systemctl enable --now lorax-composer.service`{{execute}}

Lastly, in the next steps, you will use a non-administrative user, __rhel__, to
manage the image blueprints and build machine images.  This user must belong to
the __weldr__ group.

`usermod -a -G weldr rhel`{{execute}}




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

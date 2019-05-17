# Creating an application image from an existing base

In *Terminal 1*, list the container images available on the host.  The Red Hat Enterprise Linux 8 Universal Base Image is provided as the starting point.

`buildah images`{{execute T1}}

```
IMAGE NAME                                               IMAGE TAG            IMAGE ID             CREATED AT             SIZE
registry.access.redhat.com/ubi8/ubi-init                            latest               8c376a94293d         Apr 29, 2019 07:42     231 MB
```

To build an application container from the `ubi-init` base image, create a working container with buildah.  A working container is an temporary container used as the target for buildah commands.  

`buildah from registry.access.redhat.com/ubi8/ubi-init`{{execute T1}}

```
ubi-init-working-container
```

Buildah will append `-working-container` to the image name used.  If that name already exists, a number will also be appended.

This image is very complete, including tools like `yum` and `systemd`.  You can install `httpd` using the `buildah run` subcommand.  This acts like the RUN directive in an OCIFile.  Since the `yum` command includes a switch, we need to use the `--` syntax to tell `buildah run` there are no buildah options to look for past this point.

`buildah run ubi-init-working-container -- yum -y install httpd`{{execute T1}}

```
Transaction Summary
======================
Install  10 Packages

Complete!
```

Once the packages are installed in the working container, enable `httpd` to start when the container is run using systemd.

`buildah run ubi-init-working-container -- systemctl enable httpd`{{execute T1}}

```
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
```

Deploying web content to the container image can be done using the `buildah copy` subcommand.  This acts like the COPY directive in an OCIFile.  

`buildah copy ubi-init-working-container index1.html /var/www/html/index.html`{{execute T1}}

To expose a port, set an entry point or command for the container, modify the metadata with the `buildah config` subcommand.  These are equivalent to the EXPOSE, ENTRYPOINT, or CMD directives in an OCIFile.  As we're using systemd to start the service, use the `--cmd` option not `--entrypoint`.

`buildah config --port 80 --cmd "/usr/sbin/init" ubi-init-working-container`{{execute T1}}

Once the contents of the working container are complete, and the metadata has been updated, the working container can be saved to create the application container image.  

In this example, each `buildah` subcommand results in a separate layer, much like building using an OCIFile.

`buildah commit ubi-init-working-container el-httpd1`{{execute T1}}

```
Getting image source signatures
Skipping fetch of repeat blob sha256:24d85c895b6b870f6b84327a5e31aa567a5d30588de0a0bdd9a669ec5012339c
Skipping fetch of repeat blob sha256:c613b100be1645941fded703dd6037e5aba7c9388fd1fcb37c2f9f73bc438126
Skipping fetch of repeat blob sha256:188ab351dfda8afc656a38073df0004cdc5196fd5572960ff5499c17e6442223
Copying blob sha256:8df24355b15ad293a5dd60d0fe2c14dca68b0412b62f9e9c39c15bb8230d1936
 26.80 MiB / 26.80 MiB [====================================================] 0s
Copying config sha256:b04fe2c73b034e657da2fee64c340c56086a38265777556fa8a02c5f12896e66
 2.42 KiB / 2.42 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
b04fe2c73b034e657da2fee64c340c56086a38265777556fa8a02c5f12896e66
```

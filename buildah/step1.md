# Creating an application image from an existing base

In *Terminal 1*, inspect the RHEL 8 base image on the host system:

`buildah images`{{execute T1}}

```
IMAGE NAME                                               IMAGE TAG            IMAGE ID             CREATED AT             SIZE
registry.access.redhat.com/ubi8/ubi-init                            latest               8c376a94293d         Apr 29, 2019 07:42     231 MB
```

We can create a working container from this image.  A working container is an temporary container used as targets for buildah commands.  

`buildah from registry.access.redhat.com/ubi8/ubi-init`{{execute T1}}

```
ubi-init-working-container
```

Buildah will append `-working-container` to the image name used.  If that name already exists, a number will also be appended.

This container is very complete, including tools like `yum` and `systemd`.  You can install `httpd` using the `run` subcommand.  This acts like the RUN directive in an OCIFile.  Since the `yum` command includes a switch, we need to use the `--` syntax to tell `buildah run` there are no buildah options to look for past this point.

`buildah run ubi-init-working-container -- yum -y install httpd`{{execute T1}}

```
Transaction Summary
======================
Install  10 Packages

Complete!
```

Set `httpd` to start using systemd

`buildah run ubi-init-working-container -- systemctl enable httpd`{{execute T1}}

```
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
```

Copy the `index.html` into the web server

`buildah copy ubi-init-working-container index.html /var/www/html`{{execute T1}}

Configure the port map and set cmd to systemd

`buildah config --port 80 --cmd "/sbin/init" ubi-init-working-container`{{execute T1}}

Create an image from the working container

`buildah commit ubi-init-working-container el-httpd1`{{execute T1}}

```
Getting image source signatures
Skipping fetch of repeat blob sha256:24d85c895b6b870f6b84327a5e31aa567a5d30588de0a0bdd9a669ec5012339c
Skipping fetch of repeat blob sha256:c613b100be1645941fded703dd6037e5aba7c9388fd1fcb37c2f9f73bc438126
Skipping fetch of repeat blob sha256:188ab351dfda8afc656a38073df0004cdc5196fd5572960ff5499c17e6442223
Copying blob sha256:a482eecc9fcdd49a36725ac8e741918b24360ea8e08f701e683fdd3f6be5ffd3
 26.80 MiB / 26.80 MiB [====================================================] 0s
Copying config sha256:ec25b93864ca66ea847ec5ac7d7190fba2b5e3c65eabb81a5f3bc9ec4d483b51
 2.39 KiB / 2.39 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
ec25b93864ca66ea847ec5ac7d7190fba2b5e3c65eabb81a5f3bc9ec4d483b51
```


Podman and buildah use the same storage locations on the host, which lets us immediately run the image we just built.

`podman images`{{execute T1}}
```
REPOSITORY                     TAG      IMAGE ID       CREATED             SIZE
localhost/el-httpd1            latest   744417d8acd7   About an hour ago   279 MB

```

`podman run -d -p 80:80 el-httpd1`{{execute T1}}

```
f4d9db69e9b512517f9490d3bcc5096e69cca5e9b3a50b3890430da39ae46573
```

`podman ps`{{execute T1}}

```
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
f4d9db69e9b5  localhost/el-httpd1:latest  /sbin/init  16 seconds ago  Up 16 seconds ago  0.0.0.0:80->80/tcp  relaxed_wilson
```

Inspecting the image, you can see the layers for each of the `buildah` commands run.  Look for the `rootfs` section in the JSON output.

`buildah inspect localhost/el-httpd1`{{execute T1}}
```
"rootfs": {
    "type": "layers",
    "diff_ids": [
        "sha256:24d85c895b6b870f6b84327a5e31aa567a5d30588de0a0bdd9a669ec5012339c",
        "sha256:c613b100be1645941fded703dd6037e5aba7c9388fd1fcb37c2f9f73bc438126",
        "sha256:188ab351dfda8afc656a38073df0004cdc5196fd5572960ff5499c17e6442223",
        "sha256:2aa09f066ed0ce8aad332cbefe237cbe05777f5790bccfdcda439aff5f5f7509"
    ]
},
```
`podman stop -a`{{execute T1}}

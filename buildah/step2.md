# Launching and inspecting the application container

Podman and buildah use the same storage locations on the host, which lets us immediately run the image we just built.  Note the name matches what was set using `buildah commit`.

`podman images`{{execute T1}}
```
REPOSITORY                                 TAG      IMAGE ID       CREATED          SIZE
localhost/el-httpd1                        latest   b04fe2c73b03   24 seconds ago   279 MB
registry.access.redhat.com/ubi8/ubi-init   latest   8c376a94293d   2 weeks ago      231 MB
```

`podman run -d -p 80:80 el-httpd1`{{execute T1}}

```
f4d9db69e9b512517f9490d3bcc5096e69cca5e9b3a50b3890430da39ae46573
```

Check to see the status of the application container using `podman`.  Note the ports and command match the metadata set using `buildah config`.  

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

Click on the *Container httpd* tab to see the index.html deployed into the application container.

Stop all running containers before moving to the next step:

`podman stop -a`{{execute T1}}

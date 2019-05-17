# Launching and inspecting the application container

Podman and buildah use the same storage locations on the host, which lets us immediately run the image we just built.  Note the name matches what was set using `buildah commit`.

`podman images`{{execute T1}}

```
REPOSITORY                                 TAG      IMAGE ID       CREATED              SIZE
localhost/el-httpd2                        latest   d074aab93289   About a minute ago   505 MB
localhost/el-httpd1                        latest   b04fe2c73b03   6 minutes ago        279 MB
registry.access.redhat.com/ubi8-init       latest   8c376a94293d   2 weeks ago          231 MB
```

`podman run -d -p 80:80 el-httpd2`{{execute T1}}

```
561019c2a69fd3826bcaf4a62240ba2b5edd542e664bd2fee0381da746d58d95
```
Check to see the status of the application container using `podman`.  Note the ports and command match the metadata set using `buildah config`.  

`podman ps`{{execute T1}}

```
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
561019c2a69f  localhost/el-httpd2:latest  /sbin/init  13 seconds ago  Up 13 seconds ago  0.0.0.0:80->80/tcp  suspicious_sammet
```

Inspecting the image, you can see there's only one layer since we executed all the commands directly against the mounted filesystem.  Look for the `rootfs` section in the JSON output.

`buildah inspect localhost/el-httpd2`{{execute T1}}

```
"rootfs": {
            "type": "layers",
            "diff_ids": [
                "sha256:6d0bba8b32ffa211bb78d415b96d67dd7955cb30b1f86555d9c9f0da9a914626"
            ]
        },
```

Click on the ***Container httpd*** tab to see the index.html deployed into the application container.

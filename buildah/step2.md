# Creating an application image from scratch

Starting from an existing base container isn't the only option available to buildah.  Buildah can create a minimal container image that only contains metadata and a filesystem stub.  Since there's no starting image, the working container will be called `working-container`.

`buildah from scratch`{{execute T1}}

```
working-container
```

We can start working with the scratch container using tools on the host by mounting the overlay filesystem.  We capture the output of the `buildah` command in a variable to make it easier to work with in these exercises.

`scratchmnt=$(buildah mount working-container)`{{execute T1}}

```
/var/lib/containers/storage/overlay/b469dd468110ed394288e140a359eb1b96d7429de99fe104720be6d379f706cb/merged
```

Right now, that directory is empty.

`ls -l ${scratchmnt}`{{execute T1}}

```
total 0
```

In order to install `httpd` in the scratch container, use `yum` with the `installroot` option targeting the mount point of the container's filesystem.

`yum install --installroot ${scratchmnt} httpd --releasever 8 --setopt=module_platform_id="platform:el8" -y`{{execute T1}}

```
Transaction Summary
======================
Install 162 Packages

Complete!

```

Many more packages required than using the base image, but we have httpd and systemd but not other tools like yum or 100 other utilities.  

To set up `httpd` to start with systemd, we can use the container mount point like a normal `chroot`.

`chroot ${scratchmnt} systemctl enable httpd`{{execute T1}}

```
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
```
Copy the `index.html` into the web server

`cp index.html ${scratchmnt}/var/www/html`{{execute T1}}

Configure the port map and set cmd to systemd

`buildah config --port 80 --cmd "/sbin/init" working-container`{{execute T1}}

Create an image from the working container

`buildah unmount working-container`{{execute T1}}

```
b0ace0c1867f080c790357dd0c606c6919c163c308065c2323d3ddc148740eb1
```

`buildah commit working-container el-httpd2`{{execute T1}}

```
Getting image source signatures
Copying blob sha256:273497ce3451052db7cc333d8e90c259314f9cb8d6d4f7a5b865656f65c24083
 162.17 MiB / 162.17 MiB [==================================================] 6s
Copying config sha256:a3c678a7d7c63edbac6e57a86da11ff4d916c0734bcbea9cfd55ae2b515275b9
 308 B / 308 B [============================================================] 0s
Writing manifest to image destination
Storing signatures
a3c678a7d7c63edbac6e57a86da11ff4d916c0734bcbea9cfd55ae2b515275b9
```

`podman images`{{execute T1}}

```
REPOSITORY                                 TAG      IMAGE ID       CREATED              SIZE
localhost/el-httpd2                        latest   a3c678a7d7c6   About a minute ago   505 MB
localhost/el-httpd1                        latest   744417d8acd7   2 hours ago          279 MB
```

`podman run -d -p 80:80 el-httpd2`{{execute T1}}

```
561019c2a69fd3826bcaf4a62240ba2b5edd542e664bd2fee0381da746d58d95
```

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

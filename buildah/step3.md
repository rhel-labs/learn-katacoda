# Creating an application image from scratch

Starting from an existing base container isn't the only option available to buildah.  Buildah can create a minimal container image that contains metadata and a filesystem stub.  Since there's no starting image, the working container will be called `working-container`.  To create this style of image use the `scratch` special target.

`buildah from scratch`{{execute T1}}

```
working-container
```

We can start working with the scratch container using tools on the host by mounting the overlay filesystem.  We capture the output of the `buildah` command in the variable *scratchmnt* to make it easier to work with the filesystem path in these exercises.

`scratchmnt=$(buildah mount working-container)`{{execute T1}}

`echo ${scratchmnt}`{{execute T1}}

```
/var/lib/containers/storage/overlay/5199b9cbf441fe93e3629f9d6336fd7008858b9b6e23629a724ccc2f567f3feb/merged
```

Right now, that directory is empty.

`ls -l ${scratchmnt}`{{execute T1}}

```
total 0
```

In order to install `httpd` in the scratch container, use `yum` on the host with the `installroot` option targeting the mount point of the container's filesystem.  Setting the `releasever` and `module_platform_id` are required as this will be operating in a chroot environment where `yum` config files are not available.

`yum install --installroot ${scratchmnt} httpd --releasever 8 --setopt=module_platform_id="platform:el8" -y`{{execute T1}}

```
Transaction Summary
======================
Install 162 Packages

Complete!

```

Many more packages required than using the base image, but we have `httpd` and `systemd` but not other tools like `yum`.  

To enable `httpd` to start when the container is run using systemd, we can use the container mount point like a normal `chroot`.

`chroot ${scratchmnt} systemctl enable httpd`{{execute T1}}

```
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
```
Deploying web content to the container image can be done using a `cp` command on the host to the working container mount point.

`cp index.html ${scratchmnt}/var/www/html`{{execute T1}}

After installing packages and adding the index file, unmount the filesystem with the `buildah unmount` subcommand.

`buildah unmount working-container`{{execute T1}}

```
b0ace0c1867f080c790357dd0c606c6919c163c308065c2323d3ddc148740eb1
```

To expose a port, set an entry point or command for the container, modify the metadata with the `buildah config` subcommand.  These are equivalent to the EXPOSE, ENTRYPOINT, or CMD directives in an OCIFile.  As we're using systemd to start the service, use the `--cmd` option not `--entrypoint`.

`buildah config --port 80 --cmd "/usr/sbin/init" working-container`{{execute T1}}

Once the contents of the working container are complete, and the metadata has been updated, the working container can be saved to create the application container image.  

In this example, all operations were done directly to the container filesystem, resulting in a single layer.  The `buildah commit` step can be run at any point where a layer is needed, for example to cache a common set of packages across multiple applications.

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

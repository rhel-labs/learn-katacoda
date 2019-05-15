# KATACODA Markdown additions
More examples available on [Katacoda GitHub] (https://github.com/katacoda/scenario-examples)

EXECUTING MARKDOWN CODE BLOCKS ADDS COMMAND AND TARGET *Terminal 1*.

`podman run -it rhel8-httpd /bin/bash`{{execute T1}}

ALLOWING MARKDOWN CODE BLOCKS TO BE COPIED ADDS COMMAND

`podman run -it rhel8-httpd /bin/bash`{{copy}}

PASSING TO EDITOR INTERFACE REQUIRES HTML TAG:

<pre class="file">
bash-4.4#
</pre>

podman pull registry.access.redhat.com/ubi8/ubi-init
setsebool -P container_manage_cgroup true

# Creating an application image from an existing base

In *Terminal 1*, inspect the RHEL 8 base image on the host system:

`buildah images`{{execute T1}}

```
IMAGE NAME                                               IMAGE TAG            IMAGE ID             CREATED AT             SIZE
registry.redhat.io/ubi8-init                             latest               8c376a94293d         Apr 29, 2019 07:42     231 MB
```

We can create a working container from this image.  A working container is an temporary container used as targets for buildah commands.  

`buildah from registry.redhat.io/ubi8-init`{{execute T1}}

```
ubi8-init-working-container
```

Buildah will append `-working-container` to the image name used.  If that name already exists, a number will also be appended.

This container is very complete, including tools like `yum` and `systemd`.  You can install `httpd` using the `run` subcommand.  This acts like the RUN directive in an OCIFile.  Since the `yum` command includes a switch, we need to use the `--` syntax to tell `buildah run` there are no buildah options to look for past this point.

`buildah run ubi8-init-working-container -- yum -y install httpd`{{execute T1}}

```
Updating Subscription Management repositories.
Unable to read consumer identity
Subscription Manager is operating in container mode.
Red Hat Enterprise Linux 8 for x86_64 - AppStre 248  B/s | 512  B     00:02    
Red Hat Enterprise Linux 8 for x86_64 - AppStre 3.5 MB/s | 7.0 MB     00:02    
Red Hat Enterprise Linux 8 for x86_64 - BaseOS  533  B/s | 512  B     00:00    
Red Hat Enterprise Linux 8 for x86_64 - BaseOS  4.9 MB/s | 3.7 MB     00:00    
Red Hat Universal Base Image 8 (RPMs) - AppStre 622 kB/s | 1.1 MB     00:01    
Red Hat Universal Base Image 8 (RPMs) - BaseOS  446 kB/s | 723 kB     00:01    
Dependencies resolved.
================================================================================
 Package            Arch   Version       Repository                        Size
================================================================================
Installing:
 httpd              x86_64 2.4.37-11.module+el8.0.0+2969+90015743
                                         rhel-8-for-x86_64-appstream-rpms 1.4 M
Installing dependencies:
 apr                x86_64 1.6.3-9.el8   rhel-8-for-x86_64-appstream-rpms 125 k
 apr-util           x86_64 1.6.1-6.el8   rhel-8-for-x86_64-appstream-rpms 105 k
 httpd-tools        x86_64 2.4.37-11.module+el8.0.0+2969+90015743
                                         rhel-8-for-x86_64-appstream-rpms 101 k
 httpd-filesystem   noarch 2.4.37-11.module+el8.0.0+2969+90015743
                                         rhel-8-for-x86_64-appstream-rpms  34 k
 mod_http2          x86_64 1.11.3-2.module+el8.0.0+2969+90015743
                                         rhel-8-for-x86_64-appstream-rpms 156 k
 mailcap            noarch 2.1.48-3.el8  rhel-8-for-x86_64-baseos-rpms     39 k
 redhat-logos-httpd noarch 80.7-1.el8    rhel-8-for-x86_64-baseos-rpms     25 k
Installing weak dependencies:
 apr-util-openssl   x86_64 1.6.1-6.el8   rhel-8-for-x86_64-appstream-rpms  27 k
 apr-util-bdb       x86_64 1.6.1-6.el8   rhel-8-for-x86_64-appstream-rpms  25 k
Enabling module streams:
 httpd                     2.4                                                 

Transaction Summary
================================================================================
Install  10 Packages

Total download size: 2.0 M
Installed size: 5.5 M
Downloading Packages:
(1/10): apr-util-bdb-1.6.1-6.el8.x86_64.rpm      15 kB/s |  25 kB     00:01    
(2/10): apr-1.6.3-9.el8.x86_64.rpm               64 kB/s | 125 kB     00:01    
(3/10): apr-util-openssl-1.6.1-6.el8.x86_64.rpm  12 kB/s |  27 kB     00:02    
(4/10): apr-util-1.6.1-6.el8.x86_64.rpm         117 kB/s | 105 kB     00:00    
(5/10): httpd-tools-2.4.37-11.module+el8.0.0+29 101 kB/s | 101 kB     00:01    
(6/10): httpd-filesystem-2.4.37-11.module+el8.0  38 kB/s |  34 kB     00:00    
(7/10): mod_http2-1.11.3-2.module+el8.0.0+2969+ 158 kB/s | 156 kB     00:00    
(8/10): httpd-2.4.37-11.module+el8.0.0+2969+900 1.7 MB/s | 1.4 MB     00:00    
(9/10): mailcap-2.1.48-3.el8.noarch.rpm          28 kB/s |  39 kB     00:01    
(10/10): redhat-logos-httpd-80.7-1.el8.noarch.r  18 kB/s |  25 kB     00:01    
--------------------------------------------------------------------------------
Total                                           417 kB/s | 2.0 MB     00:04     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                        1/1
  Installing       : apr-1.6.3-9.el8.x86_64                                1/10
  Running scriptlet: apr-1.6.3-9.el8.x86_64                                1/10
  Installing       : apr-util-bdb-1.6.1-6.el8.x86_64                       2/10
  Installing       : apr-util-1.6.1-6.el8.x86_64                           3/10
  Running scriptlet: apr-util-1.6.1-6.el8.x86_64                           3/10
  Installing       : apr-util-openssl-1.6.1-6.el8.x86_64                   4/10
  Installing       : httpd-tools-2.4.37-11.module+el8.0.0+2969+90015743    5/10
  Installing       : redhat-logos-httpd-80.7-1.el8.noarch                  6/10
  Installing       : mailcap-2.1.48-3.el8.noarch                           7/10
  Running scriptlet: httpd-filesystem-2.4.37-11.module+el8.0.0+2969+900    8/10
  Installing       : httpd-filesystem-2.4.37-11.module+el8.0.0+2969+900    8/10
  Installing       : mod_http2-1.11.3-2.module+el8.0.0+2969+90015743.x8    9/10
  Installing       : httpd-2.4.37-11.module+el8.0.0+2969+90015743.x86_6   10/10
  Running scriptlet: httpd-2.4.37-11.module+el8.0.0+2969+90015743.x86_6   10/10
  Verifying        : apr-util-openssl-1.6.1-6.el8.x86_64                   1/10
  Verifying        : apr-util-bdb-1.6.1-6.el8.x86_64                       2/10
  Verifying        : apr-1.6.3-9.el8.x86_64                                3/10
  Verifying        : apr-util-1.6.1-6.el8.x86_64                           4/10
  Verifying        : httpd-tools-2.4.37-11.module+el8.0.0+2969+90015743    5/10
  Verifying        : httpd-filesystem-2.4.37-11.module+el8.0.0+2969+900    6/10
  Verifying        : mod_http2-1.11.3-2.module+el8.0.0+2969+90015743.x8    7/10
  Verifying        : httpd-2.4.37-11.module+el8.0.0+2969+90015743.x86_6    8/10
  Verifying        : mailcap-2.1.48-3.el8.noarch                           9/10
  Verifying        : redhat-logos-httpd-80.7-1.el8.noarch                 10/10
Installed products updated.

Installed:
  httpd-2.4.37-11.module+el8.0.0+2969+90015743.x86_64                           
  apr-util-openssl-1.6.1-6.el8.x86_64                                           
  apr-util-bdb-1.6.1-6.el8.x86_64                                               
  apr-1.6.3-9.el8.x86_64                                                        
  apr-util-1.6.1-6.el8.x86_64                                                   
  httpd-tools-2.4.37-11.module+el8.0.0+2969+90015743.x86_64                     
  httpd-filesystem-2.4.37-11.module+el8.0.0+2969+90015743.noarch                
  mod_http2-1.11.3-2.module+el8.0.0+2969+90015743.x86_64                        
  mailcap-2.1.48-3.el8.noarch                                                   
  redhat-logos-httpd-80.7-1.el8.noarch                                          

Complete!
```

Set `httpd` to start using systemd

`buildah run ubi8-init-working-container -- systemctl enable httpd`{{execute T1}}

```
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
```
Configure the port map and set cmd to systemd

`buildah config --port 80 --cmd "/sbin/init" ubi8-init-working-container`{{execute T1}}

Create an image from the working container

`buildah commit ubi8-init-working-container el-httpd1`{{execute T1}}

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

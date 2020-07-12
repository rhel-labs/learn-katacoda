# Crafting SELinux container policies with Udica

In terminal 1, inspect the running container using Udica
`podman inspect $CONTAINERID | udica my_container`{{execute T1}}

Udica will inspect the running container, and will create an SELinux policy for that container. In this case the name of the SELinux security policy is 'my_container'
<pre class="file">
Policy my_container with container id 37a3635afb8f created!
</pre>


Check the status of the application container using `podman`.  

`podman ps`{{execute T1}}

<pre class="file">
CONTAINER ID  IMAGE                       COMMAND     CREATED         STATUS             PORTS               NAMES
f4d9db69e9b5  localhost/el-httpd1:latest  /sbin/init  16 seconds ago  Up 16 seconds ago  0.0.0.0:80->80/tcp  relaxed_wilson
</pre>

Note the ports and command match the metadata set using `buildah config`.  

Inspect the image metadata for the application container using `buildah inspect`.

`buildah inspect localhost/el-httpd1`{{execute T1}}

<pre class="file">
"rootfs": {
    "type": "layers",
    "diff_ids": [
        "sha256:24d85c895b6b870f6b84327a5e31aa567a5d30588de0a0bdd9a669ec5012339c",
        "sha256:c613b100be1645941fded703dd6037e5aba7c9388fd1fcb37c2f9f73bc438126",
        "sha256:188ab351dfda8afc656a38073df0004cdc5196fd5572960ff5499c17e6442223",
        "sha256:2aa09f066ed0ce8aad332cbefe237cbe05777f5790bccfdcda439aff5f5f7509"
    ]
},
</pre>

Look for the `rootfs` section in the JSON output. You will see layers for each of the `buildah` subcommands run.  

Click on the ***Container httpd*** tab to see the index.html deployed into the application container.

Stop all running containers before moving to the next step:

`podman stop -a`{{execute T1}}

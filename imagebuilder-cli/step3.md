#Building a machine image

In this step you will build a machine image from the modified 
example-http-server blueprint definition you made in the previous step.

Use the `composer-cli` command to start a compose based on the
example-http-server blueprint.  For this lab, you will use the output format
of __ext4-filesystem__ so that you can easily access the contents of the
virtual machine image without any additional tools in the next step.  However, 
you could build any of the following types of images: 

| Output type      |  Details                |
|------------------|:-----------------------:|
| alibaba          |  Alibaba Cloud          |
| ami              |  Amazon EC2             |
| ext4-filesystem  |  ext4 filesystem        |
| google           |  Google Cloud           |
| live-iso         |  Bootable ISO           |
| openstack        |  OpenStack image        |
| partitioned-disk |  partitioned disk image |
| qcow2            |  qcow2 image            |
| tar              |  tar archive            |
| vhd              |  virtual hard disk      |
| vmdk             |  Virtual Machine disk   |


`composer-cli compose start example-http-server ext4-filesystem`{{execute}}

<pre class='file'>
Compose 78915164-320d-4fc3-88d4-91fc40e5f0c8 added to the queue
</pre>

The compose, or build of the image, is tracked using a UUID, in the above
example output, 78915164-320d-4fc3-88d4-91fc40e5f0c8.  Your UUID should be
different and unique to your build.

Composes are queued and completed in the order that they were received.  You
can look at the status of the queue using `composer-cli compose status`. 

`composer-cli compose status`{{execute}}
<pre class='file'>
78915164-320d-4fc3-88d4-91fc40e5f0c8 RUNNING Mon Jul 13 19:42:14 2020 example-http-server 0.0.2 ext4-filesystem  
</pre>

The status will display all queued (WAITING), running (RUNNING), and 
completed (FINISHED) composes.

As previously mentioned, each compose is tracked using a UUID number.  This
UUID is not only used to track the compose, but a directory in 
`/var/lib/lorax/composer/results/` is created with this UUID as well.  The
command below uses the UUID included in the status output to list the directory
associated with your most recent compose.

`ls /var/lib/lorax/composer/results/$(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}
<pre class='file'>
blueprint.toml  COMMIT compose config.toml  deps.toml  ext4-filesystem.ks  final-kickstart.ks  frozen.toml logs  STATUS  times.toml
</pre>
The results directory stored metadata about the compose, such as the status, and
will also be the location of the completed machine image that results from a
successful build.  Logs for the build are also stored here in a `logs` directory
that is populated once the build begins.  When the compose is completed, a
machine image is also written into the directory for the compose.

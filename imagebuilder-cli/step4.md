# Inspecting the image

In this step, you will access the machine image created in a previous step in
order to verify that the `nodejs` package added in earlier steps was added to
the resulting machine image.

In the next steps, you will access the machine image, however it will not work
if the machine image is not yet completed.  The below command is a small
`until` shell script that will run until the completed machine image is created.

`until $(composer-cli compose status | head -n1 | grep FINISHED &>/dev/null); do echo "Compose not finished ... waiting 10 seconds"; sleep 10; done; echo "COMPOSE FINISHED"`{{execute}}

Now that the machine image compose is finished, download the completed machine
image into your current directory.

`composer-cli compose image $(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

<pre class="file">
00403772-ff12-43d4-b09a-bddf28f20709-disk.qcow2: 686.96 MB  
</pre>

The above command takes the UUID of the compose as an argument.  We embedded
an additional call to `composer-cli compose status` along with some data
grooming to put this into the command for you to run.  Alternatively, you could
have copy/pasted from the output of your status from the previous step.

Now that the machine image is available locally, mount the disk image into your
directory tree at the /mnt mountpoint. For this we will use mount the qcow2 image as a network block device (NBD).

Load the NBD kernel module using the `modprobe` utility -

`modprobe nbd`{{execute}}

Attach a qcow2 virtual image file that was downloaded into the current directory -

`qemu-nbd --connect=/dev/nbd0 $(composer-cli compose status | head -n1 | cut -f1 -d" ")-disk.qcow2`{{execute}}

Find the virtual machine partition so that we can mount it -

`fdisk /dev/nbd0 -l`{{execute}}

Mount the partition to some mountpoint (/mnt) -

`mount /dev/nbd0p1 /mnt`{{execute}}

Temporarily change the root directory of the bash shell to be the directory holding the contents of 
your machine image.

`chroot /mnt`{{execute}}

Now, all the commands run are being executed from within the machine image
and use the machine image's files and content.  Use an `rpm` query to confirm
that `nodejs` and `nginx` is included in the machine image.

`rpm -q nodejs nginx`{{execute}}

<pre class="file">
nodejs-10.23.1-1.module+el8.3.0+9502+012d8a97.x86_64
nginx-1.14.1-9.module+el8.0.0+4108+af250afe.x86_64</pre>

From the above output, you can verify that `nodejs` was installed into this
machine image.

Now that the verification is complete, you can exit the chroot'ed bash shell.

`exit`{{execute}}

Unmount the verified machine disk image from your filesystem.

`umount /mnt`{{execute}}

Disconnect the network block device

`qemu-nbd --disconnect /dev/nbd0`{{execute}}

Remove the NBD kernel module

`rmmod nbd`{{execute}}


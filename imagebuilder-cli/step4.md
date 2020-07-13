# Inspecting the image

In this step, you will access the machine image created in a previous step in
order to verify that the `nodejs` package added in earlier steps was added to
the resulting machine image.

To have easy access to the completed machine image, change directory to the
results directory for your compose.

`cd /var/lib/lorax/composer/results/$(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

In the next steps, you will access the machine image, however it will not work
if the machine image is not yet completed.  The below command is a small
`until` shell script that will run until the completed machine image is created.

`until [ -e filesystem.img ]; do echo "Compose not complete ... waiting 10 seconds"; sleep 10; done; echo "COMPOSE COMPLETE"`{{execute}}

Now that the machine image compose is complete, mount the disk image into your
directory tree at the /mnt mountpoint.

`mount -o loop filesystem.img /mnt`{{execute}}

In an earlier step, you chose to build an ext4-filesystem type image, which is
why this mount command works.  If you chose a different output type, you may
need to use other utilities to access the contents of the machine image, such
as qemu-img, or others.

Temporarily change the root directory of the bash shell to be the directory
holding your machine image.

`chroot /mnt`{{execute}}

Now, all the commands run are being executed from within the machine image
and use the machine image's files and content.  Use an `rpm` query to confirm
that `nodejs` is included in the machine image.

`rpm -q nodejs`{{execute}}

<pre class="file">
nodejs-10.21.0-3.module+el8.2.0+7071+d2377ea3.x86_64
</pre>

From the above output, you can verify that `nodejs` was installed into this
machine image.

Now that the verification is complete, you can exit the chroot'ed bash shell.

`exit`{{execute}}

Unmount the verified machine disk image from your filesystem.

`umount /mnt`{{execute}}


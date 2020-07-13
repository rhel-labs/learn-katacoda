#Inspecting the image

In this step, you will access the machine image created in a previous step in
order to verify that the `nodejs` package added in earlier steps was added to
the resulting machine image.



`cd /var/lib/lorax/composer/results/$(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

`mount -o loop filesystem.img /mnt`{{execute}}

`chroot /mnt`{{execute}}

`rpm -q nodejs`{{execute}}

`exit`{{execute}}

`umount /mnt`{{execute}}


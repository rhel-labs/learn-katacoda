
`cd /var/lib/lorax/composer/results/$(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

`mount -o loop filesystem.img /mnt`{{execute}}

`chroot /mnt`{{execute}}

`rpm -q nodejs`{{execute}}

`exit`{{execute}}

`umount /mnt`{{execute}}


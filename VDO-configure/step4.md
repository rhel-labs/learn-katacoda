The VDO volume will need to be formatted with XFS to demonstrate 
space savings in this setup.

mkfs.xfs -K /dev/mapper/vdo1 {{execute}}

"-K" options tells mkfs to not send discards to VDO
during the format.

Create a directory to mount our new filesystem.

mkdir /data {{execute}}

Mount the file system. 

mount -o discard /dev/mapper/vdo1 /data {{execute}}

"-o discard" option lets the filesystem know to send
disards to the thin-provisioned layer when a file is
deleted.  Discards are required to accurately report
space savings.


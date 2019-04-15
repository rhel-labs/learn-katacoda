A free block device is required to create the VDO volume.  We can use a 
temporary loopback device for this scenario.  The data for our backing 
device will exist as a file in /tmp.

The truncate command can be used to create the file.

truncate -s 10g /tmp/vdo.trunc {{execute}}

Now, the vdo.trunc file will be used to create the loopback
device.  losetup is used to associate a loop device with a file.

losetup  /dev/loop1 /tmp/vdo.trunc {{execute}}

View the loopback device using lsblk.

lsblk {{execute}}

<pre class="file">
# lsblk
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop1           7:1    0   10G  0 loop
sr0            11:0    1 1024M  0 rom
vda           252:0    0 39.1G  0 disk
├─vda1        252:1    0    1G  0 part /boot
└─vda2        252:2    0 38.1G  0 part
  ├─rhel-root 253:0    0 34.2G  0 lvm  /
  └─rhel-swap 253:1    0  3.9G  0 lvm  [SWAP]
</pre>

The device named loop1 is first in the list and has a size of 10G.


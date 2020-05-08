# Locate empty block devices

A block storage device (or block device) is a device that can read and write data in “blocks” of a given size.
You will need to obtain empty block devices for this tutorial.

To do that, first use the `lsblk` utility to view a list of block devices on your machine.

`lsblk`{{execute}}

<pre class="file">
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sr0            11:0    1  7.3G  0 rom
vda           252:0    0 39.1G  0 disk
├─vda1        252:1    0    1G  0 part /boot
└─vda2        252:2    0 38.1G  0 part
  ├─rhel-root 253:0    0 34.2G  0 lvm  /
  └─rhel-swap 253:1    0  3.9G  0 lvm  [SWAP]
</pre>

From the above output, you can see that the two existing block devices on the machine, /dev/vda1 and /dev/vda2, are currently in use for /boot and logical volumes rhel-root and rhel-swap, respectively.

Therefore, in this lab, you will instead create a 10g file within the existing root filesystem and access that space through the looback interface.

`truncate -s 10g /tmp/myfile.trunc`{{execute}}

`losetup /dev/loop1 /tmp/myfile.trunc`{{execute}}

Verify that the loopback device has been created.

`lsblk`{{execute}}

<pre class ="file">
 NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
 loop1           7:1    0   10G  0 loop
 sr0            11:0    1  7.3G  0 rom
 vda           252:0    0 39.1G  0 disk
 ├─vda1        252:1    0    1G  0 part /boot
 └─vda2        252:2    0 38.1G  0 part
   ├─rhel-root 253:0    0 34.2G  0 lvm  /
   └─rhel-swap 253:1    0  3.9G  0 lvm  [SWAP]
</pre>

From the above output, you can see that loop1 is now listed as a newly created block device.

Create one more block device for this lab.

`truncate -s 10g /tmp/myfile2.trunc`{{execute}}

`losetup /dev/loop2 /tmp/myfile2.trunc`{{execute}}

Check that the two devices are displayed.

`lsblk`{{execute}}

<pre class ="file">
 NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
 loop1           7:1    0   10G  0 loop
 loop2           7:2    0   10G  0 loop
</pre>

You should now see loop1 and loop2 devices reported in the output of `lsblk`. These correspond to the two loopback device you configured with the `losetup` command. When these block devices are written to, the data will be stored in the /tmp/myfile1.trunc and /tmp/myfile2.truc files backing these loopback block devices.

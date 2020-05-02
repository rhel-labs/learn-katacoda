# Locate an empty block device

A block storage device (blockdev) is a device that can read and write data in “blocks” of a given size.
We'll need to obtain empty blockdevs for this tutorial.

To do that, first use the lsblk utility to view a list of blockdevs on your machine.

`lsblk`{{execute}}

Within the list of of blockdevs, locate an empty blockdev. You can check if a blockdev is empty using the blkid utility.

In this tutorial, we will instead create a temporary loopback device for this purpose.

`truncate -s 10g /tmp/myfile.trunc`{{execute}}

`losetup /dev/loop1 /tmp/myfile.trunc`{{execute}}

Check that the loopback device has been created.

`lsblk`{{execute}}

We will need a few more blockdevs for our examples, so let's set up two more.

`truncate -s 10g /tmp/myfile2.trunc`{{execute}}

`truncate -s 15g /tmp/myfile3.trunc`{{execute}}

`losetup /dev/loop2 /tmp/myfile2.trunc`{{execute}}

`losetup /dev/loop3 /tmp/myfile3.trunc`{{execute}}

Check that all three devices are displayed.

`lsblk`{{execute}}

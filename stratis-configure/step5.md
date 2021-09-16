# Add a block device to an existing pool

All pools contain a data tier, which contains one or more block devices used to store data. The block devices used to create the pool belong to the pool's data tier.

You can add additional block devices to a pool as data devices, thereby increasing the disk space provided to the Stratis pool. This is helpful when you have exhaused the available space initially allocated to the pool.

The pool you created, my_pool, has 10 GiB of space. Add /dev/loop2 as a data device to my_pool.

`stratis pool add-data my_pool /dev/loop2`{{execute}}

Now list the pools.

`stratis pool list`{{execute}}

<pre class="file">
Name                      Total Physical   Properties
my_pool   20 GiB / 41.64 MiB / 19.96 GiB      ~Ca,~Cr
</pre>

You should see that my_pool now has a size of 20 GiB.

# List block devices

Now that the pool consists of multiple block devices, it may be useful to find out which block devices belong to which pools.

`stratis blockdev list`{{execute}}

<pre class="file">
 Pool Name  Device Node  Physical Size  Tier
 my_pool    /dev/loop1          10 GiB  Data
 my_pool    /dev/loop2          10 GiB  Data
</pre>

You can see that both /dev/loop1 and /dev/loop2 belong to my_pool.

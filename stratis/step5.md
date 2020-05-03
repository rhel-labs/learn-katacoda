# Add a block device as a data device to an existing pool

All pools contain a Data Tier, which contains one or more blockdevs used to store data. The blockdev used to create the pool belongs to the pool's data tier. We can add additional blockdevs to a pool as data devices.

Add /dev/loop2 as a data device to my_pool.

`stratis pool add-data my_pool /dev/loop2`{{execute}}

Now list pools. You should see that my_pool has a size of 20GiB

`stratis pool list`{{execute}}

# List block devices

Query which block devices belong to a pool.

`stratis blockdev list my_pool`{{execute}}

Note: Stratis also allows for an optional Cache Tier. This feature is not covered in the scope of this tutorial.


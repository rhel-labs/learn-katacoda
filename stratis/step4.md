# Create a pool with the block device

A pool is a quantity of storage set aside by an administrator. A Stratis pool is created from one or more blockdevs. All pools must have a name; we will name our pool my_pool.

Let's create my_pool from the blockdev that we just identified, /dev/loop1.

`stratis pool create my_pool /dev/loop1`{{execute}}

Note: If you now run blkid, you can see that /dev/loop1 is now in use and that it's type is "stratis".
The other two loopback devices are not in use, and therefore are not listed.

`blkid`{{execute}}

# List pools

At any point, you may list all existing Stratis pools.

`stratis pool list`{{execute}}

You should see the pool that you just created in the last step.

# Create a filesystem from the pool

A filesystem is a hierarchy of directories that is used to organize files on a storage media. Multiple Stratis filesystems may be created from a pool. Like pools, all filesystems must have a name; we will name our filesystem my_first_fs.

Let's create my_first_fs from the pool that we just created, my_pool.

`stratis filesystem create my_pool my_first_fs`{{execute}}

At any point, you may list all existing Stratis filesystems.

`stratis filesystem list`{{execute}}

Tip: There's a shorter version of the filesystem listing command.

`stratis fs`{{execute}}

You should see the filesystem that you just created in the last step.

# Rename a filesystem

You can rename filesystems with with the following command:

`stratis filesystem rename my_pool my_first_fs my_fs`{{execute}}

A filesystem list command will now yield the filesystem with its new name:

`stratis fs`{{execute}}

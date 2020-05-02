# Snapshot a filesystem

To create a snapshot of a filesystem, i.e. a read/writeable thinly provisioned point in time copy of the source filesystem, you'll need the name of the pool in which the filesystem is located, the name of the filesystem, and the name of the snapshot of the filesystem.

Here is an example of how a snapshot can be used. Let's create two files.

`touch /mnt/test_mnt/my_first_file`{{execute}}

`touch /mnt/test_mnt/my_second_file`{{execute}}

Check that the files have been created.

`ls /mnt/test_mnt`{{execute}}

Create a snapshot of the filesystem. This snapshot will be named my_snapshot.

`stratis filesystem snapshot my_pool my_fs my_snapshot`{{execute}}

Now, delete the first file and check that the file has been deleted.

`rm -f /mnt/test_mnt/my_first_file`{{execute}}

`ls /mnt/test_mnt`{{execute}}

We can now mount the snapshot and get access to both files, since the snapshot was created before the first file was deleted.

`mount /stratis/my_pool/my_snapshot /mnt/test_mnt`{{execute}}

Both files are now listed!

`ls /mnt/test_mnt`{{execute}}


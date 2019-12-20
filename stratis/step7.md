# Mount the filesystem

Mounting a filesystem means making the particular filesystem accessible at a certain point in the Linux directory tree. Your filesystem, by default, is unmounted and thus cannot be used to store, read from, or write to files.

Choose a mount point, the directory in which the filesystem will be mounted. Note that if you do not choose an empty directory, the directory's previous contents will become hidden until the filesystem is unmounted. We'll mount our filesystem, my_fs, in the directory /mnt/test_mnt.

`mkdir /mnt/test_mnt`{{execute}}

`mount /stratis/my_pool/my_fs /mnt/test_mnt`{{execute}}

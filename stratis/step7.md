# Mount a filesystem

Mounting a filesystem means making the particular filesystem accessible at a certain point in the Linux directory tree. Your filesystem is unmounted, and cannot be used to store, read from, or write to files.

Choose a mount point, the directory in which the filesystem will be mounted. You will mount the filesystem, my_fs, in the directory /mnt/test_mnt

`mkdir /mnt/test_mnt`{{execute}}

Mount the filesystem using the `mount` command.

`mount /stratis/my_pool/my_fs /mnt/test_mnt`{{execute}}

The mount point, /mnt/test_mnt, will now be the root directory of the filesystem.

>__Warning:__ If you do not choose an empty directory, the directory's previous contents will become hidden until the filesystem is unmounted.

Confirm that the filesystem has been mounted by running the mount command.

`mount`{{execute}}

<pre class="file">
 << OUTPUT ABRIDGED >>

 /dev/mapper/stratis-1-ab995c9fa31e43a281322465a744c911-thin-fs-0f808d165a264b779cb9108f7176c098 on /mnt/test_mnt type xfs (rw,relatime,seclabel,attr2,inode64,sunit=2048,swidth=2048,noquota)
</pre>

From the above output, you can see that the filesystem is now mounted successfully in the /mnt/test_mnt directory.

# Create files on mounted filesystem

Create two empty files in the filesystem, my_fs.

`touch /mnt/test_mnt/my_first_file`{{execute}}

`touch /mnt/test_mnt/my_second_file`{{execute}}

Check that the files have been created.

`ls /mnt/test_mnt`{{execute}}

<pre class="file">
 my_first_file  my_second_file
</pre>

Both files are now accessible in the /mnt/test_mnt directory.

# Create a snapshot

A snapshot of a filesystem is a read/writeable thinly provisioned point in time copy of the source filesystem. To create a snapshot, you will need the name of the pool in which the filesystem is located, the name of the filesystem, and the name of the snapshot of the filesystem.

Create a snapshot of the filesystem. Name the snapshot __my_snapshot__.

`stratis filesystem snapshot my_pool my_fs my_snapshot`{{execute}}

Check that the snapshot was created successfully by listing the stratis filesystems.

`stratis fs`{{execute}}

<pre class="file">
 Pool Name  Name         Used     Created            Device                        UUID
 my_pool    my_fs        546 MiB  May 08 2020 12:19  /stratis/my_pool/my_fs        0f808d165a264b779cb9108f7176c098
 my_pool    my_snapshot  546 MiB  May 08 2020 12:29  /stratis/my_pool/my_snapshot  cf5ac541bb7440a9b1cf5b2ebe936f05
</pre>

You should see my_snapshot listed in the output.

# Access the snapshot to recover files

Here is an example of how a snapshot can be used to recover deleted files from a filesystem.

Delete the first file that you created in the previous step.

`rm -f /mnt/test_mnt/my_first_file`{{execute}}

Check that my_first_file has been deleted.

`ls /mnt/test_mnt`{{execute}}

<pre class="file">
 my_second_file
</pre>

You can see that my_first_file has been removed from the directory, and only my_second_file remains.

You can now mount the snapshot and get access to both files, since the snapshot was created before the file was deleted.
First, create a new mountpoint to attach the snapshot into the filesystem, /mnt/test_mnt_snap.

`mkdir /mnt/test_mnt_snap`{{execute}}

Next, mount the snapshot, my_snapshot.

`mount /stratis/my_pool/my_snapshot /mnt/test_mnt_snap`{{execute}}

Confirm that the snapshot was mounted successfully.

`mount`{{execute}}

<pre class="file">
 << OUTPUT ABRIDGED >>
 /dev/mapper/stratis-1-ab995c9fa31e43a281322465a744c911-thin-fs-cf5ac541bb7440a9b1cf5b2ebe936f05 on /mnt/test_mnt_snap type xfs (rw,relatime,seclabel,attr2,inode64,sunit=2048,swidth=2048,noquota)
</pre>

From the output above, the snapshot is mounted on /mnt/test_mnt_snap.

List the files stored within the snapshot on /mnt/test_mnt_snap.

`ls /mnt/test_mnt_snap`{{execute}}

<pre class="file">
 my_first_file  my_second_file
</pre>

Both files are listed!

# Copy the file back to the original filesystem

Now that you have access to the previously deleted file, my_first_file, you may want to copy it back into the original filesystem, my_fs.

To do this, copy the file, my_first_file back into the original filesytem.

`cp /mnt/test_mnt_snap /my_first_file /mnt/test_mnt`{{execute}}

Lastly, confirm that my_first_file has been copied to /mnt/test_mnt.

`ls /mnt/test_mnt`{{execute}}

<pre class="file">
 my_first_file my_second_file
</pre>

The filesystem, my_fs, now contains the previously deleted file, my_first_file.

We can see that the Used went up from 4.0G to 5.0G
and the Space saving is 4%.

The output of df show 1.8G being used. 1G is from the new file
That was just created and the 800M was from the filesystems
metadata.


`df -h|grep vdo`{{execute}}

<pre class="file">
# df -h /dev/mapper/vdo1
/dev/mapper/vdo1       100G  1.8G   99G   2% /data
</pre>

Make 4 copies of the file to demonstrate having duplicate data 
in the filesystem.

`for i in 2 3 4 5; do echo "copy $i";cp file.1 file.$i; done`{{execute}}

We can see that the Used went up from 4.0G to 5.0G
and the Space saving is 4%.

The output of df show 1.8G being used. 1G is from the new file
That was just created and the 800M was from the filesystems
metadata.


`df -h|grep vdo`{{execute}}

<pre class="file">
# df -h|grep vdo
/dev/mapper/vdo1       100G  1.8G   99G   2% /data
</pre>

`for i in 2 3 4 5; do cp file.1 file.$i; done`{{execute}}


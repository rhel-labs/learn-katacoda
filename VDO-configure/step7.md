Run the sync command to flush any data in the file system’s page cache 
to VDO.


`sync`{{execute}}

Review the output of df -h and vdostats to see the space savings.          

`df -h /dev/mapper/vdo1`{{execute}}

<pre class="file">
# df -h|grep vdo
/dev/mapper/vdo1       100G  5.7G   95G   6% /data
</pre>

We can see that df is reporting 5.7G used from the 5, 1G files created.

Now to look at the output of vdostats.


`vdostats --human-readable`{{execute}}

<pre class="file">
# vdostats --human-readable
Device                    Size      Used Available Use% Space saving%
/dev/mapper/vdo1         10.0G      5.0G      5.0G  49%           80%
</pre>

The Used amount hasn’t changed since the creation of the first file.
The space savings is now reporting 80%!  

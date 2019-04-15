te the VDO volume.  

VDO uses thin-provisioning to help achieve space 
savings. VDO will need to present a device to the
filesystem that is larger than the physical size, since 
deduplication will map multiple (duplicate) logical blocks
to the same physical block. To do this set the 
vdoLogicalSize to an amount larger than 10GB, such as,
100GB.

In this example we will set the VDO volume to be
10X the size of /dev/loop1, or 100GB.

`vdo create --name=vdo1 --device=/dev/loop1 --vdoLogicalSize=100G`{{execute}}

<pre class="file">
# vdo create --name=vdo1 --device=/dev/loop1 --vdoLogicalSize=100G
Creating VDO vdo1
Starting VDO vdo1
Starting compression on VDO vdo1
VDO instance 1 volume is ready at /dev/mapper/vdo1
</pre>

VDO volume has been created at /dev/mapper/vdo1. View the volume
using vdostats --human-readable
  
`vdostats --human-readable`{{execute}}

<pre class=”file”>
# vdostats --human-readable
Device                    Size      Used Available Use% Space saving%
/dev/mapper/vdo1         10.0G      4.0G      6.0G  40%            0%
</pre>

The volume has 0% space savings and there is 4G used, which is
reserved space for metadata.  

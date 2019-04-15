Install vdo

`dnf install -y vdo`{{execute}}

VDO provides block level, inline data reduction for Linux in the form of deduplication,
compression, and thin provisioning.  VDO is currently delivered as two packages: 
* kmod-kvdo (kernel modules),
* vdo (user-space utilities).  
VDO can be used with local or cloud storage, to be the backing storage for products, 
such as, Filesystems, Ceph, iSCSI, and fibre channel.

VDO is comprised of:
  Two Kernel modules
    * kvdo     - manages block storage and compression
    * uds      - manages the deduplication index  
  User space utilities
    vdo      - vdo manager used to create, remove or modify volumes
    vdostats - view volume statistics

Detailed information on VDO can be found in the man page

`man vdo` {{execute}}

Use the 'q' key to exit the man page.

Also, each of the statistics for vdostats can be found in the man page.

`man vdostats` {{execute}}

Use the 'q' key to exit the man page.


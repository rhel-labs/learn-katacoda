# Overview:

Stratis is a local storage-management solution for Linux that can assist with the initial configuration and ongoing management of storage. Stratis incorporates a simple and easy to use interface, while simultaneously providing the advanced capabilities of a volume managing filesystem.

Stratis provides a variety of storage management features by integrating layers of existing technologies:
* the device mapper framework
* the XFS filesystem

Stratis automates the management of local storage. On a system with just a single disk, Stratis can make it more convenient to logically separate /home from /usr, and enable snapshot with rollback on each separately. On larger configurations, Stratis can make it easier to create a multi-disk, multi-tiered storage pool, monitor the pool, and then manage the pool with less administrator effort.

# Goal:

After completing this scenario, users will be able to manage local storage with the Stratis CLI.

# Concepts included in this scenario:

* Installing, enabling, and starting Stratis
* Locating empty block devices
* Creating pools and filesystems
* Adding block devices to an existing pool
* Creating snapshots of a filesystem

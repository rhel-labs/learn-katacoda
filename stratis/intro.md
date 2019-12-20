# Overview:

Stratis is a local storage-management solution for Linux that can assist with the initial configuration and ongoing management of storage. Stratis incorporates a simple and easy to use interface, while simultaneously providing the advanced capabilities of a volume managing filesystem.

Stratis provides a variety of storage management features by integrating layers of existing technologies:
* the device mapper framework
* the XFS filesystem

Stratis consists of two components.

First, the Stratis daemon, stratisd:
* manages collections of block devices
* provides a D-Bus API

Second, the Stratis command-line interface, stratis-cli:
* uses the D-Bus API to communicate with stratisd

# Goal:

After completing this scenario, users will be able to manage local storage with the Stratis CLI.

# Concepts included in this scenario:

* Installing Stratis

* Enabling and starting Stratis

* Querying stratisd and stratis-cli versions

* Locating empty block devices

* Creating pools and filesystems

* Listing pools and filesystems

* Renaming filesystems

* Mounting filesystems

* Adding block devices to an existing pool

* Listing block devices

* Creating snapshots of a filesystem

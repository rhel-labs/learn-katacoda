# Overview:

Policy-based Decryption (PBD) is a collection of technologies that enable automated unlocking of encrypted volumes of hard drives on physical and virtual machines using a variety of unlocking methods. When the unlocking method uses a special network server, we call it Network-Bound Disk Encryption (NBDE).

NBDE requires a special network server. In RHEL, this server is called `tang`. On the client side, `clevis` is the software that we will use as a countepart of `tang`.

# Goal:

After completing this scenario, users will learn how to setup Network-Bound Disk Encryption (NBDE) with `clevis` and `tang` for automated unlocking of encrypted devices during boot.

# Concepts included in this scenario:
- Setting up `tang` and `clevis`
- Checking whether there are any encrypted (LUKS) devices and what are their device names
- Using `clevis` to bind encrypted (LUKS) devices to `tang`
- Enabling auto-unlocking of encrypted (LUKS) devices on boot

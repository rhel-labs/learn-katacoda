
# Enabling automated unlocking of encrypted devices on boot

To enable automated unlocking of LUKS devices on boot, we need to make sure there is a `clevis` binding for each of these devices to a tang server, which we did in the previous steps, and then we need to rebuild our initramfs to include the `clevis` machinery required to to the unlocking.

For completeness, we need to also enable a specific `systemd` unit that will attempt to unlock any other encrypted devices that are bound with clevis -- this unlock step happens late in the boot process; usually non-root devices are unlocked at this point, e.g. an encrypted `/home`. We can enable this late-boot unlocking step by issuing the following command:

`systemctl enable clevis-luks-askpass.path`{{execute}}

And finally, since `clevis` needs to be able to reach the `tang` server during early boot, we need to actually enable networking there, which can be done with a `dracut` configuration file.

## Enabling networking in early boot

By default, there is no network available in early boot, but if we need it, we can request it from `dracut` with some additional configuration. This is the case here: we want to use a `tang` server, so we require network in early boot, to be able to reach it for the automated unlocking step.

We can do that by creating a `.conf` file within `/etc/dracut.conf.d/` with the following content:
`kernel_cmdline="rd.neednet=1"`. This indicates to `dracut` that we want networking available early on during the boot process.

Please issue the following command to create this configuration file:

`echo 'kernel_cmdline="rd.neednet=1"' | sudo tee /etc/dracut.conf.d/clevis.conf`{{execute}}

We can now regenerate the initramfs, which will both add the `clevis` machinery required for the
unlocking and also enable networking in early boot, as per our `dracut` configuration file.
To do that, please issue the following command, and have in mind that this command may take a little while to complete:

`dracut -f --regenerate-all`{{execute}}

## Let's test it all: reboot the machine

To check whether everything worked, at this point we can simply reboot the clevis machine and watch it booting up -- **remember to not type the LUKS passphrase this time, when prompted**:

`reboot`{{execute}}

The machine should reach the login prompt _without your intervention_, which means the NBDE setup
was performed successfully and the encrypted device was unlocked automatically.

![login prompt](./assets/rhel84-login.png)

Note that if `tang` server `192.168.122.1` is not available, the automated unlocking step will not
complete, which means that you will have to enter a valid LUKS passphrase yourself, just like in a regular
boot without NBDE -- `/dev/vda2` is bound to a specific network server, and from this comes the
name _Network-Bound Disk Encryption_ (NBDE).

This completes our training scenario.

# Enable and Start the Stratis Daemon

Now, enable and start the stratisd systemd service using the `systemctl` utility.

`systemctl --now enable stratisd`{{execute}}

At any point, you may also check the status of stratisd.

`systemctl status stratisd --no-pager`{{execute}}

<pre class="file">
 stratisd.service - A daemon that manages a pool of block devices to create flexible file systems
 Loaded: loaded (/usr/lib/systemd/system/stratisd.service; enabled; vendor preset: enabled)
 Active: active (running) since Thu 2020-05-07 15:11:21 EDT; 1s ago

<< OUTPUT ABRIDGED >>
</pre>

If stratisd is running, you should see the Active: information report `active (running)` as it is shown in the above output from the `systemctl status` command.

Additionally, you can connect to the running daemon and have it report its version.

`stratis daemon version`{{execute}}

<pre class="file">
 2.3.0
</pre>

In the above output, the daemon reports that the version of stratisd is 2.3.0.

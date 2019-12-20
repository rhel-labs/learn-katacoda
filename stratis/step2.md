# Start and enable Stratis

Now, enable and start the stratisd systemd service using the systemctl utility.

`systemctl enable stratisd`{{execute}}

`systemctl start stratisd`{{execute}}

At any point, you may also check the status of stratisd.

`systemctl status stratisd`{{execute}}

If a stratisd service in an active state is listed, then stratisd is running.

You may also check the stratisd version.

`stratis daemon version` {{execute}}

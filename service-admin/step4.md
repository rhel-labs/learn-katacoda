# Enabling a service with `systemctl` to make it persistent

If you want a service to run every time you boot the system, you have to enable
that service. This is done with the following command:

`systemctl enable firewalld`{{execute}}

There is no output, but you can confirm this succeeded with the following command:

`systemctl is-enabled firewalld`{{execute}}

<pre class=file>
enabled
</pre>

This means that the __firewalld__ process will start every time the system starts.

# __systemd__ Cheat Sheet

This lab just scratches the surface of __systemd__'s capabilities. Red Hat provides a
[systemd Cheat Sheet](https://access.redhat.com/articles/systemd-cheat-sheet)
which has a variety of other commands that are useful for service management.

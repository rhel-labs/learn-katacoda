# Configuring DNS

Return to `host01` so that you can modify the connection a bit more.
Now you will add DNS addresses using `nmcli con modify`.
Visit [this article](https://www.redhat.com/sysadmin/dns-domain-name-servers)
to learn what DNS is and why it is useful. 

`nmcli con modify ethernet1 ipv4.dns 172.17.0.254`{{execute T2}}

This modification will only show up in the proper config file, `/etc/resolv.conf`,
once the connection is restarted. This is done the same way the connection
was activated in the start of this lab, using the `nmcli con up` command.

`nmcli con up ethernet1`{{execute T2}}

Now you can see these changes reflected in the connection's config file:

`grep 'nameserver' /etc/resolv.conf`{{execute T2}}

<pre class=file>
nameserver 8.8.8.8
nameserver 172.17.0.254
</pre>

>_NOTE:_ The nameserver __8.8.8.8__ is configured in this config by default.

It is common to want multiple DNS addresses associated with a connection. You
can add multiple DNS addresses by enclosing the set of addresses in quotes:

`nmcli con modify ethernet1 ipv4.dns "172.17.0.254 8.8.4.4"`{{execute T2}}

As before, restart the connection.

`nmcli con up ethernet1`{{execute T2}}

Now the new DNS address shows up in `resolv.conf`:

`grep 'nameserver' /etc/resolv.conf`{{execute T2}}

<pre class=file>
nameserver 8.8.8.8
nameserver 172.17.0.254
nameserver 8.8.4.4
</pre>

This is just the surface of what `nmcli` can modify. The
[Red Hat Customer Portal](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmcli)
has documentation on the full capabilities of NetworkManager.

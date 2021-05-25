# Static IP configuration

Now that you have an existing connection, here is how to modify it to use a static IP.
Static IP connections are useful in cases where you want to ensure the
IP address will not change over time. DHCP clients can reconfigure what IPs
are being used by hosts under their control, which could interfere with
network operations where the address is expected not to change.

NetworkManager has another option that can be used with the `nmcli con` command
to change properties of an existing connection, `nmcli con modify`.
The first step in converting your dynamic connection to a static connection
is to change the connection method from DHCP to manual:

`nmcli con modify ethernet1 ipv4.method manual`{{execute "node01"}}

This removes the DHCP protocol from the configuration file, which you can
confirm by repeating the config search done in the previous step:

`egrep 'BOOTPROTO' /etc/sysconfig/network-scripts/ifcfg-ethernet1`{{execute "host01"}}

<pre class=file>
BOOTPROTO=none
</pre>

Assign the existing connection a specified IP, in this case `172.17.0.9`, by
once again using the `modify` option:

`nmcli con modify ethernet1 ipv4.addresses 172.17.0.9`{{execute "node01"}}

This line will not generate an output, so you should run an expanded validation
search. The search below also includes the `IPADDR` field:

`egrep 'BOOTPROTO|IPADDR' /etc/sysconfig/network-scripts/ifcfg-ethernet1`{{execute "host01"}}

<pre class=file>
BOOTPROTO=dhcp
IPADDR=172.17.0.9
</pre>

>_NOTE:_ Modifying the ipv4 address field without specifying a netmask
(i.e. `/24` appended to the IP) will default to `/32`, or only a single IP address.

You now have a barebones connection with a static IP, so the next step will
walk you through activating and testing it.

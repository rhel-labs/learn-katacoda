# Static IP configuration

Now that you have an existing connection, modify it to use a static IP.

Assign the existing connection a specified IP, in this case `172.17.0.9`:

`nmcli con modify ethernet1 ipv4.addresses 172.17.0.9`{{execute "node01"}}

This line will not generate an output, but if you rerun the search from last page
you can see the `IPADDR` field has been set:

`cat /etc/sysconfig/network-scripts/ifcfg-ethernet1 | grep 'BOOTPROTO\|IPADDR'`{{execute "host01"}}

<pre class=file>
BOOTPROTO=dhcp
IPADDR=172.17.0.9
</pre>

>_NOTE:_ Modifying the ipv4 address field without specifying a netmask
(i.e. `/24` appended to the IP) will default to `/32`, or only a single IP address.

There is an issue, though. The connection protocol is still DHCP. The next step
is to change the connection method to manual so that the connection uses the
IP we specified.

`nmcli con modify ethernet1 ipv4.method manual`{{execute "node01"}}

This removes the DHCP protocol from the configuration file:

`cat /etc/sysconfig/network-scripts/ifcfg-ethernet1 | grep 'BOOTPROTO\|IPADDR'`{{execute "host01"}}

<pre class=file>
BOOTPROTO=none
IPADDR=172.17.0.9
</pre>

You now have a barebones connection with a static IP, so the next step will
walk you through activating and testing it.

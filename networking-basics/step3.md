# Static IP configuration

Now that you have an existing connection, here is how to modify it to use a static IP.
Static IP connections are useful in cases where you want to ensure the
IP address will not change over time. DHCP clients can reconfigure what IP addresses
are being used by hosts under their control, which could interfere with
network operations where the address is expected not to change.

NetworkManager has an option that can be used with the `nmcli con` command
to change properties of an existing connection, `nmcli con modify`.
The first step in converting your dynamic connection to a static connection
is to specify an IP for the connection to use. Assign the existing connection
the IP `172.17.0.9` using the `modify` option:

`nmcli con modify ethernet1 ipv4.addresses 172.17.0.9`{{execute T2}}

This line will not generate an output, so you should run an expanded validation
search. The search below also includes the `IPADDR` and `PREFIX` fields,
which will show you which network and subnet mask you have applied to the
connection:

`egrep 'BOOTPROTO|IPADDR|PREFIX' /etc/sysconfig/network-scripts/ifcfg-ethernet1`{{execute T2}}

<pre class=file>
BOOTPROTO=dhcp
IPADDR=172.17.0.9
PREFIX=32
</pre>

>_NOTE:_ Modifying the ipv4 address field without specifying a subnet mask (also
called a prefix) will default to `/32`, or only a single IP address. If you wish
to add a different subnet mask, for example `/24`, append it to the IP address
in the `nmcli con modify` command.

`nmcli con modify ethernet1 ipv4.method manual`{{execute T2}}

This removes the DHCP protocol from the configuration file but leaves the,
other connection properties unchanged, which you can confirm by repeating
the config search done in the previous step:

`egrep 'BOOTPROTO|IPADDR|PREFIX' /etc/sysconfig/network-scripts/ifcfg-ethernet1`{{execute T2}}

<pre class=file>
BOOTPROTO=none
<< OUTPUT ABRIDGED >>
</pre>

Besides the IP and subnet mask, you will typically have a gateway address for
your connection as well. The same `nmcli con modify` command can be used
to configure the gateway:

`nmcli con modify ethernet1 ipv4.gateway 172.17.0.1`{{execute T2}}

The change will be visible in the same config file:

`grep 'GATEWAY' /etc/sysconfig/network-scripts/ifcfg-ethernet1`{{execute T2}}

<pre class=file>
GATEWAY=172.17.0.1
</pre>

>_NOTE:_ You can combine multiple modifications into a single command by
appending each additional property you want to change. For example, this command
would accomplish all of the changes from this page in one line:
`nmcli con modify ethernet1 ipv4.addresses 172.17.0.9 ipv4.gateway 172.17.0.1 ipv4.method manual`

You now have a bare-bones connection with a static IP, so the next step will
walk you through activating and testing it.

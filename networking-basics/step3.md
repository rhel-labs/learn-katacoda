# Static IP configuration

Now that we have an existing connection, let’s modify it to use a static IP.

Assign the existing connection a specifed IP, in this case `172.17.0.9`:

`nmcli con modify ethernet1 ipv4.addresses 172.17.0.9`{{execute "node01"}}

This line will not generate an output, but if we rerun the search from last page
you can see the `IPADDR` field has been set:

<pre class=file>
BOOTPROTO=dhcp
IPADDR=172.17.0.9
</pre>

**Note**: Modifying the ipv4 address field without specifying a netmask
(i.e. `/24` appended to the IP) will default to `/32`, or only a single IP address.

There is an issue though, the connection protocol is still DHCP. The next step
is to change the connection method to manual so that the connection uses the
IP we specified.

`nmcli con modify ethernet1 ipv4.method manual`{{execute "node01"}}

This removes the DHCP protocol from the configuration file:

<pre class=file>
BOOTPROTO=none
IPADDR=172.17.0.9
</pre>

We now have a barebones connection with a static IP, so let’s activate it:

`nmcli con up ethernet1`{{execute "node01"}}

The output shows that the connection was successfully activated:

<pre class=file>
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/5)
</pre>

In the next step we will run a test to confirm that we can actually send
data over this connection we just activated.  

# Activating the connection

Run the `nmcli con up` command to activate the static connection that you
configured in the previous step:

`nmcli con up ethernet1`{{execute T2}}

The output shows that the connection was successfully activated:

<pre class=file>
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/5)
</pre>

To verify this, the next step is a test to confirm that you can actually send
data over this connection you activated.  

# Testing the connection

You will now ping the IP for the configured connection to verify that
the static IP is associated with `host01`. This must be done from a different
host, so switch to __host02__ by clicking the *host02* tab in the lab interface.

Run the `ping` command from the terminal for __host02__ to send three IP
packets asking the host at `172.17.0.9` to respond:

`ping 172.17.0.9 -c 3`{{execute T3}}

You will see that `host01` replies to all three of the pings you sent:

<pre class=file>
PING 172.17.0.9 (172.17.0.9) 56(84) bytes of data.
64 bytes from 172.17.0.9: icmp_seq=1 ttl=64 time=0.273 ms
64 bytes from 172.17.0.9: icmp_seq=2 ttl=64 time=0.330 ms
64 bytes from 172.17.0.9: icmp_seq=3 ttl=64 time=0.327 ms

--- 172.17.0.9 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 28ms
rtt min/avg/max/mdev = 0.078/0.081/0.084/0.007 ms
</pre>

The final step is to learn how to configure the DNS server addresses
for the connection.  

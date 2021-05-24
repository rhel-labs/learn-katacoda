# Testing the connection

We will now ping the IP for our configured connection verify that
the static IP we just configured returns our ping.
Run the following command from the terminal for `host02`:

`ping 172.17.0.9 -c 3`{{execute "host02"}}

You will see that `host01` replies to all three of the pings we sent:

<pre class=file>
PING 172.17.0.9 (172.17.0.9) 56(84) bytes of data.
64 bytes from 172.17.0.9: icmp_seq=1 ttl=64 time=0.273 ms
64 bytes from 172.17.0.9: icmp_seq=2 ttl=64 time=0.330 ms
64 bytes from 172.17.0.9: icmp_seq=3 ttl=64 time=0.327 ms

--- 172.17.0.9 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 28ms
rtt min/avg/max/mdev = 0.078/0.081/0.084/0.007 ms
</pre>

The final step is to learn how to configure the DNS server addresses and hostname
for the connection.  

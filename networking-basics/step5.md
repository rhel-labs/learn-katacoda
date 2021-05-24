# Configuring gateway, DNS, and hostname

The process of using `nmcli modify` is exactly the same for any property you
want to change. Returning to `host01`, lets modify our connection a bit more.
You can change multiple properties in the same modify connection, shown here
for gateway, DNS, and hostname:

`nmcli con modify ethernet1 ipv4.gateway 172.17.0.1 ipv4.dns 172.17.0.254 ipv4.dhcp-hostname lab-server`{{execute "host01"}}

You can see these changes reflected in the config:

`cat /etc/sysconfig/network-scripts/ifcfg-ethernet1 | grep 'GATEWAY\|DNS1\|DHCP_HOSTNAME'`{{execute "host01"}}

<pre class=file>
GATEWAY=172.17.0.1
DNS1=172.17.0.254
DHCP_HOSTNAME=lab-server
</pre>

The full list of properties you can change is available in the
[Red Hat Customer Portal](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmcli)
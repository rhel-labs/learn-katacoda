# Starting and stopping a service with `systemctl`

Check which services are allowed to communicate by __firewalld__.

`firewall-cmd --list-services`{{execute}}

<pre class=file>
cockpit dhcpv6-client ssh
</pre>

To configure __firewalld__ to recognize __http__ on top of these, run this command:

`firewall-cmd --permanent --add-service=http`{{execute}}

<pre class=file>
success
</pre>

At a first glance, the _success_ message suggests you are done. This is where
the lesson about services comes in, though. Checking for this
configuration change right away does not reflect the service you just added:

`firewall-cmd --list-services`{{execute}}

<pre class=file>
cockpit dhcpv6-client ssh
</pre>

Restart the service to run the service with the configuration file:

`systemctl restart firewalld`{{execute}}

There is no output, but this will re-read the configuration files associated with
the service. Any changes will now be reflected. List the __firewalld__ services
one more time:

`firewall-cmd --list-services`{{execute}}

<pre class=file>
cockpit dhcpv6-client http ssh
</pre>

This list now includes __http__.

>_Note:_ If you just wanted to either start or stop a service, `systemctl start`
or `systemctl stop` followed by the service name will do this.

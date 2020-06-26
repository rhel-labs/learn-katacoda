# Reconcile service issues

You will need to restart the Apache service after changing the system-wide
crypto policy so that it runs under the new policy.   

> **NOTE:** Red Hat recommends rebooting the system for all services to be
initialized with the new cryptographic policy, however, for this exercise you
will be individually working with the Apache web service.

`systemctl restart httpd.service`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Wed 2019-07-17 09:54:40 EDT; 2s ago

<< OUTPUT ABRIDGED >>
</pre>

Now that the service is running and certificates used comply with the modified **FUTURE** policy 
that supports shorter key lengths, connect to the Apache service and validate the bit length of 
the certificate is being offered to client browsers.   

`openssl s_client -connect localhost:443 </dev/null 2>/dev/null | grep '^Server public key'`{{execute T1}}

<pre class="file">
Server public key is 2048 bit
</pre>

# Modify the DEFAULT crypto policy

The Chief Security Officer sends out the following e-mail:
<pre class="file">
Application and Infrastructure Administrators,

After my last email recommending 3072 bit public keys, I have received few 
concerns that some applications would need additional time for migration.

To continue supporting these applications running on our platform, and 
to provide more time for these applications to upgrade, my recommendation 
is to disallow TLS (1.0, and 1.1), and not allow SHA-1 hash usage.

**NOTE** We should still allow 2048 bit ciphers usage for a certain period of 
time until all applications can be upgraded to use 3072 bit keys.

-CSO
</pre>

As it happens, all of these requirements can be configured and enforced using
system-wide cryptographic policies that come with Red Hat Enterprise Linux, by 
customizing it.

In order to comply with the requirements set forth by the CSO above, you will 
update the system to modify the **FUTURE** policy and modify it to support shorter keys 
of 2048 bit length as the minimum key length in the **FUTURE** policy is set to 3072-bit. 

Let us update the system wide crypto policies to FUTURE and check if it breaks apache -

`update-crypto-policies --set FUTURE`{{execute T1}}

You can now verify that the new policy, FUTURE, has been applied to the system.    

`update-crypto-policies --show`{{execute T1}}

You will need to restart the Apache service after changing the system-wide
crypto policy so that it runs under the new policy.   

> **NOTE:** Red Hat recommends rebooting the system for all services to be
initialized with the new cryptographic policy, however, for this exercise you
will be individually working with the Apache web service.

`systemctl restart httpd.service`{{execute T1}}

<pre class="file">
Job for httpd.service failed because the control process exited with error code.
See "systemctl status httpd.service" and "journalctl -xe" for details.
</pre>

The Apache service fails to restart.  You can see a more specific error 
message in the SSL error log for Apache.  You will further diagnose this
using the error messages from the command below and reconcile this in 
additional steps in the exercise.

`tail -2 /var/log/httpd/ssl_error_log`{{execute T1}}

<pre class="file">
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] AH02562: Failed to configure certificate fe80::42:acff:fe11:b:443:0 (with chain), check /etc/pki/tls/certs/localhost.crt
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] SSL Library Error: error: 140AB18F: SSL routines: SSL_CTX_use_certificate:ee key too small
</pre>

Let us create a policy modifier module called **2048KEYS.pmod** that can be used 
with our crypto policies : 

`touch /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

In the created policy modifier file, let us reduce the size of RSA and DH cipher lengths 

`echo "min_dh_size = 2048" > /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

`echo "min_rsa_size = 2048" >> /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

Let us configure the system to use a modified **FUTURE** policy with our newly created policy modifier -

`update-crypto-policies --set FUTURE:2048KEYS`{{execute T1}}

<pre class="file">
Setting system policy to FUTURE:2048KEYS
Note: System-wide crypto policies are applied on application start-up.
It is recommended to restart the system for the change to policies
to fully take place.
</pre>

You can now verify that the new policy has been applied to the system.    

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
FUTURE:2048KEYS
</pre>

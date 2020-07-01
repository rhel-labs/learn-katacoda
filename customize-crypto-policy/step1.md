# Modify the FUTURE crypto policy

The Chief Security Officer sends out the following e-mail -
<pre class="file">
Application and Infrastructure Administrators,

After my last e-mail recommending 3072 bit public keys, I have received few 
concerns that some applications would need additional time for migration.

To continue supporting these applications running on our platform, and 
to provide more time for these applications to upgrade, my recommendation 
is to disallow TLS (1.0, and 1.1), and not allow SHA-1 hash usage.

**NOTE** We should still allow 2048 bit ciphers usage for a certain period of 
time until all applications can be upgraded to use 3072 bit keys.

-CSO
</pre>

In order to comply with the requirements set forth by the CSO above, you will 
update the system to modify the **FUTURE** policy to support shorter keys 
of 2048 bit length. By default, the minimum key length in the **FUTURE** policy is set to 3072-bit. 

You will now check the currently active crypto policy in effect on the system - 

`update-crypto-policies --show`{{execute T1}}

You will now check the status of the Apache service -

`systemctl status httpd.service --no-pager`{{execute T1}}

The Apache service has failed to start. You can also try restarting the Apache service - 

`systemctl restart httpd.service`{{execute T1}}

The Apache service fails to restart. You can see a more specific error 
message in the SSL error log for Apache. 

`tail -2 /var/log/httpd/ssl_error_log`{{execute T1}}

<pre class="file">
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] AH02562: Failed to configure certificate fe80::42:acff:fe11:b:443:0 (with chain), check /etc/pki/tls/certs/localhost.crt
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] SSL Library Error: error: 140AB18F: SSL routines: SSL_CTX_use_certificate:ee key too small
</pre>

The error message indicates that the key length was too small which was expected because 
the **FUTURE** policy requires a minimum of 3072-bit keys.

Now, you will create a policy modifier module called **2048KEYS.pmod** that can be used 
with the FUTURE crypto policy. Policy modifiers are text files that include policy instructions 
to the update-crypto-policies tool.  

The naming of these files must follow the following convention : **_MODULE_.pmod**, where **_MODULE_** 
is the name of the modifier in uppercase without spaces, and .pmod is the file extension in lowercase. 

Next, you will create a policy modifier called **2048KEYS.pmod** that will set the minimum key size to 2048 bits. 

`touch /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

In the policy modifier file, you will specify the minimum key size of RSA and DH keys - 

`echo "min_dh_size = 2048" > /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

`echo "min_rsa_size = 2048" >> /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

You will now configure the system to use a modified **FUTURE** policy with our newly created policy modifier -

`update-crypto-policies --set FUTURE:2048KEYS`{{execute T1}}

If you want to apply multiple policy modifiers, you can chain together several policy modifiers separated using ':'.
The policy modifiers are evaluated left to right to modify the specified named policy. 

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

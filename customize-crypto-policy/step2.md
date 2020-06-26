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
update the system to modify the **FUTURE** policy using a policy modifier file to allow 
for shorter RSA keys.  

Let us create a policy modifier module called **2048KEYS.pmod** that can be used 
with our crypto policies : 

`touch /etc/crypto-policies/policies/modules/2048KEYS.pmod`{{execute T1}}

In the created policy modifier file, let us reduce the size of RSA and DH cipher lengths 

`echo "hash = -SHA1" > /etc/crypto-policies/policies/modules/NOSHA-1.pmod`{{execute T1}}

`echo "sign = -RSA-PSS-SHA1 -RSA-SHA1 -ECDSA-SHA1" >> /etc/crypto-policies/policies/modules/NOSHA-1.pmod`{{execute T1}}


Let us update the system wide crypto policies and apply the modifier we created 

`update-crypto-policies --set DEFAULT:NOSHA-1`{{execute T1}}

<pre class="file">
Setting system policy to DEFAULT:NOSHA-1
Note: System-wide crypto policies are applied on application start-up.
It is recommended to restart the system for the change to policies
to fully take place.
</pre>

The change will no longer permit some encryption algorithms to be used on the 
machine, SHA1 for digital signatures. Additionally, RSA and PSK key exchanges are 
now not permitted. 

You can now verify that the new policy has been applied to the system.    

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
DEFAULT:NOSHA-1
</pre>

If you are interested in more details about the cryptographic policies that
ship with Red Hat Enterprise Linux 8:    

`man crypto-policies`

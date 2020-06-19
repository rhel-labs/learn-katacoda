# Modify the DEFAULT crypto policy

The Chief Security Officer sends out the following e-mail:
<pre class="file">
Application and Infrastructure Administrators,

I recently returned from an industry security conference, and at that
conference, I learned of some recommended security industry practices
that our Applications and services should be using. SHA-1 is a weak 
hashing function and using it can result in a hash collision.   

To continue supporting the applications running on our platform, we want 
to incrementally remove support for SHA1 hashes, and signatures.  

-CSO
</pre>

As it happens, all of these requirements can be configured and enforced using
system-wide cryptographic policies that come with Red Hat Enterprise Linux, by 
customizing it.

In order to comply with the requirements set forth by the CSO above, you will 
update the system to modify the **DEFAULT** policy using a policy modifier file to remove SHA1 hashes and signatures.  

Let us create a policy modifier module called **NOSHA-1.pmod** that can be used 
with our crypto policies : 

`touch /etc/crypto-policies/policies/modules/NOSHA-1.pmod`{{execute T1}}

In the created policy modifier file, let us remove SHA1 hashes

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

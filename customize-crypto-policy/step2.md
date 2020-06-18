# Set system-wide cryptographic policy to FUTURE

The Chief Security Officer sends out the following e-mail:
<pre class="file">
Application and Infrastructure Administrators,

I recently returned from an industry security conference, and at that
conference, I learned of some recommended security industry practices
that our Applications and services should be using.  Specifically, we 
want to remove support for RSA and PSK (pre-shared keys) key exchanges 
as they do not provide forward secrecy. The threat vector in this case 
is an attacker who is recording encrypted data between the client and server 
who somehow obtains the RSA key, can decrypt the pre-master secret for all 
prior sessions that are recorded.

Those of you that have applications and services that utilize asymmetric
encryption through RSA based certificates, your certificates should use
DiffieHellman or Elliptic Curve Diffie Hellman keys of at least a 3072 bit 
length. These algorithms provide forward secrecy to prevent such attacks. 

-CSO
</pre>

As it happens, all of these requirements can be configured and enforced using
system-wide cryptographic policies that come with Red Hat Enterprise Linux, and 
customizing it to remove RSA and PSK key exchanges. 

In order to comply with the requirements set forth by the CSO above, you will 
update the system to use the **FUTURE** cryptographic policy, and modify it with
a policy modifier file to remove the RSA and PSK key exchanges.  

Let us create a policy modifier module called **PFS-KEX.pmod** that can be used 
with our crypto policies : 

`touch /etc/crypto-policies/policies/modules/PFS-KEX.pmod`{{execute T1}}

In the created policy modifier file, let us remove RSA and PSK key exchanges

`echo "key_exchange = -RSA -PSK" > /etc/crypto-policies/policies/modules/PFS-KEX.pmod`{{execute T1}}
 
Let us update the system wide crypto policies and apply the modifier we created 

`update-crypto-policies --set FUTURE:PFS-KEX`{{execute T1}}

<pre class="file">
Setting system policy to FUTURE:PFS-KEX
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
FUTURE:PFS-KEX
</pre>

If you are interested in more details about the cryptographic policies that
ship with Red Hat Enterprise Linux 8:    

`man crypto-policies`

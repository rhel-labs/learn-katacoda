# Set system-wide cryptographic policy to FUTURE

The Chief Security Office sends out the following e-mail:
<pre class="file">
Application and Infrastructure Administrators,

Applications and services offered by our organization must now use a
cryptographic algorithm strong enough to provide security that is
believed to withstand any near-term future attacks (128-bit security)[1].

Those of you that have applications and services that utilize asymetric
encryption technologies, such as RSA key based certificates, may need
to update those to have a larger key bit length to achive this new 
encryption security level.

This change will allow client data to transit the internet in a more
secure fashion.

-CSO

[1] "Security Level" defined https://en.wikipedia.org/wiki/Security_level
</pre>


In order to comply with the new organization policy, you will first update
the system to use the **FUTURE** cryptographic policy.  Changing to the
**FUTURE** policy will configure the machine to require encryption technologies
that meet a 128 bit encryption strength.  


`update-crypto-policies --set FUTURE`{{execute T1}}

<pre class="file">
Setting system policy to FUTURE
Note: System-wide crypto policies are applied on application start-up.
It is recommended to restart the system for the change to policies
to fully take place.
</pre>

The change will no longer permit some encryption algorithms to be used on the 
machine.  Additionally, some algorithms may support a higher encryption 
strength, but may not be currently configured to meet the 128 bit excryption 
strenth requirement now in effect.   

You can now verify that the new policy, FUTURE, has been applied to the system.    

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
FUTURE
</pre>

If you are interested in more details about the cryptographic policies that
ship with Red Hat Enterprise Linux 8:    

`man update-crypto-policies`{{execute T1}}

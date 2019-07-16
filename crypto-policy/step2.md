# Set system-wide cryptographic policy to FUTURE

The Chief Security Office sends out the following e-mail:
<pre class="file">
Application and Infrastructure Administrators,

Applications and services offered by our organization must now use a
cryptographic algorithm strong enough to provide security that is
believed to withstand any near-term future attacks (128-bit security).

These changes will allow client data to transit the internet in a more
secure fashion.

-CSO
</pre>

In order to comply with the new organization policy, you will first update
the system to use the **FUTURE** cryptographic policy.  Changing to the
**FUTURE** policy will configure the machine to no longer permit SHA1
algorithm certificates, as SHA1 uses less than 128-bit encryption.   

`update-crypto-policies --set FUTURE`{{execute T1}}

<pre class="file">
Setting system policy to FUTURE
Note: System-wide crypto policies are applied on application start-up.
It is recommended to restart the system for the change to policies
to fully take place.
</pre>

You can now verify that the new policy, FUTURE, has been applied to the system.   

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
FUTURE
</pre>

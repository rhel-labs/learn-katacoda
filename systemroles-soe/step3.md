# Verifying the configuration was applied

Now that the playbook has been applied to the system, verify that the updated
settings have been applied.  Below you will see we use swappiness, but you could
look at any of the included parameters.

`cat /proc/sys/vm/swappiness`{{execute}}

<pre class="file">
20
</pre>

As expected, the setting is now 20 instead of what it started as in the
beginning of the lab.

To verify that session recording is now working, ssh to the system as the
__rhel__ user with the password of __redhat__.

`ssh rhel@localhost`{{execute}}

<pre class="file">
Warning: Permanently added 'localhost' (ECDSA) to the list of known hosts.
rhel@localhost's password: redhat


ATTENTION! Your session is being recorded!

</pre>

`exit`{{execute}}

You should have seen dialog similar to the output shown above.  Success! the
system is now recording terminal sessions for users connecting to it.

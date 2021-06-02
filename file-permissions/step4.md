# Changing permissions (absolute)

Now your next goal is to modify the permissions on __status.sh__ to keep
full access for the owner and group members,
but prevent anyone else from reading or writing to the file. You can do this
with three numbers if you use the absolute syntax.

The number you would use to do this with `chmod` is __771__.
Recall that these three numbers correspond to the owner, group, and other
access, respectively. In this example, using __7__ for the owner access gives
the user that owns the file read, write, and execute access. This is because 7
in binary is __111__, which would translate symbolically to __rwx__.  
Similarly, the 7 in the second index of this number will apply the same
permissions to anyone in the file's group. The final number applies to all other users.
Since 1 in binary is __001__, so this means that the permissions for other users are
set to __--x__. There is a zero in the index for read and write,
so these users will not have read or write access for this file. They will
still be able to execute the file, though.

Return to the first terminal where you are logged in as __root__. Use `chmod`
to reinstate read and execute access for the group and other users while giving
full access to the owner, as discussed above:

`chmod 771 status.sh`{{execute T1}}

Confirm that this change has succeeded by checking the access mode for __status.sh__

`ls -l`{{execute T1}}

<pre class=file>

</pre>

Now, from the guest terminal, verify that you can execute the status script as
__guest__:

`./status.sh`{{execute T2}}

<pre class=file>
status.sh successfully executed by guest
</pre>

However, if you try to read this file, you will see you do not have
read access as __guest__:

`cat /srv/status.sh`

<pre class=file>

</pre>

>_NOTE:_ You can use `vi` or any other write command to verify that
you do not have write access as __guest__ if you wish to verify this as well.

Many users default to absolute permissions because of how much quicker they
are to type. If you are still unsure exactly what these commands are doing,
please check out the “How do I manage permissions?” section of (this Enable Sysadmin article)[https://www.redhat.com/sysadmin/manage-permissions] to learn more.

The next step will walk you through changing which user owns file.

# Changing permissions (absolute)

Now your next goal is to modify the permissions on __status.sh__ to keep
full access for the owner and group members,
but prevent anyone else from writing to or executing the file. You can do this
with three numbers if you use the absolute syntax.

The number you would use to do this with `chmod` is __774__.
Recall that these three numbers correspond to the owner, group, and other
access, respectively. In this example, using __7__ for the owner access gives
the user that owns the file read, write, and execute access. This is because 7
in binary is __111__, which would translate symbolically to __rwx__.
Similarly, the 7 in the second index of this number will apply the same
permissions to anyone in the file's group.

The final number applies to all other users.
Since 4 in binary is __100__, this means that the permissions for other users are
set to __r--__. There is a zero in the index for write and execute,
so these users will not have read or execute access for this file. They will
still be able to read the file, though.

Return to the first terminal where you are logged in as __root__. Use `chmod`
to modify the permissions on __status.sh__ as discussed above:

`chmod 774 status.sh`{{execute T1}}

Confirm that this change has succeeded by checking the access mode for __status.sh__

`ls -l | grep status.sh`{{execute T1}}

<pre class=file>
-rwxrwxr--. 1 root root  66 Jun  2 22:42 status.sh
</pre>

Now, from the guest terminal, verify that you do not have permission to
execute the status script as __guest__:

`./status.sh`{{execute T2}}

<pre class=file>
bash: ./status.sh: Permission denied
</pre>

However, if you try to read this file, you will see you do have
read access as __guest__:

`cat /srv/status.sh`{{execute T2}}

<pre class=file>
#!/bin/bash

echo -n "status.sh successfully executed by "
whoami
</pre>

>_NOTE:_ You can use `vi` or any other write command to verify that
you do not have write access as __guest__ if you wish to verify this as well.

Many users default to absolute permissions because of how much quicker they
are to type. If you are still unsure exactly what these commands are doing,
please check out the “How do I manage permissions?” section of (this Enable Sysadmin article)[https://www.redhat.com/sysadmin/manage-permissions] to learn more.

The next step will walk you through changing which user owns a file.

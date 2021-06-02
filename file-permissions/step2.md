# Interacting with a file from different user accounts

In this step, you will be executing the `status.sh` script as two different
user accounts: __root__, which owns the file, and __guest__, who falls into the
_other users_ permissions category.
This script simply prints the user who executed it, so you will be able to
clearly see whether or not a specific user can execute the script.
Execute the script to see the output:

`./status.sh`{{execute T1}}

<pre class=file>
status.sh successfully executed by root
</pre>

To understand who can execute this script, use `ls -l` to check what the access
modes are for this file:

`ls -l`{{execute T1}}

<pre class=file>

</pre>

The first three letters show that the owner of the file has full permissions,
__rwx__, so the owner can read, write, and execute this file. Users in the group
of this file have __r-x__, so they can read and execute but cannot write to
this file. Finally, all other users have no permissions, __---__, so they are
unable to read, write, or execute this file.  

To see this in action, switch to the guest terminal and change directories to `/srv/`

`cd /srv/`{{execute T2}}

Now, switch users to the __guest__ account using the `su` command:

`su guest`{{execute T2}}

Confirm that this command has succeeded using the `whoami` command:

`whoami`{{execute T2}}

<pre class=file>
guest
</pre>

Try executing the status script as __guest__. Since the guest account is not
the owner of the file and is not part of any groups, you are unable to execute
this script from this user account.

`./status.sh`{{execute T2}}

<pre class=file>

</pre>

Now that you know how files behave differently when operated on by different
user accounts, the next steps will show you how to customize permissions to
control this behavior.

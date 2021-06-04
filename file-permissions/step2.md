# Interacting with a file from different user accounts

In this step, you will be executing the `status.sh` script as two different
user accounts: __root__, which owns the file, and __rhel__, who falls into the
_other users_ permissions category.
This script prints the user who executed it, so you will be able to
clearly see whether or not a specific user can execute the script.

Recall from the previous step that __status.sh__ has the following permissions:

<pre class=file>
-rwxr-x---
</pre>

Therefore, __root__ has permission to execute this script.

`./status.sh`{{execute T1}}

<pre class=file>
status.sh successfully executed by root
</pre>

Focus now on line 2, the line for __status.sh__. The first three letters of the
access mode show that the owner of the file has full permissions,
__rwx__, so the owner can read, write, and execute this file. Users in the group
that owns this file have __r-x__, so they can read and execute but cannot write to
this file. Finally, all other users have no permissions, __---__, so they are
unable to read, write, or execute this file.  

To see this in action, switch users to the __rhel__ account using the `su` command:

`su - rhel`{{execute T2}}

Confirm that this command has succeeded by looking at your bash prompt,
the user should be __rhel__.

<pre class=file>
[rhel@0790d87edf78 ~]$
</pre>

Navigate back to the directory containing the __status.sh__ script so that
you can run it as this new user.

`cd /srv`{{execute T2}}

Try executing the status script as __rhel__. Since the rhel account is not
the user owner of the file and is not part of any owner groups, you are unable
to execute this script from this user account.

`./status.sh`{{execute T2}}

<pre class=file>
bash: ./status.sh: Permission denied
</pre>

Now that you know how files behave differently when operated on by different
user accounts, the next steps will show you how to customize permissions to
control this behavior.

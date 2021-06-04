# Changing file ownership

Sometimes it is useful to change who owns a file so that permissions can align
with the purpose of the file. The `chown` command can do this very easily. Just
specify the new owner and the file you would like to change. From the root terminal,
confirm that __root__ is the initial owner of the file __tasks.txt__:

`ls -l tasks.txt`{{execute T1}}

<pre class=file>
-rwxr-x---. 1 root root 117 Jun  2 23:01 tasks.txt
</pre>

The third and fourth column of this output are the user and group that own the
file. Right now, __root__ is the owner in both cases. Switch to the rhel
terminal and attempt to read the file:

`cat tasks.txt`{{execute T2}}

<pre class=file>
cat: tasks.txt: Permission denied
</pre>

This read operation is denied, as __rhel__ does not have read permission.
Returning to the root terminal, change the user that owns __tasks.txt__ to __rhel__:

`chown rhel tasks.txt`{{execute T1}}

Repeating the search shows that the owner (column 3) has been updated:

`ls -l tasks.txt`{{execute T1}}

<pre class=file>
-rwxr-x---. 1 rhel root 117 Jun  2 23:01 tasks.txt
</pre>

Now that __rhel__ owns the file instead of __root__, this user has permission
to read the file without reconfiguring the access modes.

`cat tasks.txt`{{execute T2}}

<pre class=file>
1. Finish this Permissions lab
2. Do the Network Configuration Basics lab
3. Listen to the album "New-S" by T-Square
</pre>

The fourth column of the `ls -l` output is the group which owns the file.
The next step will walk you through changing group ownership.

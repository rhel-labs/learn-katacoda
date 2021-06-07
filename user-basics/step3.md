# Removing a user for a group

If you want to remove a user from a group without deleting the group, run
the following command:

`gpasswd -d guest viewers`{{execute T1}}

<pre class=file>
Removing user guest from group viewers
</pre>

>_NOTE:_ This change will not take effect until the user logs in again.

# Deleting a group

If instead you want to delete the group all together, run the `groupdel` command
as root.

`groupdel viewers`{{execute T1}}

 If you are trying to remove the primary group of a user, you must remove
that user first.

Attempting to add a user to this group will print an error message showing that
it now does not exist.

`usermod -aG viewers guest`{{execute T1}}

<pre class=file>
usermod: group 'viewers' does not exist
</pre>

# Deleting a user account

Deleting a user is very similar to deleting a group:

`userdel guest`{{execute T1}}

Try logging in as __guest__ to confirm the deletion:

`su - guest`{{execute T1}}

<pre class=file>
su: user guest does not exist
</pre>

If you try to delete a user that is logged in, you will get an
error such as the following:

<pre class=file>
userdel: user guest is currently used by process 1909
</pre>

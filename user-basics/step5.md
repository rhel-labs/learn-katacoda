# Disabling a user account

If a user is leaving your organization, you will want to disable an account.
Unlike deleting the account, this maintains their files and account information,
but prevents them from accessing the system using their credentials.

The `chage` command has an expire date option (`-E`) which informs the system
what date to stop accepting a user's login attempts. To lock the account
immediately, specify today's date when calling the command:

`chage -E $(date +%Y-%m-%d) guest`{{execute T1}}

>_NOTE:_ This uses the `date` command with a format string to match the expected
input for `chage` while always calling the command with the day that
you are completing this lab, but you can just type today's date in the format
YYYY-mm-dd when calling this command on your system.  

This operation does not have an output, but calling `chage` with the list option
allows you to confirm this change. Use `grep` to focus only on the account
expiration line:

`chage -l guest | grep "Account expires"`{{execute T1}}

<pre class=file>
Account expires                                         : Jun 08, 2021
</pre>

>_NOTE:_ The output on your system should say the current date. 

After expiring this account, __root__ will still be able to log in. However, no
other user will be able to access __guest__.

Running `chage` with no arguments gives good insight into the other functionality
this command has, such as setting password expire dates and configuring warnings
instructing the user to change their password.

# Deleting a user account

Sometimes you may want to do more than just disable the account.
Deleting a user is very similar to deleting a group:

`userdel guest`{{execute T1}}

Try logging in as __guest__ to confirm the deletion:

`su - guest`{{execute T1}}

<pre class=file>
su: user guest does not exist
</pre>

>_NOTE:_ If you try to delete a user that is logged in, you will get an
error such as the following:

<pre class=file>
userdel: user guest is currently used by process 1909
</pre>

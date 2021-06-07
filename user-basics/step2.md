# Adding groups

Groups are useful ways to carry out batch operations on a set of users.
For example, files can be given permissions which apply to all users
in the group that owns that file.

Create a group called __viewers__ using the `groupadd` command:

`groupadd viewers`{{execute T1}}

Search for the group name in the `/etc/group` file to confirm this was successful:

`cat /etc/group | grep viewers`{{execute T1}}

<pre class=file>
viewers:x:1003:
</pre>

This file shows the group name, the group ID, and which users belong to the group.
In this case, __viewers__ does not yet have any users associated with it.
Now you will see how to add users to this group.

# Adding users to a group

Now that you have created this group, add the __guest__ user from the previous step
to the __viewers__ group using `usermod`. You will use the secondary group option
(`-G`) in conjunction with the append option (`-a`) to add __viewers__ without
overwriting any existing groups associated with __guest__.

`usermod -aG viewers guest`{{execute T1}}

The `id` command is useful for validating this change:

`id guest`{{execute T1}}

<pre class=file>
uid=1002(guest) gid=1002(guest) groups=1002(guest),1003(viewers)
</pre>

The __viewers__ group has been added alongside __guest__ in the _groups_ field.

>_NOTE:_ Using the secondary group option (`-G`) adds __viewers__ as a _secondary group_ for the __guest__ user. Users can have any number of secondary groups.
If you instead wanted to replace the primary group for __guest__, use `-g`
when calling `groupadd`. You cannot use `-a` to append a primary group, as
users can only have one primary group.

In the final step you will practice removing user accounts and groups.

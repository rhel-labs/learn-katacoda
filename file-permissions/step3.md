# Modifying file permissions

The `chmod` command is how you modify the permissions associated with
files and directories. The `chmod` command has two different ways to modify
permissions: symbolic and absolute. Symbolic permissions are the ones
that are displayed in the access mode output of `ls -l` as shown in the
previous step. In this mode, you use the characters `r`, `w`, and `x` to
set the read, write, and execute permissions. The other mode, absolute,
instead uses a series of three numbers to correspond to the permissions for
the owner, group, and others. These numbers are identical in meaning to the
symbolic mode breakdown, they are just more compact and therefore
quicker to type. Here is an example from Boolean World:

![Absolute vs Symbolic permissions](./assets/absVsSym.png)

Image credit: Boolean World, ["An Introduction to Linux File Permissions"](https://www.booleanworld.com/introduction-linux-file-permissions/)

The upcoming sections walk through a examples of changing permissions using
each of these two modes.

# Changing permissions (symbolic)

In this step, you will be modifying the permissions on the `status.sh` script
using symbolic syntax with the `chmod` command. In the previous step, you were
unable to execute __status.sh__ as __guest__. To change that, use the `chmod`
command. In this case, you are going to do two operations in one line. The others
group will be set explicitly with `o=rwx`. Using the equals `=` operator means that
you wish to completely define the permissions for that set of users. You are
also going to use the `g+w` operation. The plus `+` operator will add any permissions
that you specify, but it will not change any permissions that you do not explicitly
set in the command. So in this case, it will give groups write access, but will not
change the value of read or execute access for groups. Return to the root
terminal to execute this command.

`chmod g+r,o=rwx status.sh`{{execute T1}}

Verify that this command succeeded

`ls -l`{{execute T1}}

<pre class=file>

</pre>

>_NOTE:_ Just as `g+w` added write permissions for the group, `chmod` accepts
a `-` argument to take away permissions. For example, `o-wx` would remove write
and execute privileges from the others group while leaving the read value untouched.  

Now the __guest__ user will be able to read, write, and execute __status.sh__.
Switch back to the guest terminal and re-run the status script:

`./status.sh`{{execute T2}}

<pre class=file>
status.sh successfully executed by guest
</pre>

Since you added read, write, and execute permissions, you can do more than
just execute this file as __guest__. Use the `cat` command to verify that you
can read this file as __guest__.

`cat status.sh`{{execute T2}}

<pre class=file>
echo -n "status.sh successfully executed by "
whoami
</pre>

Symbolic mode is very explicit which can appeal to newer users. However,
the absolute mode described in the next step can save a ton of keystrokes if you
take the time to familiarize yourself with it.

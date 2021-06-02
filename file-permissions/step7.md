# Using `find` to audit permissions

The `find` command is highly versitile, but in this case you will be using it
to locate files that have permissions that may pose security risks. The `-perm`
option causes the `find` command to look at the access modes for each file.
In this case you are calling `find` without a path, which means it will
start looking in the current directory. First, check for files that
have the permission level __755__.

`find -perm 755`{{execute T1}}

This returns the following files:

<pre class=file>

</pre>

>_NOTE:_ Recall from the previous step that __755__ corresponds to read, write,
and execute access for the owner, and read and execute access for everyone else.

Consider a situation where you have determined that any permissions above a certain
level could pose a security issue. Adding a dash before the permission tells
the `find` command to return anything with a permission greater than or
equal to the one you are searching for.

`find -perm -755`{{execute T1}}

<pre class=file>

</pre>

Notice that this returns many more files. Some of these aren't concerning, but
the contract files in the __proprietary__ directory shouldn't be readable by everyone.
Furthermore, since these are text files, they shouldn't be executable.

Run the `chmod` command with a level of __600__ to ensure that these files
are readable and writeable by the owner, but others cannot access them. Using 6
instead of 7 in this case also removes the ability for the owner to execute the
text file (6 -> 110 -> `rw-`). Finally, adding the `-R` flag will carry out
this operation recursively, removing the need to repeat the operation on each
file.  

`chmod -R 600 proprietary/`{{execute T1}}

To verify that access has been removed, try to read one of the files as the
guest account after this change has been made. Switch to the guest terminal
and run this command:

`cat /srv/proprietary/contract01.txt`{{execute T2}}

This step is based off of information from the (Enable Sysadmin article on the topic)[https://www.redhat.com/sysadmin/audit-permissions-find]. Head there for more information on increasing the specificity of what `find` returns.  

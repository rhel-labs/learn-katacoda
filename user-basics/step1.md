# What is a user account?

Linux is designed to be a multi-user system. User accounts are the segmentation
method that keeps each individual from getting in each other's way. User
accounts are tied to file permissions, meaning that users can control who has
the ability to modify various files on the system. These user accounts also
provide traceability if there is a file or process that is hogging system resources.

# Creating user accounts with `useradd`

Add a new account called __guest__ using the `useradd` command:

`useradd guest`{{execute T1}}

Confirm the account creation by examining the __passwd__ file.

`grep -w guest /etc/passwd`{{execute T1}}

<pre class=file>
guest:x:1002:1002::/home/guest:/bin/bash
</pre>

Next, a password needs to be added to the user account to enable login.

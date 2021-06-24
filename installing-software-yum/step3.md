# Using `yum history` to roll back a transaction

The `history` subcommand provides a summary of recent `yum` transactions.

`yum history`{{execute}}

The output contains transaction IDs in the first column, which are how you reference
specific locations in the transaction history when executing rollbacks.

<pre class=file>
ID| Command                  | Date and time    | Action(s)| Altered
------------------------------------------------------------------
7 | remove -y httpd          | 2021-06-11 18:42 | Removed  | 3
6 | update -y bash           | 2021-06-11 18:41 | Upgrade  | 1   
5 | install -y wireshark     | 2021-06-11 18:40 | Install  | 36   
4 | install -y gcc llvm-libs | 2021-03-11 22:22 | Install  | 13   
3 | install -y buildah       | 2021-03-11 22:21 | I, U     | 216   
2 | install -y rsync         | 2021-03-11 22:20 | Install  | 1   
1 |     
</pre>

This subcommand is also useful for rolling back transactions if you erroneously
install or update a package, as it cleans up all of the dependencies associated
with the package. Rollback the state of your system to before you uninstalled
__crontabs__:

`yum -y history rollback 6 `{{execute}}

>_NOTE:_ The number 6 here is used here to specify that the rollback
the state of the system to how it was at transaction ID 6, or before you
removed __httpd__.
You can use other relative offsets, such as `last-3`, or you can use absolute
transaction IDs. For example, `yum history rollback 2` would rollback to the
transaction where __rsync__ was installed.

<pre class=file>
<< OUTPUT ABRIDGED >>
Installed:
  apr-1.6.3-11.el8.x86_64                                           
  apr-util-1.6.1-6.el8.x86_64                                       
  apr-util-bdb-1.6.1-6.el8.x86_64                                   
  apr-util-openssl-1.6.1-6.el8.x86_64                               
  httpd-2.4.37-39.module+el8.4.0+9658+b87b2deb.x86_64               
  httpd-filesystem-2.4.37-39.module+el8.4.0+9658+b87b2deb.noarch          

Complete!
</pre>

This command reinstalled the RPMs that are part of __httpd__ (including
all dependencies),
restoring the system state to how it was before the previous transaction.

There are many more subcommands that you can use to customize how YUM behaves.
Check out this [YUM Command Cheat Sheet for RHEL](https://access.redhat.com/sites/default/files/attachments/rh_yum_cheatsheet_1214_jcs_print-1.pdf) for more info.

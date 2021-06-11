# Using `yum history` to roll back a transaction

The `history` subcommand provides a summary of recent `yum` transactions.

`yum history`{{execute}}

The output contains transaction IDs in the first column, which are how you reference
specific locations in the transaction history when executing rollbacks.

<pre class=file>
Updating Subscription Management repositories.
ID     | Command line             | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------
     5 | install -y wireshark     | 2021-06-10 22:30 | Install        |   36   
     4 | install -y gcc llvm-libs | 2021-03-11 22:22 | Install        |   13   
     3 | install -y buildah podma | 2021-03-11 22:21 | I, U           |  216   
     2 | install -y rsync         | 2021-03-11 22:20 | Install        |    1   
     1 |                          | 2021-03-11 22:13 | Install        |  412 EE
</pre>

This subcommand is also useful for rolling back transactions if you erroneously
install or update a package, as it cleans up all of the dependencies associated
with the package.

`yum history rollback last-1`

>_NOTE:_ The `last-1` keyword is used here to specify that the rollback
the state of the system to how it was before the most recent transaction.
You can use other relative offsets, such as `last-3`, or you can use absolute
transaction IDs. For example, `yum history rollback 2` would rollback to the
transaction where __rsync__ was installed.

You will continue to use the Wireshark package in this lab, so answer __no__ to
the prompt:

`n`{{execute}}

There are many more subcommands that you can use to customize how YUM behaves.
Check out this [YUM Command Cheat Sheet for RHEL](https://access.redhat.com/sites/default/files/attachments/rh_yum_cheatsheet_1214_jcs_print-1.pdf) for more info.

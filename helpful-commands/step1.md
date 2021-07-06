# Manipulating file contents

Use `ls` to take a look at the contents of the current directory:

`ls`{{execute}}

The `cat` command is short for "concatenate", but it is much more versatile
than that name suggests.

`cat numbers.txt`{{execute}}


`echo "11" >> numbers.txt`{{execute}}

>_NOTE:_ You also may see the '>' redirection operator. This operator will
write the output to a file, overwriting the file if it already exists. By contrast,
the `>>` operator will append the output to the specified file.




Since this only displays the last ten lines of a file, it is particularly
useful for viewing recent entries in log files.

`tail var/log/boot.log`{{execute}}

<pre class=file>
Starting Enable periodic update of entitlement certificates....
Starting Dynamic System Tuning Daemon...
Starting Network Manager Wait Online...
Starting Hostname Service...
[  OK  ] Started Enable periodic update of entitlement certificates..
[  OK  ] Started Permit User Sessions.
Starting Hold until boot process finishes up...
Starting Terminate Plymouth Boot Screen...
[  OK  ] Started Command Scheduler.
[  OK  ] Started OpenSSH server daemon.
</pre>

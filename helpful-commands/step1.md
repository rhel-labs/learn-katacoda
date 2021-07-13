# Manipulating file contents

The first step towards modifying files is knowing what files exist. Use `ls`
to take a look at the contents of the current directory:

`ls`{{execute T1}}

<pre class=file>
anaconda-ks.cfg  example.txt  openscap_data  original-ks.cfg
</pre>

There are a few configs and a subdirectory, but you will use _quote.txt_
for this exercise. Use the `cat` command to quickly check what is in this file.
The `cat` command is short for "concatenate", but it is much more versatile
than that name suggests.

`cat quote.txt`{{execute T1}}

<pre class=file>
Just thinking about everything I have been through, and how huge it all feels.
The fact that it is just a small part of something larger
</pre>

Now you can complete the quote by redirecting the output of the `echo` command.
The command below uses the append redirection operator (`>>`) to cause the
output of the `echo` command to be written to the end of the file _quote.txt_.

`echo "makes it seem more manageable." >> quote.txt`{{execute T1}}

There is no output, so view the file contents once again to see this change reflected:

`cat example.txt`{{execute T1}}

<pre class=file>
Just thinking about everything I have been through, and how huge it all feels.
The fact that it is just a small part of something larger
makes it seem more manageable.
</pre>

The `>>` operator allows you to add to files from the command line and is particularly
useful in shell scripting. You can also use it when a command has a lengthy output
and you want to view that output in a text editor.  

>_NOTE:_ You may also encounter the '>' redirection operator. This operator will
write the output to a file, overwriting the file if it already exists. By contrast,
the `>>` operator will append the output to the specified file.

Some files are large enough that it is not practical to display their contents
with `cat`. A common example is log files, which are often packed full of
information.

Since this only displays the last ten lines of a file, it is particularly
useful for viewing recent entries in log files. Take a look at the final
ten lines of the _boot_ log.

`tail var/log/boot.log`{{execute T1}}

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

If you wish to then see the entire file, a text viewer like `vi`,
`nano`, or `less` will let you view the entire file.  

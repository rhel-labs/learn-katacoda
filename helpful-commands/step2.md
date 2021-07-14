# Viewing the end of log files with `tail`

// make new step for tail

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

If you wish to then see the entire file, a text viewer like `less` or `view`
will let you view the entire file.

//tail -f will follow the log file so that you can see new entries,
var log messages

//logger will write log entries

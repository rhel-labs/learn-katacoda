Another tool called 'biotop' can help us to identify what processes are
generating the IO utilization:

`man biotop`{{execute T1}}

Use key 'q' to exit manpage.
Run the biotoptool without any arguments on Terminal 1:

`/usr/share/bcc/tools/biotop`{{execute T1}}

Go to Terminal 2 and generate some IO traffic:

`dd if=/dev/vda of=/dev/null`{{execute T2}}

In the first Terminal we can now see that this dd command is generating quite
some IO read traffic:

<pre class="file">
13:27:50 loadavg: 0.59 0.48 0.58 3/848 17593

PID    COMM             D MAJ MIN DISK       I/O  Kbytes  AVGms
17541  dd               R 259 0   nvme0n1   1094 140032.0   0.05
1272   dmcrypt_write/2  W 259 0   nvme0n1      3   112.0   0.03
</pre>

Terminate the 'dd' command in the Terminal 2 by pressing CTRL+C.

You can also run alternative version of the dd command:

`dd if=/dev/zero of=/dev/null`{{execute T2}}

'biotop' running in the first Terminal now doesn't report dd:

<pre class="file">
13:29:44 loadavg: 0.52 0.45 0.55 2/846 17620

PID    COMM             D MAJ MIN DISK       I/O  Kbytes  AVGms
</pre>

This is because 'dd' is now moving data between two virtual devices which are
not backed up by real storage. Therefore, although 'dd' is running lot of IO
syscalls, it is not generating disk utilization and thus not reported by
'biotop'.

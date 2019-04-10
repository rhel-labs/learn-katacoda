Lets now look at more advanced tool called 'biolatency':

`man biolatency`{{execute T1}}

Use key 'q' to exit manpage.
Run the biolatency tool without any arguments on Terminal 1:

`/usr/share/bcc/tools/biolatency`{{execute T1}}

Go to the Terminal 2 and generate some IO traffic:

`dd if=/dev/vda of=/dev/null bs=1M count=128`{{execute T2}}

After this command finishes, go back to the first terminal, terminate biolatency tool by pressing CTRL+C and examine the results:

<pre class="file">
# ./biolatency
Tracing block device I/O... Hit Ctrl-C to end.
^C
     usecs               : count     distribution
         0 -> 1          : 0        |                                        |
         2 -> 3          : 0        |                                        |
         4 -> 7          : 0        |                                        |
         8 -> 15         : 190      |**                                      |
        16 -> 31         : 977      |***************                         |
        32 -> 63         : 355      |*****                                   |
        64 -> 127        : 2058     |********************************        |
       128 -> 255        : 1964     |******************************          |
       256 -> 511        : 2431     |*************************************   |
       512 -> 1023       : 2569     |****************************************|
      1024 -> 2047       : 499      |*******                                 |
      2048 -> 4095       : 184      |**                                      |
      4096 -> 8191       : 88       |*                                       |
      8192 -> 16383      : 1        |                                        |
</pre>

We see the distribution of the latency of disk IO. In the sample above we see that majority of IO operations took between 16 and 1024 microseconds.

Next, yum will begin installing the updates and removing old packages. To do this, yum is going to use our disk and memory resources and so we will monitor this with `filetop`, `xfsslower` and `cachestat`.

In the filetop terminal, we will start to actually see files being read and written to disk. As yum reads files from the rpm, it then writes them out to the disk. Here is what the reads look like:

<pre class="file">
TID    COMM             READS  WRITES R_Kb    W_Kb    T FILE
77699  yum              7      0      2       0       R stat.h;5e5574b8
77699  yum              3      0      0       0       R tc_defact.h;5.5574b8
77699  yum              1      0      0       0       R rpmsg.h;5e5574b8
77699  yum              2      0      0       0       R midi.h;5e5574b8
<< OUTPUT ABRIDGED >>
</pre>

From the above output, we can see in the "T"ype column that these are "R"eads. Further, we see the counters in the "READS" column as greater than 0. This shows us in real time what yum is doing with files on the system.

Further, on the xfsslower terminal, we will start to see XFS operations take longer than 10ms and these will start to show:

<pre class="file">
Tracing XFS operations slower than 10 ms
TIME     COMM           PID    T BYTES   OFF_KB   LAT(ms) FILENAME
09:22:58 b'yum'         77726  S 0       0         567.45 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          14.21 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          14.48 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          13.83 b'packages.db-journal'
09:22:58 b'yum'         77726  S 0       0          14.16 b'packages.db-journal'
09:22:59 b'yum'         77726  S 0       0          10.07 b'packages.db-journal'
09:22:59 b'yum'         77726  S 0       0          27.65 b'packages.db'
<< OUTPUT ABRIDGED >>
</pre>

In the above output, we see the file that yum was working on and the latency in the "LAT(ms)" column, which shows us that the longest latency was 567.45 milliseconds accessing packages.db-journal. If we wish to improve the speed of `yum update` on this system by reducing latency, we may want to look at upgrading the underlying storage of this system.

Further, if we look at the cachestat terminal, we'll see that the number of misses on the cache has gone up during the installation procedure as we are starting to need access to memory locations that are not cached:

<pre class="file">
    HITS   MISSES  DIRTIES HITRATIO   BUFFERS_MB  CACHED_MB
       0       62        0    0.00%            0       1701
       0       52        0    0.00%            0       1702
      45        2        0   95.74%            0       1701
    5721     3777        0   60.23%            0       1716
   18683     6606        0   73.88%            0       1747
   14853     6223        0   70.47%            0       1778
       0        2        0    0.00%            0       1778

<< OUTPUT ABRIDGED >>
</pre>

If we keep watching cachestat, we'll notice that the number of misses goes back down to zero after the `yum update` is done. This is because when the `yum update` is finished, our virtual machine is idle and there is very little running that needs access to memory.


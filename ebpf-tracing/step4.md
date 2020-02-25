Time to observe what happens when yum does an update from a system perspective! In our first terminal, let's run:

`yum update -y`{{execute T1}}

The first thing that yum does is updates repository metadata. This is going to create activity on our gethostlatency terminal and our tcplife terminal. We can look at those to see the network connections that yum establishes in real time.

We will see entries on our gethostlatency terminal similar to:

<pre class="file">
TIME      PID    COMM                  LATms HOST
08:45:23  75923  yum                    0.10 localhost
08:45:25  75924  yum                  375.39 subscription.rhsm.redhat.com
08:45:27  75926  yum                  109.50 subscription.rhsm.redhat.com
08:45:38  75927  yum                   10.23 cdn.redhat.com
08:45:39  75929  yum                   10.21 cdn.redhat.com
08:45:40  75931  yum                   10.18 cdn.redhat.com
</pre>

that show `yum` looking up IP addresses for localhost, subscription.rhsm.redhat.com, and cdn.redhat.com. This makes it really easy to know what hosts our application is talking to.

Let's also look at the cachestat terminal and we should see output similar to:

<pre class="file">
    HITS   MISSES  DIRTIES HITRATIO   BUFFERS_MB  CACHED_MB
      14        0        0  100.00%            0       1681
    2768        0        0  100.00%            0       1699
     596        0        0  100.00%            0       1700
    4143        0        0  100.00%            0       1708
    3252        0        0  100.00%            0       1698

<< OUTPUT ABRIDGED >>
</pre>

This shows that we are operating entirely out of cache and not having to go all the way to main memory at this point. 

If we look at our tcplife terminal when yum has finished downloading packages, we will see output similar to:

<pre class="file">
PID   COMM       LADDR           LPORT RADDR           RPORT TX_KB RX_KB MS
75963 yum        172.17.0.39     38054 2.16.30.83      443      23 138393 36375.04
75963 yum        172.17.0.39     38054 2.16.30.83      443      24 163378 36374.62
75963 yum        172.17.0.39     38054 2.16.30.83      443      22 163223 36374.69
</pre>


that show us that yum has established a connection on 443 to 2.16.30.83 and that connection lasted for 36375.04 milliseconds, or 36.37504 seconds. This correlates to the amount of time yum spent downloading packages.


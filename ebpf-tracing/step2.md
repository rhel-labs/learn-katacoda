Install bpftool utility:

`yum install -y bpftool`{{execute T1}}

Run bpftool to verify that no eBPF programs are currently loaded in the kernel:

`bpftool prog list`{{execute T1}}

We expect this command to return nothing as there are no loaded eBPF programs.

Now let's launch some bcc-tools in separate terminals to get started observing `yum update`:

We will start by running gethostlatency in the gethostlatency terminal:

`/usr/share/bcc/tools/gethostlatency`{{execute T2}}

We should see this header in the gethostlatency terminal, indicating the tool is properly running:

<pre class="file">
TIME      PID    COMM                  LATms HOST
</pre>

In the gethostlatency terminal, we are running gethostlatency, and this is going to give us latency statistics on the getaddrinfo() and gethostbyname() system calls. Effectively, we'll get to see how long these take and which hostnames our applications need IP addresses for. This can be useful for discovering interesting connections that you may not be aware your applications are making.

Let's now run tcplife in the tcplife terminal:

`/usr/share/bcc/tools/tcplife`{{execute T3}}

We should see this header in the tcplife terminal, indicating the tool is properly running:

<pre class="file">
PID   COMM       LADDR           LPORT RADDR           RPORT TX_KB RX_KB MS
</pre>

In the tcplife terminal, we are running tcplife and this will tell us a lot of data about established tcp connections, and the total time that the connection was alive. When yum is finished downloading packages, we should get entries in tcplife for the amount of time that yum spent downloading packages over the tcp connections that it established for this activity.



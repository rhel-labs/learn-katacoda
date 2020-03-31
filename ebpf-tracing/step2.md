In this step, you will start running the bcc-tools to prepare for observing
an active workload on the system.  In the lab environment there are several 
additional terminal tabs across the top of the interface, the names correspond
to tools that you will run in this, and following steps.

First, though, you will validate the environment and that it is not currently
using any eBPF calls.  To do this, you will install the `bpftool` utility.  

`yum install -y bpftool`{{execute T1}}

Next, run `bpftool` to verify that no eBPF programs are currently loaded in 
the kernel.  If there are no eBPF programs in use, the tool will return no
output.

`bpftool prog list`{{execute T1}}

The tool should have provided no output, indicating that no eBPF tools are
running in the evironment.

Now, launch some bcc-tools applications in the separate, provided terminals.
You will use these to observe our sample workload in a following step.

Start by running `gethostlatency` in the **gethostlatency** terminal:

`/usr/share/bcc/tools/gethostlatency`{{execute T2}}

You should see the following header in the gethostlatency terminal, 
indicating the tool is properly running:

<pre class="file">
TIME      PID    COMM                  LATms HOST
</pre>

In the **gethostlatency** terminal, you are running the gethostlatency bcc-tool.
It is showing latency statistics on the `getaddrinfo()` and `gethostbyname()` 
system calls. Effectively, you get to see how long these system calls take and 
which hostnames the applications need IP addresses for. This can be useful for 
discovering network connections that your applications are making.


Next, run `tcplife` in the **tcplife** terminal:

`/usr/share/bcc/tools/tcplife`{{execute T3}}

The following header should now be displayed in the tcplife terminal, 
indicating the tool is running:

<pre class="file">
PID   COMM       LADDR           LPORT RADDR           RPORT TX_KB RX_KB MS
</pre>

`tcplife` will tell you data about established tcp connections.  PID is the
process ID of the process openning the connection.  COMM, the command that
corresponds to the PID.  LADDR and LPORT reference the local address and port 
of the connection. RADDR and RPORT the remote address and port.  TX_KB and
RX_KB are the amount of data Transmitted (in Kilobytes) and Recieved (in
Kilobytes).  MS is the time of the connection, in miliseconds.

In the next step, you will continue to start additional bcc-tools applications
in the lab environment to start collecting additional data.



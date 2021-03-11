# Using PCP for system metrics

>**NOTE:** In this step we will be using the *pcp* terminal to run PCP commands. 

Select the *pcp* terminal to run commands in this step.

## Inspect the PCP configuration on the host

`pcp`{{execute T2}}

<pre class="file">
Performance Co-Pilot configuration on be5455ac10c4:

 platform: Linux be5455ac10c4 4.18.0-240.el8.x86_64 #1 SMP Wed Sep 23 05:13:10 EDT 2020 x86_64
 hardware: 2 cpus, 1 disk, 1 node, 3688MB RAM
 timezone: EST+5
 services: pmcd
     pmcd: Version 5.1.1-4, 12 agents, 3 clients
     pmda: root pmcd proc pmproxy xfs linux nfsclient mmv kvm jbd2
           dm openmetrics
 pmlogger: primary logger: /var/log/pcp/pmlogger/be5455ac10c4/20210311.10.13
     pmie: primary engine: /var/log/pcp/pmie/be5455ac10c4/pmie.log

<< OUTPUT ABRIDGED >>
</pre>

The output shows the two main underlying components of PCP : __PCP's Collector Daemon (PMCD)__ which organizes, collects, manages metric information, and the __Performance Metric Domain Agents (PMDAs)__ which knows how to gather information for different services. The file paths for __pmlogger__ (which archives logs of performance metric values) and __pmie__ (inference engine for performance metrics) are also shown in the output.

## Available PCP Kernel metrics ##
PCP can collect and show a host of different system metrics.

Display the kernel metrics on the host with a short description using `pminfo` :

`pminfo -t kernel.all`{{execute T2}}

<pre class="file">
kernel.all.load [1, 5 and 15 minute load average]
kernel.all.intr [interrupt count metric from /proc/stat]
kernel.all.pswitch [context switches metric from /proc/stat]
kernel.all.sysfork [fork rate metric from /proc/stat]
kernel.all.running [number of currently running processes from /proc/stat]
kernel.all.blocked [number of currently blocked processes from /proc/stat]
kernel.all.boottime [boot time from /proc/stat]
kernel.all.hz [value of HZ (jiffies/second) for the currently running kernel]
kernel.all.uptime [time the current kernel has been running]
kernel.all.idletime [time the current kernel has been idle since boot]
kernel.all.nusers [number of user sessions on the system (including root)]
kernel.all.nroots [number of root user sessions on the system (only root)]
kernel.all.nsessions [number of utmp sessions (login records)]
kernel.all.lastpid [most recently allocated process identifier]
kernel.all.runnable [total number of processes in the (per-CPU) run queues]
kernel.all.nprocs [total number of processes (lightweight)]
kernel.all.pid_max [maximum process identifier from /proc/sys/kernel/pid_max]
kernel.all.cpu.user [total user CPU time from /proc/stat for all CPUs, including guest CPU time]
kernel.all.cpu.nice [total nice user CPU time from /proc/stat for all CPUs, including guest time]
kernel.all.cpu.sys [total sys CPU time from /proc/stat for all CPUs]
kernel.all.cpu.idle [total idle CPU time from /proc/stat for all CPUs]
kernel.all.cpu.intr [total interrupt CPU time from /proc/stat for all CPUs]
kernel.all.cpu.steal [total virtualisation CPU steal time for all CPUs]
kernel.all.cpu.guest [total virtual guest CPU time for all CPUs]
kernel.all.cpu.vuser [total user CPU time from /proc/stat for all CPUs, excluding guest CPU time]
kernel.all.cpu.guest_nice [total virtual guest CPU nice time for all CPUs]
kernel.all.cpu.vnice [total nice user CPU time from /proc/stat for all CPUs, excluding guest time]
kernel.all.cpu.wait.total [total wait CPU time from /proc/stat for all CPUs]
kernel.all.cpu.irq.soft [soft interrupt CPU time from /proc/stat for all CPUs]
kernel.all.cpu.irq.hard [hard interrupt CPU time from /proc/stat for all CPUs]
kernel.all.interrupts.total One-line Help: Error: One-line or help text is not available
kernel.all.interrupts.errors [interrupt error count from /proc/interrupts]
kernel.all.softirqs.total One-line Help: Error: One-line or help text is not available
kernel.all.entropy.avail [entropy available to random number generators]
kernel.all.entropy.poolsize [maximum size of the entropy pool]
kernel.all.pressure.cpu.some.avg [Percentage of time runnable processes delayed for CPU resources]
kernel.all.pressure.cpu.some.total [Total time processes stalled for CPU resources]
kernel.all.pressure.memory.some.avg [Percentage of time runnable processes delayed for memory resources]
kernel.all.pressure.memory.some.total [Total time processes stalled for memory resources]
kernel.all.pressure.memory.full.avg [Percentage of time all work is delayed from memory pressure]
kernel.all.pressure.memory.full.total [Total time when all tasks stall on memory resources]
kernel.all.pressure.io.some.avg [Percentage of time runnable processes delayed for IO resources]
kernel.all.pressure.io.some.total [Total time processes stalled for IO resources]
kernel.all.pressure.io.full.avg [Percentage of time all work is delayed from IO pressure]
kernel.all.pressure.io.full.total [Total time when all tasks stall on IO resources]
<< OUTPUT ABRIDGED >>
</pre>

Check out `man pminfo` if you are interested in more details about the `pminfo` tool.

## Monitoring performance using PCP ##

BCC is a toolkit for creating efficient kernel tracing and manipulation programs, and includes several useful tools and examples. 

Install the kernel-devel package for your currently running kernel and the bcc-tools packages.

`yum install -y kernel-devel-$(uname -r) bcc-tools`{{execute T2}}

>**NOTE:** In the command above, we embed the uname -r command to automatically determine, and embed, the version of the currently running kernel.

To learn more about the bcc-tools in Red Hat Enterprise Linux, check [Performance observability in practice with bcc-tools](https://lab.redhat.com/ebpf-tracing)

We will use the `cpudist` bcc-tool to monitor SQL Server performance in a later step.

# All about mssql tuned profile

The tuned tuning service can adapt the operating system to perform better under certain workloads by setting a tuning profile. The `tuned-adm` command-line tool allows users to switch between different tuning profiles.

First, check the currently active tuned profile :

`tuned-adm active`{{execute T1}}

<pre class="file">
Current active profile: virtual-guest
</pre>

Tuned is enabled by default and auto selects a suitable profile. Since this machine is a VM, tuned selects the virtual-guest profile.

List all the tuned profiles that can be set:

`tuned-adm list`{{execute T1}}

<pre class="file">
Available profiles:
- balanced                    - General non-specialized tuned profile
- desktop                     - Optimize for the desktop use-case
- hpc-compute                 - Optimize for HPC compute workloads
- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
- network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
- powersave                   - Optimize for low power consumption
- throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
- virtual-guest               - Optimize for running inside a virtual guest
- virtual-host                - Optimize for running KVM guests
</pre>

RHEL has a tuned profile for Microsoft SQL Server called *mssql*. However, this profile is not available since we haven't installed this profile yet. To learn more about the tuned profiles listed above check [Monitoring and managing system status and performance](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/getting-started-with-tuned_monitoring-and-managing-system-status-and-performance#tuned-profiles-distributed-with-rhel_getting-started-with-tuned)

Next, let's install the mssql tuned profile:  

`yum install -y tuned-profiles-mssql`{{execute T1}}

Again, list all the tuned profiles that can be set and notice that you have the mssql profile now available: 
`tuned-adm list`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- mssql                       - Optimize for MS SQL Server
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance

<< OUTPUT ABRIDGED >>
</pre>

Now, let's understand the contents of the mssql tuned profile. 
`cat /usr/lib/tuned/mssql/tuned.conf`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>
...
[main]
summary=Optimize for MS SQL Server
include=throughput-performance

[vm]
transparent_hugepage.defrag=always

[sysctl]
vm.max_map_count=800000
kernel.numa_balancing=0
kernel.sched_latency_ns=60000000
kernel.sched_min_granularity_ns=15000000
kernel.sched_wakeup_granularity_ns=2000000
..
<< OUTPUT ABRIDGED >>
</pre>

The mssql tuned profile has several kernel CPU scheduler settings modified that increase the CPU quantum.

If you are interested in more details about the tuned-adm tool that ships with RHEL :  

`man tuned-adm`{{execute T1}}

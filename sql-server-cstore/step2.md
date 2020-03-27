# All about tuned profiles for SQL Server

First, check the currently active tuned profile :
`tuned-adm active`{{execute T1}}

<pre class="file">
Current active profile: virtual-guest
</pre>

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

RHEL has a tuned profile for Microsoft SQL Server called mssql. Note that this profile is not available to be used yet.

Next, let's install the mssql tuned profile:  
`yum install -y tuned-profiles-mssql`{{execute T1}}

Again, list all the tuned profiles that can be set and notice that you have the mssql profile now available: 
`tuned-adm list`{{execute T1}}

<pre class="file">
Available profiles:
- balanced                    - General non-specialized tuned profile
- desktop                     - Optimize for the desktop use-case
- hpc-compute                 - Optimize for HPC compute workloads
- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- **mssql**                       - Optimize for MS SQL Server
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
- network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
- powersave                   - Optimize for low power consumption
- throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
- virtual-guest               - Optimize for running inside a virtual guest
- virtual-host                - Optimize for running KVM guests
Current active profile: virtual-guest
</pre>

If you are interested in more details about the tuned-adm tool that ships with RHEL :  
`man tuned-adm`{{execute T1}}

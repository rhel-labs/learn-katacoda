# Validate Environment and Install PCP

>**Note:** For this scenario, we have started installing SQL Server in the background. The background task will take between 2-5 minutes to complete. 

We have setup two terminal windows running on the local machine - The current terminal will be used for SQL Server and OS specific commands. The *pcp* terminal will be used for running pcp specific commands and looking at the output.

To check if SQL Server installation is complete, we can use the following command -

`systemctl status mssql-server.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.

Install the PCP packages using yum 

`yum install pcp-zeroconf -y`{{execute T1}}

Enable PCP to start collecting system performance data 

`systemctl start pmcd`{{execute T1}}
`systemctl enable pmcd`{{execute T1}}

Check the PCP service  

`pcp`{{execute T1}}

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

The output shows the two main underlying components of PCP : __PCP's Collector Daemon (PMCD)__ which organizes, collects, manages metric information, and the __Performance Metric Domain Agents (PMDAs)__ which knows how to gather information for different services.

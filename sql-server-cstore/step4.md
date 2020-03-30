# Measure CPU performance impact with tuned profiles

To measure CPU performance, we will be using a bcc-tool called `cpudist`. 

> The cpudist program summarizes task on-CPU time as a histogram, showing how long tasks spent on the CPU before being descheduled. Results can indicate oversubscription (too many tasks for too few processors), overhead due to excessive 
context switching (e.g. a common shared lock for multiple threads), uneven workload distribution, too-granular tasks, and more.

**Switch to terminal 'cpudist'**
First, lets start cpudist to measure CPU performance around the SQL Server process. We will pass as an argument to cpudist the pid of the SQL Server process

`./cpudist -p ``systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18`{{execute T2}}

>**Note:** In the command above, we embed the `uname -r` command to automatically determine, and embed, the version of the currently running kernel.

<pre class="file">
TBD
</pre>

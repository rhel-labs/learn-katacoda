# Measure CPU performance impact with tuned profiles

To measure CPU performance, we will be using a bcc-tool called `cpudist`. 

> cpudist summarizes task on-CPU time as a histogram, showing how long tasks spent on the CPU before being descheduled. Results show CPU oversubscription (too many tasks for too few processors), overhead due to excessive context switching (e.g. a common shared lock for multiple threads), uneven workload distribution, too-granular tasks, and more.

**Switch to terminal 'cpudist'**
First, lets start cpudist to measure CPU performance around the SQL Server process. 

`/usr/share/bcc/tools/cpudist -p ```systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18``` `{{execute T2}}

>**Note:** In the command above, we pass as an argument to cpudist, the process id (pid) of the SQL Server process.

<pre class="file">
Tracing on-CPU time... Hit Ctrl-C to end.
</pre>

>**Note:** Hit Ctrl-C to end tracing. You should not see any output yet since there is no workload running in SQL Server.

Let's retry, by running the column store query and tracing the CPU performance. In the command below, we are running sqlcmd as a background task, and monitoring CPU performance using cpudist.

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index' &; /usr/share/bcc/tools/cpudist -p ```systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18``` `{{execute T2}}

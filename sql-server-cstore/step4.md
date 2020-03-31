# Measure CPU performance impact with tuned profiles

To measure CPU performance, we will be using a bcc-tool called `cpudist`. 

> cpudist summarizes task on-CPU time as a histogram, showing how long tasks spent on the CPU before being descheduled. Results show CPU oversubscription (too many tasks for too few processors), overhead due to excessive context switching (e.g. a common shared lock for multiple threads), uneven workload distribution, too-granular tasks, and more.

**Switch to terminal 'cpudist'**
Now, lets start cpudist to measure CPU performance around the SQL Server process. We are running sqlcmd as a background task, and monitoring CPU performance using cpudist.

`nohup /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index' &>/dev/null &`{{execute T2}}

`/usr/share/bcc/tools/cpudist -p ```systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18``` `{{execute T2}}

>**Note:** In the command above, we pass as an argument to cpudist, the process id (pid) of the SQL Server process.

<pre class="file">
TBD 1
</pre>

>**Note:** Hit Ctrl-C to end tracing. 

Now, let's switch the tuned profile to mssql
`tuned-adm profile mssql`{{execute T2}}

Let's rerun the CPU performance measurement around the SQL Server process. 

`nohup /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index' &>/dev/null &`{{execute T2}}

`/usr/share/bcc/tools/cpudist -p ```systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18``` `{{execute T2}}

<pre class="file">
TBD 2
</pre>

Without scheduler tuning, there are some tasks that are getting descheduled possibly due to resource contention. This is shown in the bi-modal distrubution in the first cpudist result. When the CPU scheduler is tuned appropriately using the mssql tuned profile, there is less descheduling because of increased CPU quantum assigned by the kernel.

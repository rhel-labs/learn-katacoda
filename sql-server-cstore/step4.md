# Measure CPU performance impact with tuned profiles

To measure CPU performance, we will be using a bcc-tool called `cpudist`. 

`cpudist` summarizes task on-CPU time as a histogram, showing how long tasks spent on the CPU before being descheduled. Results show CPU oversubscription (too many tasks for too few processors), overhead due to excessive context switching (e.g. a common shared lock for multiple threads), uneven workload distribution, too-granular tasks, and more.

Switch to term *cpudist* terminal

Now, let's run the columnstore index workload using sqlcmd as a background task, and monitoring CPU performance using `cpudist`.

`(/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index' &>/dev/null &) && (/usr/share/bcc/tools/cpudist 10 1 -p $(systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18)) `{{execute T2}}

>**Note:** In the command above, we pass as an argument to `cpudist`, the process id (pid) of the SQL Server process by using an embedded `systemctl` command.

<pre class="file">
     usecs               : count     distribution
         0 -> 1          : 0        |                                        |
         2 -> 3          : 0        |                                        |
         4 -> 7          : 5        |                                        |
         8 -> 15         : 45       |*******                                 |
        16 -> 31         : 30       |*****                                   |
        32 -> 63         : 5        |                                        |
        64 -> 127        : 1        |                                        |
       128 -> 255        : 2        |                                        |
       256 -> 511        : 4        |                                        |
       512 -> 1023       : 0        |                                        |
      1024 -> 2047       : 1        |                                        |
      2048 -> 4095       : 0        |                                        |
      4096 -> 8191       : 227      |****************************************|
      8192 -> 16383      : 102      |*****************                       |
     16384 -> 32767      : 24       |****                                    |
     32768 -> 65535      : 15       |**                                      |
     65536 -> 131071     : 9        |*                                       |
    131072 -> 262143     : 4        |                                        |
</pre>

With default kernel CPU scheduler tuning,  tasks were able to run between 4096-16383 usecs (1usec = 1 microsecond) before being descheduled. This is shown in the bi-modal distribution in the `cpudist` result above. 

Now, switch the tuned profile to the mssql tuned profile, which will add more finer granularity to the kernel CPU scheduler 

`tuned-adm profile mssql`{{execute T2}}

Re-run the CPU performance measurement around the SQL Server process 

`(/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index' &>/dev/null &) && (/usr/share/bcc/tools/cpudist 10 1 -p $(systemctl status mssql-server.service --no-pager | grep '/opt/mssql/bin/sqlservr' | sed -n 2p | cut -c14-18)) `{{execute T2}}

<pre class="file">
     usecs               : count     distribution
         0 -> 1          : 0        |                                        |
         2 -> 3          : 9        |                                        |
         4 -> 7          : 89       |**                                      |
         8 -> 15         : 310      |*******                                 |
        16 -> 31         : 401      |*********                               |
        32 -> 63         : 499      |************                            |
        64 -> 127        : 894      |*********************                   |
       128 -> 255        : 1375     |*********************************       |
       256 -> 511        : 1645     |****************************************|
       512 -> 1023       : 134      |***                                     |
      1024 -> 2047       : 158      |***                                     |
      2048 -> 4095       : 569      |*************                           |
      4096 -> 8191       : 13       |                                        |
      8192 -> 16383      : 9        |                                        |
     16384 -> 32767      : 16       |                                        |
     32768 -> 65535      : 20       |                                        |
     65536 -> 131071     : 19       |                                        |
</pre>

When the kernel CPU scheduler is tuned appropriately using the mssql tuned profile, there is more consistent scheduling because of increased CPU granularity assigned by the kernel. This is shown by the continous distribution in the `cpudist` result above.

The mssql tuned profile enables Columnstores in SQL server to better utilize the CPU. This means that shorter tasks can be completed in shorter time windows, compared to previously where they had larger time windows and thus wasted unused CPU cycles.  


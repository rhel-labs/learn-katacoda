# Using Perf for metrics collection

>**NOTE:** In this step we will be using the *Flame* terminal. 

Select the *Flame* terminal to run commands in this step.

## Collect performance samples using the Perf tool for a basic SELECT MySQL query

The linux perf command has 3 main parts - **action**, **event** and **scope**. 

In the command below, we are using the record action of the perf command to collect samples at a frequency of 99 samples per second, across all CPUs.
Perf is also monitoring a particular process (mysqld in this case), while running a specific SELECT query.

`perf record flamegraph -a -F 99 -g -p $(pgrep -x mysqld) -- mysql books -e "SELECT * FROM posts"`{{execute T2}}

<pre class="file">
<< OUTPUT ABRIDGED >>

[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.020 MB perf.data (37 samples) ]

<< OUTPUT ABRIDGED >>
</pre>

The output shows the result of running the SELECT query, and the performance samples are collected in the perf.data file.

## Output the flame graph ##
The report option of perf script can be used to output the flame graph in html format -

`perf script report flamegraph`{{execute T2}}

Check out `man perf` if you are interested in more details about the `perf` tool.

## Monitoring performance using PCP ##

The `pmrep` utility takes any of the available metrics and reports them in ASCII tables.

The command reports idle processor utilization for each CPU on the host, every 1 seconds in a 5 seconds window :

`pmval -t 1 -T 5 kernel.percpu.cpu.idle`{{execute T2}}

>**NOTE:** In the command above, if the hostname is not specified, it defaults to using `localhost`. By using the -h option, you can specify the hostname of a remote host to monitor for the specific metric.

<pre class="file">
metric:    kernel.percpu.cpu.idle
host:      ae6a0554552e
semantics: cumulative counter (converting to rate)
units:     millisec (converting to time utilization)
samples:   6
interval:  1.00 sec

              cpu0                  cpu1    
               0.9694                0.9894 
               0.9693                0.9993 
               0.9692                0.9892 
               0.9692                0.9891 
</pre>

To learn more about the PCP in Red Hat Enterprise Linux, check [Performance observability in practice with bcc-tools](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/monitoring-performance-with-performance-co-pilot_monitoring-and-managing-system-status-and-performance)

We will use the `pmval` tool to monitor SQL Server performance in a later step.

# Using Perf for metrics collection

>**NOTE:** In this step we will be using the *Flame* terminal. 

Select the *Flame* terminal to run commands in this step.

## Collect performance samples using the Perf tool for a basic SELECT MySQL query

Learn about the query execution plan that the database is going to run using the EXPLAIN statement in MySQL 

`mysql -e "use sampleDB; EXPLAIN format=tree select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T2}}

The linux perf command has 3 main parts - **action**, **event** and **scope**. 

In the command below, we are using the record action of the perf command to collect samples at a frequency of 200 samples per second, across all CPUs.
Perf is also monitoring a particular process (mysqld in this case), while running a specific SELECT query.

`perf record -a -F 200 -g -p $(pgrep -x mysqld) -- mysql  -e "select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T2}}

<pre class="file">
<< OUTPUT ABRIDGED >>

[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.020 MB perf.data (37 samples) ]

<< OUTPUT ABRIDGED >>
</pre>

The output shows the result of running the SELECT query, and the performance samples are collected in the perf.data file.

## Output the flame graph ##
The report option of perf script can be used to generate an HTML format report for better readability - 

`perf script report flamegraph`{{execute T2}}

Check out `man perf` if you are interested in more details about the `perf` tool.

## Copy the report to the Apache Server ##

Perf is not dependant on Apache web server, however it is needed in this lab for the purposes of viewing the flame graph in the HTML format.

Copy the flamegraph.html file to the index.html page of the Apache web server - 

`cp flamegraph.html /var/www/html/index.html`{{execute T2}}

## View the flame graph in a web browser ##
Now that the HTML report is generated, you can check the flame graph in the *Web* tab of this lab interface.




# Optimizing the MySQL workload on Red Hat Enterprise Linux

For this step, we will be switching back to our *Terminal* tab. 

To eliminate a full table scan during the join operation, let's create an index `ind_t1_c2` on table t1 with 50,000 rows, on the join column c2

`mysql -A sampleDB -e "CREATE INDEX idx_t1_c2 on t1(c2);"`{{execute T1}}

## Check the execution plan of the SELECT query with a JOIN clause

Let's look at the query execution plan that the database is going to run using the EXPLAIN statement in MySQL 

`mysql -A sampleDB -e "EXPLAIN format=tree select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T2}}

<pre class="file">
TBD
</pre>

Notice that in this case, the database leverages the `idx_t1_c2` index

## Re-run the perf command to record performance metrics for MySQL query

Let's again use perf to monitor the mysqld process, while running the same SELECT query joining t1 and t2 - 

`perf record -a -F 40 -g -p $(pgrep -x mysqld) -- mysql -A sampleDB -e "select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T2}}

<pre class="file">
<< OUTPUT ABRIDGED >>

[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.020 MB perf.data (37 samples) ]

<< OUTPUT ABRIDGED >>
</pre>

The output shows the result of running the SELECT query, and the performance samples are collected in the perf.data file.

## Create a new flame graph ##
The report option of perf script can be used to generate an HTML format report for better readability - 

`perf script report flamegraph2`{{execute T2}}

Check out `man perf` if you are interested in more details about the `perf` tool.

## Copy the report to the Apache Server ##

Copy the flamegraph2.html file to the index.html page of the Apache web server - 

`cp flamegraph2.html /var/www/html/index.html`{{execute T2}}

## View the new flame graph in a web browser ##
Now that the HTML report is generated, you can check the flame graph in the *Web* tab of this lab interface.

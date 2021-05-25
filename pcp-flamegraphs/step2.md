# Using Perf for metrics collection

>**NOTE:** In this step we will be using the *Flame* terminal. 

Select the *Flame* terminal to run commands in this step.

## Load sample data into the database
Before we proceed, let's load sample data into MySQL. 

The pre-existing `sample-test.sql` script creates a database called `sampleDB` with two tables, and loads random numeric them into data - table t1 with 50,000 rows, and table t2 with 10,000 rows 

`mysql < sample-test.sql`{{execute T2}}

Count the number of rows in table t1

`mysql -A sampleDB -e "SELECT count(*) from t1;"`{{execute T2}}

<pre class="file">
+----------+
| count(*) |
+----------+
|  5000000 |
+----------+
1 row in set (0.00 sec)
</pre>

## Run the perf command to record performance metrics for MySQL query

The linux perf command has 3 main parts - **action**, **event** and **scope**. 

In the command below, we are using the record action of the perf command to collect samples at max frequency, across all CPUs.
Perf is also monitoring a particular process (mysqld in this case), while running a specific SELECT query.

`perf record -a -F max -g -p $(pgrep -x mysqld) -- mysql -A sampleDB -e "select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T2}}

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

## Check the query execution plan of a SELECT query with a JOIN clause

The flame graph gives us indications on what's running hot on the CPU. 

Let's look at the query execution plan that the database is going to run using the EXPLAIN statement in MySQL 

`mysql -A sampleDB -e "EXPLAIN format=tree select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T2}}

<pre class="file">
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                                                           |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Inner hash join (t1.c2 = t2.c2)  (cost=500104.14 rows=500000)
    -> Table scan on t1  (cost=0.05 rows=5000)
    -> Hash
        -> Table scan on t2  (cost=101.00 rows=1000)
 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
</pre>

Note that the join operator of MySQL does a full scan on table t2, because there is no index defined on the join column (c2) on table t2. 
As a table grows, the costs of doing such an operation grows, and is a performance bottleneck.




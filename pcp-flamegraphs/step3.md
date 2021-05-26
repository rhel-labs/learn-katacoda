# Optimizing the MySQL workload on Red Hat Enterprise Linux

For this step, we will be using the *Terminal* tab for MySQL commands, and *Flame* tab for perf and flame graph commands. 

To optimize query performance in MySQL, one simple approach is to create an index that can be used for query processing. 

Create a MySQL index called `ind_t1_c2` on table t1 with 50,000 rows, on the join column c2. The index on column c2 will help MySQL use the index for efficiently searching matches instead of doing a full table scan on t1. 

`mysql -A sampleDB -e "CREATE INDEX idx_t1_c2 on t1(c2);"`{{execute T1}}

## Check the execution plan of the SELECT query with a JOIN clause

Look at the updated query execution plan that MySQL will run using the EXPLAIN statement - 

`mysql -A sampleDB -e "EXPLAIN format=tree select * from t1 join t2 on t1.c2 = t2.c2;"`{{execute T1}}

<pre class="file">
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                                                           |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Nested loop inner join  (cost=**7433.25** rows=18309)
    -> Table scan on t2  (cost=1025.00 rows=10195)
    -> Index lookup on t1 using **idx_t1_c2** (c2=t2.c2)  (cost=0.45 rows=2)
 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
</pre>

Notice that in this case, the database leverages the `idx_t1_c2` index, and the overall cost of executing the query is much lesser than without the index.

## Re-run the perf command to record performance metrics for MySQL query

Use perf to record performance of the mysqld process running the same query as the previous step - 

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

`perf script report flamegraph`{{execute T2}}

Check out `man perf` if you are interested in more details about the `perf` tool.

## Copy the report to the Apache Server ##

Remove index.html file from Apache, and copy the newly generated flamegraph.html file into the index.html page of the Apache web server - 

`rm -f /var/www/html/index.html; cp flamegraph.html /var/www/html/index.html`{{execute T2}}

## View the new flame graph in a web browser ##
Now that the HTML report is generated, you can check the flame graph in the *Web* tab of this lab interface.

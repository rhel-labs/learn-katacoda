# Columnstore Indexes in SQL Server

Columnstore indexes in SQL Server gives great performance to queries that scan and run analytics on large sets of rows. 

For this step, we will be switching back to our *Terminal* tab. 

Let's first look at the performance of SQL Server without using columnstore indexes on a table with 5 million rows. The script queries the table 10 times outputting the time it takes for the query to finish returning the result set each time. The SELECT query calculates the total price, and average price from the orders table without using columnstore indexes. The *option* clause tells SQL Server to ignore the existing columnstore index when running this query.

<pre class="file">                                                                                                            //The aggregation query over 5 million rows with SQL optimizer option to ignore columnstore index
SELECT SUM(Price), AVG(Price) FROM Orders 
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX)
</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSNoIndex.sql | grep 'columnstore index'`{{execute T1}}

Lets re-run the same query using column store indexes. The script queries the table 10 times outputting the time it takes for the query to return the result set using column store indexes.

<pre class="file">                                                               
//The aggregation query over 5 million rows
SELECT SUM(Price), AVG(Price) FROM Orders;
</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index'`{{execute T1}}

>**Note:** The query performance of running an analytical query on top of 5 million rows with columnstore is better than without using columnstore indexes. 

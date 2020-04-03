# Columnstore Indexes in SQL Server

Columnstore indexes in SQL Server gives great performance to queries that scan large sets of rows (millions of rows typically), and also provides huge savings in storage space. They are best suited for analytical use-cases.

Now, let's look at the performance of SQL Server without using column store indexes on a table with 5 million rows. The script queries the table 10 times outputting the time it takes for the query to finish returning the result set each time.

<pre class="file">
                                                                                                                         
//The aggregation query over 5 million rows with SQL optimizer option to ignore columnstore index
SELECT SUM(Price), AVG(Price) FROM Orders 
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX)

</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSNoIndex.sql | grep 'columnstore index'`{{execute T1}}

Now, let's run the same query using column store indexes. The script queries the table 10 times outputting the time it takes for the query to finish returning the result set each time. Each time, the query processor uses the column store index. 

<pre class="file">
//Creating the nonclustered columnstore index
CREATE NONCLUSTERED COLUMNSTORE INDEX [IX_Orders_Price] ON Orders
(
  [Price]
);                                                                                                                           

//The aggregation query over 5 million rows
SELECT SUM(Price), AVG(Price) FROM Orders;
</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index'`{{execute T1}}

>**Note:** The query performance of running an analytical query on top of 5 million rows with columnstore is better than without using columnstore indexes. 

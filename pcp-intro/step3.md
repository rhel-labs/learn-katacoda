# Configuring PMDAs for SQL Server

For this step, we will be switching back to our *Terminal* tab. 

The PCP Microsoft SQL Server Performance Metrics Domain Agent (PMDA) queries important performance metrics from SQL Server using SQL Servers Dynamic Management Views (DMVs).

To list the PCP PMDA packages related to Microsoft SQL Server -

`yum search pcp-pmda | grep "Microsoft SQL Server"`{{execute T1}}

<pre class="file">
Last metadata expiration check: 0:24:59 ago on Fri 12 Mar 2021 09:20:29 AM EST.
pcp-pmda-mssql.x86_64 : Performance Co-Pilot (PCP) metrics for Microsoft SQL Server
</pre>

Install the PCP PMDA package for Microsoft SQL Server - 

`sudo yum install pcp-pmda-mssql -y`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>
Installed:
  pcp-pmda-mssql-5.1.1-4.el8_3.x86_64                                                                 
<< OUTPUT ABRIDGED >>
</pre>

Update the SQL Server PMDA configuration file to update the SQL Server sa password.  

`sed -i 's/P4$$W0rd/RedHat1/g' /var/lib/pcp/pmdas/mssql/mssql.conf`{{execute T1}}

Let's first look at the performance of SQL Server without using columnstore indexes on a table with 5 million rows. The script queries the table 10 times outputting the time it takes for the query to finish returning the result set each time. The SELECT query calculates the total price, and average price from the orders table without using columnstore indexes. The *option* clause tells SQL Server to ignore the existing columnstore index when running this query.

<pre class="file">
//The aggregation query over 5 million rows with SQL optimizer option to ignore columnstore index
SELECT SUM(Price), AVG(Price) FROM Orders 
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX)
</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSNoIndex.sql | grep 'columnstore index'`{{execute T1}}

Lets re-run the same query using columnstore indexes. The script queries the table 10 times outputting the time it takes for the query to return the result set using columnstore indexes.

<pre class="file">
//The aggregation query over 5 million rows
SELECT SUM(Price), AVG(Price) FROM Orders;
</pre>

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index'`{{execute T1}}

>**Note:** The query performance of running an analytical query on top of 5 million rows with columnstore is better than without using columnstore indexes. 

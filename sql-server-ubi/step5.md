# Connect to SQL Server and Query Data

Run the script to install the pubs data in the testDB database. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P RedHat1! -d pubs -N -C -i /var/opt/mssql/scripts/InstPubs.sql`{{execute}}

Now that the data is loaded, query the data  

> How about finding the store name of the top performing store and the total sales for that store?  

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P RedHat1! -d pubs -N -C -Q "SELECT TOP 1 stores.stor_name as storename, sum(sales.qty) as sumqty FROM stores JOIN sales ON stores.stor_id = sales.stor_id GROUP BY stores.stor_id, stores.stor_name ORDER BY sumqty DESC"`{{execute T1}}

<pre class="file">
storename                                sumqty
---------------------------------------- -----------
Doc-U-Mat: Quality Laundry and Books             130

(1 rows affected)
</pre>

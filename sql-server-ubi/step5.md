# Connect to SQL Server and Query Data

Run the script to create the in-memory table and load data

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -N -C -i /var/opt/mssql/scripts/imoltp.sql`{{execute T3}}

> Let's find out the greatest sessionID in the UserSession table   

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -d imoltp -N -C -Q "SELECT max(sessionID) FROM dbo.UserSession`{{execute T3}} 

<pre class="file">
-----------
          6

(1 rows affected)
</pre>

> Let's find out the average total price in the ShoppingCart table  

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -d imoltp -N -C -Q "SELECT avg(TotalPrice) FROM dbo.ShoppingCart`{{execute T3}} 

<pre class="file">
---------------------
              55.4000

(1 rows affected)
</pre>



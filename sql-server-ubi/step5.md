# Connect to SQL Server and Query Data

Run the script to install the in-memory OLTP dataset

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -N -C -i /var/opt/mssql/scripts/imoltp.sql`{{execute T3}}

<pre class="file">
TBD1
</pre>

Now that the tables are created, let's load some data

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -N -C -i /var/opt/mssql/scripts/imoltp-data.sql`{{execute T3}}

> Let's find out the number of rows loaded in the session and shopping cart tables?   

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -d pubs -N -C -Q "SELECT count(*) FROM dbo.UserSession as SessionCount, dbo.ShoppingCart as ShoppersCount"`{{execute T3}} 

<pre class="file">
TBD2
</pre>

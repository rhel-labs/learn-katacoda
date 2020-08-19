# Query In-Memory OLTP data in SQL Server

Run the script to create the in-memory table and load data

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -N -C -i /var/opt/mssql/scripts/imoltp.sql`{{execute T3}}


> Let's find out the number of total sessions in the UserSession table

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -d imoltp -N -C -Q "SELECT count(sessionID) FROM dbo.UserSession"`{{execute T3}} 

<pre class="file">
          6

(1 rows affected)
</pre>

> Let's find out the UserID of the user who has the highest total price items in their shopping cart  

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -d imoltp -N -C -Q "SELECT top 1 UserID FROM dbo.ShoppingCart order by TotalPrice desc"
`{{execute T3}} 

<pre class="file">
UserID
-----------
        342

(1 rows affected)
</pre>



# Re-query In-Memory OLTP data in SQL Server

Check the servername of the instance and confirm that it is **mssqlserver-restored**

`/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'RedHat1!' -Q "select @@servername"`{{execute T3}}

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



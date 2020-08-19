# Re-query In-Memory OLTP data in SQL Server

Launch an interactive bash shell in the *mssqlserver-restored* container -

`podman exec -it mssqlserver-restored "/bin/bash"`{{execute T3}}

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

The T-SQL query answers on the restored container are same as the T-SQL query answers on the container before the checkpoint was taken.

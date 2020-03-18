# Connect to SQL Server and Query Data

Now, let's open up the sqlcmd shell prompt connected to the **pubs** database. There is a task in the Ansible playbook to create this database, and the sa password credentials is the password setup in the playbook variables. 

If you haven't changed the sa password in the previous step, you should be able to successfully execute the command below and run the script to install the pubs data in the testDB database. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssWORD! -d pubs -N -C -i ./InstPubs.sql`{{execute}}

Now that the data is loaded, let's connect to the database, and execute a query - How about  

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssWORD! -d pubs -N -C -Q "SELECT TOP 1 stores.stor_id, sum(sales.qty) as sumqty FROM stores JOIN sales ON stores.stor_id = sales.stor_id GROUP BY stores.stor_id, stores.stor_name ORDER BY sumqty DESC"`{{execute T1}}

<pre class="file">
TBD
</pre>

# Columnstore Indexes in SQL Server

Columnstore indexes in SQL Server gives great performance to queries that scan large sets of rows (millions of rows typically), and also provides huge savings in storage space. They are best suited for analytical use-cases.

**Switch to terminal 'cpudist'**

First, install the kernel-devel package for your currently running kernel and the bcc-tools packages.  

`yum install -y kernel-devel-$(uname -r) bcc-tools`{{execute T2}}

>**Note:** In the command above, we embed the `uname -r` command to automatically determine, and embed, the version of the currently running kernel.

Next, inspect the content of the bcc-tools package to see some of the pre-built tool catalog that is provided.  Each of these tools has a `man` page which provides details on what data the tool produces as well as any options that may be used when running the tool.

`rpm -ql bcc-tools | grep /usr/share/bcc/tools/`{{execute T2}}

<pre class="file">
/usr/share/bcc/tools/argdist
/usr/share/bcc/tools/bashreadline
/usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biosnoop

<< OUTPUT ABRIDGED >>
</pre>

**Switch back to the main terminal**

Now, let's look at the performance of SQL Server without using column store indexes. The script queries the table 10 times outputting the time it takes for the query to finish returning the result set each time.

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSNoIndex.sql | grep 'columnstore index'`{{execute T1}}

Now, let's run the same query using column store indexes. The script queries the table 10 times outputting the time it takes for the query to finish returning the result set each time. Each time, the query processor uses the column store index. 

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i ~/Scripts/CSIndex.sql | grep 'columnstore index'`{{execute T1}}

>**Note:** The query performance of running an analytical query on top of 5 million rows with columnstore is better than without using columnstore indexes. 

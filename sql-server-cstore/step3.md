# Columnstore Indexes in SQL Server

> Columnstore indexes in SQL Server gives great performance to queries that scan large sets of rows (millions of rows typically), and also provides huge savings in storage space. Typical compression rates can be 90%. They are best used for analytics queries, and are default for many data warehouse schemas. 

First, install the kernel-devel package for your currently running kernel and the bcc-tools packages.  

`yum install -y kernel-devel-$(uname -r) bcc-tools`{{execute T3}}

>**Note:** In the command above, we embed the `uname -r` command to automatically determine, and embed, the version of the currently running kernel.

Next, inspect the content of the bcc-tools package to see some of the pre-built tool catalog that is provided.  Each of these tools has a `man` page which provides details on what data the tool produces as well as any options that may be used when running the tool.

`rpm -ql bcc-tools | grep /usr/share/bcc/tools/`{{execute T3}}

<pre class="file">
/usr/share/bcc/tools/argdist
/usr/share/bcc/tools/bashreadline
/usr/share/bcc/tools/biolatency
/usr/share/bcc/tools/biosnoop

<< OUTPUT ABRIDGED >>
</pre>

Now, let's look at the performance of SQL Server with and without using columnstore indexes.

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i CSNoIndex.sql | grep 'columnstore index'`{{execute T2}}

`/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Redhat1! -i CSIndex.sql | grep 'columnstore index'`{{execute T2}}

>**Note:** The query performance of running an analytical query on top of 5 million rows with columnstore is better than without using columnstore indexes. 

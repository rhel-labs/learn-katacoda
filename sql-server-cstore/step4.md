# Measure CPU performance impact with tuned profiles

To measure CPU performance, we will be using a bcc-tool called cpudist. 

The cpudist program summarizes task on-CPU time as a histogram, showing how long tasks spent on the CPU before being descheduled. Results can indicate oversubscription (too many tasks for too few processors), overhead due to excessive 
context switching (e.g. a common shared lock for multiple threads), uneven workload distribution, too-granular tasks, and more.

First, lets start cpudist to measure CPU performance around the SQL Server process

<pre class="file">
Generating a RSA private key
.......................................................++++
..............................................++++
writing new private key to 'mssql.key'
-----
</pre>

Change the owner of the key files to the mssql user and group
`chown mssql:mssql /etc/ssl/private/mssql.key /etc/ssl/certs/mssql.pem`{{execute T1}}

Verify the bit-length of the key to confirm that it is 4096 bit.

`openssl x509 -in /etc/ssl/certs/mssql.pem -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (4096 bit)
</pre>

Now that a new SSL certificate has been created using a larger public key, 
it complies with the requirements of the  FUTURE cryptographic policy.

> **NOTE:** It is recommended practice to use Certificate Authority (CA) issued
certificates.  If you were using a certificate from a Certificate Authority,
you would need to generate a new Certificate Signature Request (csr) and
submit it to your CA.  When you receive the signed certificate from your CA,
you would then position it, and update any configuration files needed to
reference it.

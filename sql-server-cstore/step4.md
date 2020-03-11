# Regenerate SSL certificate

To comply with the system-wide cryptographic policy of FUTURE, you will need 
to generate a replacement SSL certificate using an RSA key of at least 3072 bit 
length, or longer. 

Make directory for private key
`mkdir /etc/ssl/private/`{{execute T1}} 

The new RSA certificate will use a public key of 4096 bits.
`openssl req -x509 -nodes -newkey rsa:4096 -subj "/CN=${HOSTNAME}" -keyout /etc/ssl/private/mssql.key -out /etc/ssl/certs/mssql.pem -days 365`{{execute T1}}

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

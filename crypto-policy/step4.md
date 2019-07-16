# Regenerate SSL certificate

To comply with the system-wide cryptographic policy of FUTURE, you will need 
to generate a replacement SSL certificate using an RSA key of 4096 bit 
length. 

`openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -subj='/C=XX/O=Default' -keyout /etc/pki/tls/private/localhost-new.key -out /etc/pki/tls/certs/localhost-new.crt`{{execute T1}}$

<pre class="file">
Genarating a RSA private key
.......................................++++
....................+++
writing new private key to '/etc/pki/tls/private/localhost-new.key'
-----
</pre>

Check the bit-length of the key to verify that it is configured for 4096.

`openssl x509 -in /etc/pki/tls/certs/localhost-new.crt -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (4096 bit)
</pre>

Now that a new, larger bit-length certificate has been created.  You need to
update the Apache service configuration to use the new certificate files.   

The __SSLCertificateFile__ parameter in the __/etc/httpd/conf.d/ssl.conf__ 
file needs to be updated to point to the newly created certificate crt file.
`sed -i 's+/etc/pki/tls/certs/localhost.crt+/etc/pki/tls/certs/localhost-new.crt+g' /etc/httpd/conf.d/ssl.conf; grep '^SSLCertificateFile' /etc/httpd/httpd.conf/ssl.conf`{{execute T1}}

<pre class="file">
SSLCertificateFile /etc/pki/tls/certs/localhost-new.crt
</pre>

In the above command, you used the StreamEDitor (sed) command, however,
alternatively, you could have used a text editor to edit the file.   

Next, update the __SSLCertificateKeyFile__ directive to point to the newly
created SSL key file, __/etc/pki/tls/private/localhost-new.key__.   

`sed -i 's+/etc/pki/tls/private/localhost.key+/etc/pki/tls/private/localhost-new.key+g' /etc/httpd/conf.d/ssl.conf; grep '^SSLCertificateKeyFile' /etc/httpd/conf.d/ssl.conf`{{execute T1}}

<pre class="file">
SSLCertificateKeyFile /etc/pki/tls/private/localhost-new.key
</pre>

The lab again uses the sed command, but you could have alternatively used a
file editor to make the change to the key that matches the updated certificate
file.

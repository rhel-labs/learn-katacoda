#Resolve Apache service issues to comply with crypto policy 

Regenerate a new RSA key of 4096 bit length
`openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -subj='/C=XX/O=Default' -keyout /etc/pki/tls/private/localhost-new.key -out /etc/pki/tls/certs/localhost-new.crt`{{execute T1}}

Check the bit-length of the certificate to verify that it is 4096 bits
`openssl x509 -in /etc/pki/tls/certs/localhost-new.crt -text | grep bit`{{execute T1}}

Update the Apache Server TLS configuration file

Edit */etc/httpd/conf.d/ssl.conf* to change a few key file paths to point to the new public and private key files
<pre class="file">
SSLCertificateFile /etc/pki/tls/certs/localhost-new.crt
</pre>
`sed -i 's+/etc/pki/tls/certs/localhost.crt+/etc/pki/tls/certs/localhost-new.crt+g' /etc/httpd/conf.d/ssl.conf`{{execute T1}}

<pre class="file">
SSLCertificateKeyFile /etc/pki/tls/private/localhost-new.key
</pre>
`sed -i 's+/etc/pki/tls/private/localhost.key+/etc/pki/tls/private/localhost-new.key+g' /etc/httpd/conf.d/ssl.conf`{{execute T1}}

Restart Apache server to pick up the new crypto policy
`systemctl restart httpd.service`{{execute T1}}

Check whether Apache server is started
`systemctl status httpd.service --no-pager`{{execute T1}}

Connect to Apache over port over the default Apache https port (443) and show that the settings have been inherited
`echo -n |openssl s_client -connect localhost:443 | grep '^Server public key'`{{execute T1}}

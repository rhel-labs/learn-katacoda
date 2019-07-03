#Validate Environment 
Using the top terminal session, validate the initial environment.

The first step is to verify that Apache server is running- 
`systemctl status httpd.service --no-pager`{{execute T1}}

Assuming that Apache is successfully running, check the default certificate in Apache configuration file -
`grep '^SSLCertificateFile' /etc/httpd/conf.d/ssl.conf`{{execute T1}}

Check the length of the cipher in the certificate file. By default Apache uses a certificate with bit length of 2048.
`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep bit`{{execute T1}}

Connect to Apache over port over the default Apache https port (443) and show that the settings have been inherited
`echo -n |openssl s_client -connect localhost:443 | grep '^Server public key'`{{execute T1}}

Next, verify the current default crypto policy 
`update-crypto-policies --show`{{execute T1}}


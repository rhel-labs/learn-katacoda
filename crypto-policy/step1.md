Using the top terminal session, validate the initial environment.

First verify that apache server is running. 

`systemctl status httpd.service`{{execute T1}}

Check the default certificate in apache configuration
`grep '^SSLCertificateFile' /etc/httpd/conf.d/ssl.conf`{{execute T1}}

Check the length of the cipher in the certificate file. By default apache uses a certificate with bit length of 2048.
`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep ‘bit’`{{execute T1}}

Connect to apache over port over the default apache https port (443) and show that the settings have been inherited
`openssl s_client -connect localhost:443 | grep '^Server public key'`{{execute T1}}


Next, verify the current default crypto policy 
`update-crypto-policies --show`{{execute T1}}


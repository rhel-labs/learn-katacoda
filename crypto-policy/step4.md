#Resolve Apache service issues to comply with crypto policy 

Regenerate a new RSA key of 4096 bit length - when prompted for values just hit the *enter* key and go with defaults
`openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/pki/tls/private/localhost-new.key -out /etc/pki/tls/certs/localhost-new.crt`{{execute T1}}

Check the bit-length of the certificate to verify that it is 4096 bits
`openssl x509 -in /etc/pki/tls/certs/localhost-new.crt -text | grep ‘bit’`{{execute T1}}

Update the Apache Server TLS configuration file
Open /etc/httpd/conf.d/ssl.conf in your favorite editor and make the following changes
SSLCertificateFile /etc/pki/tls/certs/localhost-new.crt
SSLCertificateKeyFile /etc/pki/tls/private/localhost-new.key

Restart Apache server to pick up the new crypto policy
`systemctl restart httpd.service`{{execute T1}}

Check whether Apache server is started
`systemctl status httpd.service`{{execute T1}}

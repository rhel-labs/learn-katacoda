# Validate the Environment 
Using the provided system terminal session, validate the initial environment.   

First, verify the current system-wide cryptographic policy.   

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
DEFAULT
</pre>

The default configuration on Red Hat Enterprise Linux for the system-wide
cryptographic policy (sometimes referred to as "crypto policy") is a
policy named `DEFAULT`.   

Secure Socket Layer (SSL) is one of the cryptography methods managed by
the system-wide cryptography policy.  Throughout the exercise, you will
work with Apache as it is a service that utilizes SSL.  Hence, changes
to how SSL is managed will potentially impact those services that utilize
those cryptography frameworks.

Verify that Apache is running on the machine.

`systemctl status httpd.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.   

By default, Apache stores the automatically created, SSL self-signed
certificate at /etc/pki/tls/certs/localhost.crt. Verify the length of the 
RSA public key used by the automatically created, self-signed SSL certificate 
file.    

`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (2048 bit)
</pre>

By default, Apache uses a certificate with a 2048 bit public key.   

Use `openssl` to connect to Apache on the https port (443).  As part of this 
connection, openssl will receive a copy of the certificate to encrypt the 
connection with the service.  You will verify that a client web browser is 
utilizing the 2048 bit Public-Key certificate viewed above.   

`openssl s_client -connect localhost:443 </dev/null 2>/dev/null | grep '^Server public key'`{{execute T1}}

<pre class="file">
Server public key is 2048 bit
</pre>

Client browsers are provided the 2048 bit key and SSL certificate by the 
Apache service to encrypt their connection.   


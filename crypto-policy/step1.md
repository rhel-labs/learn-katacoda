# Validate the Environment 
Using the provided system terminal session, validate the initial environment.   

First, verify that the Apache service is running.   

`systemctl status httpd.service --no-pager`{{execute T1}}

<pre class="file">
<< OUTPUT ABRIDGED >>

Active: active (running) since Monday 2019-07-15 19:24:18 EDT; 3h 59min left

<< OUTPUT ABRIDGED >>
</pre>

Verify that the Active status is __active (running)__.   

By default, Apache stores the automatically created, SSL self-signed
certificate at /etc/pki/tls/certs/localhost.crt. Verify the length of the 
cipher in the automatically created self-signed SSL certificate file.    

`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (2048 bit)
</pre>

By default, Apache uses a certificate with a 2048 bit cypher.   

Use `curl`, a command-line http and ftp client, to connect to Apache on the 
https port (443) and show that the service is using this certificate.   

`echo -n |openssl s_client -connect localhost:443 2>/dev/null | grep '^Server public key'`{{execute T1}}

<pre class="file">
Server public key is 2048 bit
</pre>

Client browsers are provided the 2048 bit SSL certificate by the Apache service
to encrypt their connection.   

Lastly, verify the current system-wide cryptographic policy.   

`update-crypto-policies --show`{{execute T1}}

<pre class="file">
DEFAULT
</pre>

The default configuration on Red Hat Enterprise Linux for the system-wide
cryptograpic policy (sometimes referred to as "crypto policy") is a
policy named `DEFAULT`.

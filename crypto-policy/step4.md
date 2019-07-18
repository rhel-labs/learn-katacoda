# Regenerate SSL certificate

To comply with the system-wide cryptographic policy of FUTURE, you will need 
to generate a replacement SSL certificate using an RSA key of 3072 bit length,
or longer. 

`openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:3072 -subj='/C=XX/O=Default' -keyout /etc/pki/tls/private/localhost.key -out /etc/pki/tls/certs/localhost.crt`{{execute T1}}

<pre class="file">
Genarating a RSA private key
.......................................++++
....................+++
writing new private key to '/etc/pki/tls/private/localhost.key'
-----
</pre>

Check the bit-length of the key to verify that it is configured for 3072.

`openssl x509 -in /etc/pki/tls/certs/localhost.crt -text | grep bit`{{execute T1}}

<pre class="file">
                RSA Public-Key: (3072 bit)
</pre>

Now that a new SSL certificate has been created using a larger public key, 
it complies with the encryption security level of 128 bit required by the
FUTURE cryptographic policy.

> **NOTE:** It is recommended practice to use Certificate Authority (CA) issued
certificates.  If you were using a certificate from a Certificate Authority,
you would need to generate a new Certificate Signature Request (csr) and
submit it to your CA.  When you recieve the signed certificate from your CA,
you would then position it, and update any configuration files needed to
reference it.

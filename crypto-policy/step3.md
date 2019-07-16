# Reconcile service issues

You will need to restart the Apache service after changing the system-wide
crypto policy so that it runs under the new policy.   

`systemctl restart httpd.service`{{execute T1}}

<pre class="file">
Job for httpd.service failed because the control process exited with error code.
See "systemctl status httpd.service" and "journalctl -xe" for details.
</pre>

Unfortunately, the Apache service fails to restart.  You can see a more
specific error message in the SSL error log for Apache.

`tail -2 /var/log/httpd/ssl_error_log`{{execute T1}}

<pre class="file">
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] AH02562: Failed to configure certificate fe80::42:acff:fe11:b:443:0 (with chain), check /etc/pki/tls/certs/localhost.crt
[Tue Jul 16 15:13:25.580860 2019 ] [ssl:emerg] [pid 8869:tid 140233336588544] SSL Library Error: error: 140AB18F: SSL routines: SSL_CTX_use_certificate:ee key too small
</pre>

> **NOTE:** Your log date, time, process ID, or other metadata may be different.  The important part is the message at the end of the entries.

From the log data, the error causing Apache to not start is caused by the
/etc/pki/tls/certs/localhost.crt file.  Recall from the first step, Validate 
the Environment, that this file contained a certificate that used a 2048 bit
encryption key.  However, due to the new FUTURE policy, the certificate will
need to be updated to use a more complex cryptography algorithm.  The second
error message indicates this, key too small.  

The FUTURE system-wide crypto policy is stopping Apache from starting because
running with the existing certificate would vilate the policy settings.

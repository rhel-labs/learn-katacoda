# Updating the crypto policies and discover service issues

Now imagine that the security team within your organization sends out a memo recommending using more stringent crypto policies to make it harder for attackers to break into the system. The security team is recommending disallowing SHA-1 signature algorithm, and RSA keys larger than 3071-bits. This means setting the crypto policy to FUTURE.

To further protect the security of the system, CSO team is recommending to set crypto policy to future
`update-crypto-policies --set FUTURE`{{execute T1}}

Now, verify that the crypto policy has been updated
`update-crypto-policies --show`{{execute T1}}

#After setting the crypto policy to future, restart Apache to pick up the new policy. Notice that Apache is not able to start properly. Check the error logs to find out why

Restart Apache server to pick up the new crypto policy
`systemctl restart httpd.service`{{execute T1}}

Check the error in the Apache log file
`tail -2 /etc/httpd/logs/ssl_error_log`{{execute T1}}


#Discover service issues

After setting the crypto policy to future, restart Apache to pick up the new policy. Notice that Apache is not able to start properly. Check the error logs to find out why

Restart Apache server to pick up the new crypto policy
`systemctl restart httpd.service`{{execute T1}}

Check the error in the Apache log file
`tail -2 /etc/httpd/logs/ssl_error_log`{{execute T1}}


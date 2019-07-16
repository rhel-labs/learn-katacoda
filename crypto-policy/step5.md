# Start Apache service with updated certificate

Start Apache server to pick up the new crypto policy
`systemctl start httpd.service`{{execute T1}}

Check whether Apache server is started
`systemctl status httpd.service --no-pager`{{execute T1}}

Connect to Apache over port over the default Apache https port (443) and show that the settings have been inherited
`echo -n |openssl s_client -connect localhost:443 | grep '^Server public key'`{{execute T1}}


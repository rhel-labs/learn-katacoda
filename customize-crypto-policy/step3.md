# Reconcile service issues

You will need to restart the Apache service after changing the system-wide
crypto policy so that it runs under the new policy.   

> **NOTE:** Red Hat recommends rebooting the system for all services to be
initialized with the new cryptographic policy, however, for this exercise you
will be individually working with the Apache web service.

`systemctl restart httpd.service`{{execute T1}}


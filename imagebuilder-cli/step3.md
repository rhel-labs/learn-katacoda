`composer-cli compose start example-http-server qcow2`{{execute}}

`composer-cli compose status`{{execute}}

`ls /var/lib/lorax/composer/results/$(composer-cli compose status | cut -f1 -d" ")`{{execute}}

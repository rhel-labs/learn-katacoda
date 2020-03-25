# 2. Enable/start httpd service

The second task makes sure the application is enabled and started on the web servers. This task uses the [service module](https://docs.ansible.com/ansible/latest/modules/service_module.html).  We are using three parameters for this module:

- `name` -  we provide the application we want to run, this is identical to the previous `yum` module task, we are using `httpd`.
- `enabled` - Whether the service should start on boot, we have set this to true
- `state` - `started`

Here is the task correctly formatted in YAML syntax:

```
  - name: Apache enabled and running
    service:
      name: httpd
      enabled: true
      state: started
```

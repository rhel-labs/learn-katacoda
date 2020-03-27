# 4. Open up https web traffic on firewalld

The final task makes sure the firewalld has opened up port 443 for https traffic. This task uses the [firewalld module](https://docs.ansible.com/ansible/latest/modules/firewalld_module.html).  We are using five parameters for this module:

- `zone` -  The firewalld zone to add/remove to/from.  We provide `public` to allow public web traffic to reach this web server.
- `service` - Name of a service to add/remove to/from firewalld.
The service must be listed in output of firewall-cmd --get-services.  We are providing this with `https`
- `permanent` - This task has provided `true` so this configuration will persist across reboots.
- `immediate` - `true` means this configuration will be applied immediately.  No restart of the service or host is necessary.
- `state` - `enabled` means accept for this type of connection.

Here is the task correctly formatted in YAML syntax:

```
 - name: open up https
    firewalld:
      zone: public
      service: https
      permanent: true
      immediate: true
      state: enabled
```

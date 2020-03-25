## 1. Install httpd package

The first task uses the [yum module](https://docs.ansible.com/ansible/latest/modules/yum_module.html).  We have two parameters being used by the module:

- `name` - where we provide the application we want to install, in this case `httpd`.
- `state` - where we provide the value `latest` which will will update the specified package if it's not already the latest available version.  Check out the documentation for other options for this parameter.

Here is the task correctly formatted in YAML syntax:

```
  - name: latest Apache version installed
    yum:
      name: httpd
      state: latest
```

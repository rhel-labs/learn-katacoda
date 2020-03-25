# 3. Copy over an index.html file to each web host

The third task will use Ansible to deploy a simple `index.html` file.  This has been pre-setup on the `control` node.

Use the Linux command `cat` to example the `index.html` file:  

`cat index.html`{{execute}}'

The file looks like the following:

```
<body>
<h1>I love Ansible</h1>
</body>
```

We need to copy this HTML file over to each host (`host02` and `host03`) using the [copy module](https://docs.ansible.com/ansible/latest/modules/copy_module.html).  We are using two parameters for this module:

- `src` -  The local path on the `control` node to the file we want to copy over to each host.
- `dest` - The destination for the file on the remote web servers.  For this example we are using Apache `httpd` so the index.html must be placed in `/var/www/html`

Here is the task correctly formatted in YAML syntax:

```
  - name: copy index.html
    copy:
      src: index.html
      dest: /var/www/html/
```

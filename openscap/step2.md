# Inspecting container access and SELinux policies

In 'Terminal 2' tab of the lab interface, use a `podman exec` command to create an interactive shell inside the running container.

`podman exec -t -i $CONTAINER /bin/bash`{{execute T2}}

Check the container's access to the */home* directory

`cd /home; ls`{{execute T2}}

<pre class="file">
ls: cannot open directory '.': Permission denied
</pre>

In 'Terminal' tab of the lab interface, query the SELinux policy to search for allow enforcement rules applied to access */home* directory

`sesearch -A -s container_t -t home_root_t -c dir -p read`{{execute T1}}

The search returns NO results. Since, there is no allow rule for container_t type to get read access to the */home* directory, access 
is blocked by SELinux.

In 'Terminal' tab of the lab interface, check the container's access to the */var/spool/* directory

`cd /var/spool/; ls`{{execute T2}}

<pre class="file">
ls: cannot open directory '.': Permission denied
</pre>

SELinux is restricting access to the */var/spool* directory.

In 'Terminal 2' tab of the lab interface, check the container's write access to the */var/spool/* directory

`touch test`{{execute T2}}

<pre class="file">
touch: cannot touch 'test': Permission denied
</pre>

In 'Terminal' tab of the lab interface, query the SELinux policy to search for allow enforcement rules applied to access */var/spool* directory

`sesearch -A -s container_t -t var_spool_t -c dir -p read`{{execute T1}}

The search returns NO results. Since, there is no allow rule for container_t type to get read access to the */var/spool/* directory, access 
is blocked by SELinux.

Query the SELinux policy for network access for container_t types

`sesearch -A -s container_t -t port_type -c tcp_socket`{{execute T1}}

<pre class="file">
allow container_net_domain port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
allow corenet_unconfined_type port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
allow sandbox_net_domain port_type:tcp_socket { name_bind name_connect recv_msg send_msg };
</pre>

Sandbox is the default process type (domain) in SELinux, and container is the domain used in the context of containers. The corenet type
is typically used in the context of the Linux kernel. The output means that for each of these domains, binding, connecting, sending and receiving 
messages are allowed without TCP port restrictions.

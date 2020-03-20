# Download the Ansible Role

Ansible uses the concept of **roles** to better allow modular code and avoid repeating yourself. A role is simply a folder structure that Ansible knows where to load vars files, tasks and handlers from. 

Ansible makes it easily share roles with the community or download roles that have been created by other members of the community using [Ansible Galaxy](https://galaxy.ansible.com/). 

To access Ansible Galaxy, ansible ships with a command line tool called **ansible-galaxy** that can be used to install roles in a specific role directory

`ansible-galaxy install --roles-path ./roles dpredhat.ansible_role_mssql --force`{{execute}}



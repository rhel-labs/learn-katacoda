# Automating IdM installation using ansible

**FreeIPA** is a free and open source identity management system. *FreeIPA* is the upstream open-source project for Red Hat Identity Manager (IdM). In this lab, we will be using the FreeIPA upstream repository.

# Download the FreeIPA ansible roles

In the *control* node terminal window of the lab, install the `ansible-freeipa` package. This package has all the necessary playbooks needed to deploy or undeploy server, replicas and clients.

`yum install -y ansible-freeipa`{{execute T1}}

List the playbooks that are available to be used. 

`ls /usr/share/doc/ansible-freeipa/playbooks`{{execute T1}}


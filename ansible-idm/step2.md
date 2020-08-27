# Automating IdM installation using ansible

**FreeIPA** is a free and open source identity management system. *FreeIPA* is the upstream open-source project for Red Hat Identity Manager (IdM). In this lab, 
we will be using the FreeIPA upstream repository.

# Download the FreeIPA ansible roles

In the *control* node terminal window of the lab, clone the FreeIPA ansible repository using *git*. The repository has all the necessary playbooks needed to deploy or undeploy server, replicas and clients.

`git clone -b v0.1.12 https://github.com/freeipa/ansible-freeipa.git`{{execute T1}}

List the playbooks that are available to be used. 

`ls ansible-freeipa/playbooks/`{{execute T1}}


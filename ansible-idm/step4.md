# Install the IdM client 

In this lab, you will be using *host03* as the IdM client host to setup the FreeIPA client.

Using the *control* node tab of the lab, install the FreeIPA client on *host03* -

`ansible-playbook -v -i ~/hosts ansible-freeipa/playbooks/install-client.yml`{{execute T2}}

The IPA client host (*host03* in this case), and other corresponding IPA client variables are taken from the */root/hosts* inventory file. 

Installing the IPA client automatically configures services like kerberos, SSSD, PAM and NSS. 

# Test the FreeIPA client

From the FreeIPA client node (*host03*), check the real and effective group ids of the admin user - 

`id admin`{{execute T4}}

From the FreeIPA client node (*host03*), check the real and effective group ids of the user John Doe (jdoe) - 

`id jdoe`{{execute T4}}

# Create a new user 

Before running any IdM commands, you need to authenticate to the IdM domain by obtaining a kerberos ticket. The *kinit* utility can be used to authenticate to an Identity Management (IdM) environment manually. It obtains and caches a Kerberos ticket-granting ticket (TGT) on behalf of an IdM user.

> __NOTE__:  For the normal administrative activity an administrative account admin has been created called *admin*. The admin password is **ADMPassword1**. For this lab, the password was specified in the */root/hosts* file as a IdM server variable. 

On the *host02* terminal window of the lab, authenticate using the clien as *admin* to the IdM server -

`kinit admin`{{execute T3}}

You will be prompted for the password of admin password of the IdM Server (which is **ADMPassword1**).

As an administrator, adding principals to the IdM Kerberos domain is an important task. This can be accomplished using the *ipa* command.

Now that we have authenticated to the IdM server, on the server node (*host02*), create a new user called John Doe -

`ipa user-add jdoe --first=John --last=Doe --password=123JDPassword!`{{execute T3}}

From the IPA client node (*host03*), check the real and effective group ids of the user John Doe (jdoe) - 

`id jdoe`{{execute T4}}

 

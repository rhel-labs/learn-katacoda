# Test the IPA client

To be able to perform any administrative tasks you need to authenticate to the server. For the normal administrative activity an administrative account admin has been created called *admin*. The *kinit* utility can be used to authenticate to an Identity Management (IdM) environment manually. The kinit utility obtains and caches a Kerberos ticket-granting ticket (TGT) on behalf of an IdM user.

> __NOTE__: *admin* is the user, and the password is *ADMPassword1*. 

To authenticate as the admin, just run -

`kinit admin`{{execute T3}}

You will be prompted for the password. In this scenario, the password is specified as an IPA Server variable in the *host* file (which is *ADMPassword1*).

From the IPA client node (*host03*), check the real and effective group ids of the admin user - 

`id admin`{{execute T4}}

From the IPA client node (*host03*), check the real and effective group ids of the user John Doe (jdoe) - 

`id jdoe`{{execute T4}}

# Create a new user on the IPA Server

On the IPA server node (*host02*), create a new user called John Doe -

`ipa user-add jdoe --first=John --last=Doe --password=123JDPassword!`{{execute T3}}

 

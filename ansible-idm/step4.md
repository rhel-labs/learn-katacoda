# Test the IPA client

To be able to perform any administrative tasks you need to authenticate to the server. For the normal administrative activity an administrative account admin has been created called *admin*. The *kinit* utility can be used to authenticate to an Identity Management (IdM) environment manually. The kinit utility obtains and caches a Kerberos ticket-granting ticket (TGT) on behalf of an IdM user.

> __NOTE__: *admin* is the user, and the password is *ADMPassword1*. 

To authenticate as the admin, just run -

`kinit admin`{{execute T3}}

You will be prompted for the password. In this scenario, the password is specified as an IPA Server variable in the *host* file (which is *ADMPassword1*).

Now, check the real and effective group ids of the the user admin -

`id admin`{{execute T4}}

Check the real and effective group ids of the user John Doe (jdoe) -

`id jdoe`{{execute T4}}


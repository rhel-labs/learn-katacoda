# IPA Healthcheck

IPA is not a single daemon. It is a collection of services configured to work together.

The *healthcheck* tool can be used to  verify if a system is properly configured, as well as, find and report error conditions that may impact the IPA environment.

## Run a IPA healthcheck

`ipa-healthcheck --failures-only`{{execute}}

The *--failures-only* option can be used to only show failures in the environment. 

<pre>
oading instance: pki-tomcat
Loading global Tomcat config: /etc/tomcat/tomcat.conf
Loading PKI Tomcat config: /usr/share/pki/etc/tomcat.conf
Loading instance Tomcat config: /etc/pki/pki-tomcat/tomcat.conf
Loading password config: /etc/pki/pki-tomcat/password.conf
Loading instance registry: /etc/sysconfig/pki/tomcat/pki-tomcat/pki-tomcat
Loading subsystem: ca
Loading subsystem config: /var/lib/pki/pki-tomcat/ca/conf/CS.cfg
Getting sslserver cert info for ca from CS.cfg
Getting subsystem cert info for ca from CS.cfg
Getting audit_signing cert info for ca from CS.cfg
Getting ocsp_signing cert info for ca from CS.cfg
Getting signing cert info for ca from CS.cfg
[]
</pre>

The square brackets *[]* on the last line of the output means that the IdM infrastructure is setup properly and working as expected.  

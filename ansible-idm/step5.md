# IPA Healthcheck

IPA is not a single daemon. It is a collection of services configured to work together.

The *ipa-healthcheck* tool is attempt to answer the question "Is my IPA installation working properly." It covers several areas of IPA system health including - 

* Certificate configuration and expiration dates
* Replication errors
* Replication topology
* AD Trust configuration
* Service status
* File permissions of important configuration files
* File system space

## Run a IPA healthcheck

On the *host02* terminal tab of the lab, use the *ipa-healthcheck* command to verify if a system is properly configured, as well as, find and report error conditions that may impact the IPA environment -

`ipa-healthcheck --failures-only`{{execute T3}}

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

To automate running healthcheck every day a systemd timer can be used. The default destination directory for healthcheck logs is */var/log/ipa/healthcheck* and this can be the input into a monitoring system to track changes over time or to alert if a test goes from working to error or warning.

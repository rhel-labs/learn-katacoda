# Remediating and rescanning against a profile

In this step, you will remediate a single failed rule related to IPSec support.

__NOTE__: Many of the remediations involve restarting the host, and the current demo environment does not support host reboots yet. Thus, this lab will 
focus only on remediating a single issue. 

On *Terminal 2* of the lab interface, re-scan the host passing the *--remediation* option to carry out an online remediation. Additionally, provide
the rule ID to address a specific failed rule. In this case, we are providing the rule ID of the rule that needs libreswan package for IPSec. If no
rule ID is provided, an attempt is made to remediate all failed rules.

`oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --remediate --fetch-remote-resources --results scan-xccdf-results.xml --report /var/www/html/index.html --rule xccdf_org.ssgproject.content_rule_package_libreswan_installed /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T2}}

<pre class="file">
Title   Install libreswan Package
Rule    xccdf_org.ssgproject.content_rule_package_libreswan_installed
Ident   CCE-80845-1
Result  fail

 --- Starting Remediation ---
Title   Install libreswan Package
Rule    xccdf_org.ssgproject.content_rule_package_libreswan_installed
Ident   CCE-80845-1
Result  fixed
</pre>

Once the command completes, the issue will be remediated by oscap and shown in the output. You can also check the *OpenSCAP Report* tab of the lab interface for a scan report in HTML format that shows this issue is fixed.

If you re-run the command above, OpenSCAP only attempts to fix what is broken, so it will not remediate an already fixed rule.

`oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --remediate --fetch-remote-resources --results scan-xccdf-results.xml --rule xccdf_org.ssgproject.content_rule_package_libreswan_installed /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T2}}

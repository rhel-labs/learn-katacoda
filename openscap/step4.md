# Remediating and rescanning against a profile

On *terminal 2* of the lab interface, re-scan the host passing the *--remediation* option to carry out an online remediation

`oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --remediate --fetch-remote-resources --results scan-xccdf-results.xml --report /var/www/html/index2.html --rule xccdf_org.ssgproject.content_rule_package_libreswan_installed /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T2}}

Once the command completes, open the OpenSCAP report tab of this lab interface and refresh the report.

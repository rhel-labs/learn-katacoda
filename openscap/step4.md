# Remediating and rescanning against a profile

On *terminal 2* of the lab interface, re-scan the host passing the *--remediation* option to carry out an online remediation

`oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --remediate --fetch-remote-resources --results scan-xccdf-results.xml --report /var/www/html/index.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T2}}


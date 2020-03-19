# Identifying CVEs within kpatches

In each kpatch-patch package there is a changelog of what was added to the
patchset and which CVE it applies.  You can view the changelog by using the
`rpm` command on the kpatch-patch package.  Below, we use a bit of embedded
command-line scripting to make sure that the package referenced for the
changelog is the one you installed earlier.

`rpm -q --changelog $(rpm -qa | grep kpatch-patch)`

<pre class="file">
* Tue Dec 03 2019 Joe Lawrence <joe.lawrence@redhat.com> [1-4.el8]
- hw: [incomplete fix] Machine Check Error on Page Size Change (IFU) [1779250] {CVE-2018-12207}

* Mon Nov 18 2019 Josh Poimboeuf <jpoimboe@redhat.com> [1-3.el8]
- Fix sysfs reporting for MDS-affected systems [1766986] {CVE-2019-11135}

<< OUTPUT ABRIDGED >>
</pre>

In the above sample output, you can see that the latest entry, the first one
listed, in the patchset was to resolve CVE-2018-12207.

#Additional resources from Red Hat

In this lab, you worked with the commands and steps to list, apply, and
validate applying a Live Kernel Patch to a system.  How would an administrator
know that this was needed or available for a system?

The Red Hat Product Security team maintains a list of CVEs affecting Red Hat
products.  
[Vulnerability Responses]: https://access.redhat.com/security/vulnerabilities

Each listed CVE will have a page used for additional information and resources
to go with it.
[Page for CVE-2018-12207]: https://access.redhat.com/security/cve/cve-2019-19339

On the above linked page, in addition to more information about the CVE and
the effect on systems or services, Red Hat may provide additional resources
like detection scripts to see if your system configuration is vulnerable to
the CVE.

# Running a scan against a profile

The profile ID that we are looking at *xccdf_org.ssgproject.content_profile_pci-dss*, has Extensible Configuration Checklist Description 
Format (XCCDF).  An XCCDF document is a structured collection of security configuration rules for some set of target system. In this case, 
it has the configuration rules that meet the PCI regulation.

Run the *oscap* tool providing the profile ID (*xccdf_org.ssgproject.content_profile_pci-ds*), option to fetch remote resources if needed (*--fetch-remote-resources*), report output file name (*report.html*), and the checklist file as per the SCAP security guide (*/usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml*)

`oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --fetch-remote-resources --report report.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T1}}

<pre class="file">
TBD
</pre>

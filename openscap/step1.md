# Installing the SCAP packages

Red Hat Enterprise Linux (RHEL) includes tools that are based on the Security Content Automation Protocol (SCAP) standard, designed for automated tailoring of compliance policies. **OpenSCAP**, available in RHEL, is a standardized compliance solution available that includes policies and tooling based on SCAP that allow you to scan and evaluate host machines. 

__Note:__ There are 2 terminal tabs that will be used in this lab - a terminal for running the scanner (indicated by *Terminal*), and a second terminal for remediating an issue that is found (indicated by *Terminal Remediation*).

Prior to getting started, we will download the package that consists of the command line interface of the OpenSCAP scanner (*oscap*). OpenSCAP also has a graphical tool called SCAP workbench, but in this lab, we will only be using the command line interface. We will also download the SCAP Security guide, which implements security guidance rules and remediation scripts by respective authorities, namely PCI DSS, STIG, etc. In this lab, we will scan the system against the PCI DSS profile. 

Install the packages to get the *oscap* and the SCAP security guide packages

`yum install -y openscap-scanner scap-security-guide`{{execute T1}}

After installing, all SCAP Security Guide security policies are in directory */usr/share/xml/scap/ssg/content/*. There are files for every platform available in a form of XCCDF, OVAL or datastream documents. In most of use cases, you want to use the datastreams, which filenames end with -ds.xml. SCAP datastreams represent a bundle of profiles which are used to define a compliance policy.

`ls /usr/share/xml/scap/ssg/content`{{execute T1}}

You can display all available profiles using the info command on the datastream file. In this case, we will be using the rhel8 datastream file 

`oscap info /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml --fetch-remote-resources`{{execute T1}}

__Note:__ The output has several profiles including PCI-DSS, [DRAFT] DISA STIG, and ACSC Essential Eight. By default the oscap tool will not 
download and execute remote content. If you trust your local content and the remote content it references, you can use the --fetch-remote-resources 
option to automatically download it using the oscap tool as suggested in the output WARNING. 

<pre class="file">
Document type: Source Data Stream
Imported: 2020-02-11T08:41:17

Stream: scap_org.open-scap_datastream_from_xccdf_ssg-rhel8-xccdf-1.2.xml
Generated: (null)
Version: 1.3
Checklists:
        Ref-Id: scap_org.open-scap_cref_ssg-rhel8-xccdf-1.2.xml
WARNING: Datastream component 'scap_org.open-scap_cref_security-data-oval-com.redhat.rhsa-RHEL8.xml' points out to the remote 'https://www.redhat.com/security/data/oval/com.redhat.rhsa-RHEL8.xml'. Use '--fetch-remote-resources' option to download it.
WARNING: Skipping 'https://www.redhat.com/security/data/oval/com.redhat.rhsa-RHEL8.xml' file which is referenced from datastream
                Status: draft
                Generated: 2020-02-11
                Resolved: true
                Profiles:
                        Title: Protection Profile for General Purpose Operating Systems
                                Id: xccdf_org.ssgproject.content_profile_ospp
                        Title: PCI-DSS v3.2.1 Control Baseline for Red Hat EnterpriseLinux 8
                                Id: xccdf_org.ssgproject.content_profile_pci-dss
                        Title: [DRAFT] DISA STIG for Red Hat Enterprise Linux 8
                                Id: xccdf_org.ssgproject.content_profile_stig
                        Title: Australian Cyber Security Centre (ACSC) Essential Eight
                                Id: xccdf_org.ssgproject.content_profile_e8
                Referenced check files:
                        ssg-rhel8-oval.xml
                                system: http://oval.mitre.org/XMLSchema/oval-definitions-5
                        ssg-rhel8-ocil.xml
                                system: http://scap.nist.gov/schema/ocil/2
                        security-data-oval-com.redhat.rhsa-RHEL8.xml
                                system: http://oval.mitre.org/XMLSchema/oval-definitions-5
Checks:
        Ref-Id: scap_org.open-scap_cref_ssg-rhel8-oval.xml
        Ref-Id: scap_org.open-scap_cref_ssg-rhel8-ocil.xml
        Ref-Id: scap_org.open-scap_cref_ssg-rhel8-cpe-oval.xml
        Ref-Id: scap_org.open-scap_cref_security-data-oval-com.redhat.rhsa-RHEL8.xml
Dictionaries:
        Ref-Id: scap_org.open-scap_cref_ssg-rhel8-cpe-dictionary.xml
</pre>

If you are interested in more details about the *openscap* tool :

`man oscap`

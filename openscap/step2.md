# Displaying available profiles 

You can display all available profiles using the info command on the datastream file. In this case, we will be using the RHEL8 datastream file 

`oscap info /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T1}}

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

A profile contains generic security recommendations that apply to all Red Hat Enterprise Linux installations and additional security recommendations that are specific to the intended usage of a system. To obtain information about a specific profile, specify the *--profile* option.

`oscap info --profile xccdf_org.ssgproject.content_profile_pci-dss /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T1}}

<pre class="file">
Document type: Source Data Stream
Imported: 2020-02-11T08:41:17

Stream: scap_org.open-scap_datastream_from_xccdf_ssg-rhel8-xccdf-1.2.xml
Generated: (null)
Version: 1.3
WARNING: Datastream component 'scap_org.open-scap_cref_security-data-oval-com.redhat.rhsa-RHEL8.xml' points out to the remote 'https://www.redhat.com/security/data/oval/com.redhat.rhsa-RHEL8.xml'. Use '--fetch-remote-resources' option to download it.
WARNING: Skipping 'https://www.redhat.com/security/data/oval/com.redhat.rhsa-RHEL8.xml' file which is referenced from datastream
Profile
        Title: PCI-DSS v3.2.1 Control Baseline for Red Hat Enterprise Linux 8
        Id: xccdf_org.ssgproject.content_profile_pci-dss

        Description: Ensures PCI-DSS v3.2.1 security configuration settings are applied.
</pre>

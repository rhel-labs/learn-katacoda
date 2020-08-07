# Installing the SCAP packages

**SCAP** (Security Content Automation Protocol) is a NIST project that standardizes the language for describing assessment criteria and findings. **OpenSCAP**, available in RHEL, is a SCAP based compliance toolkit that includes policies and tools that allows you to scan and evaluate host machines. 

__Note:__ There are 3 tabs that will be used in this lab - a terminal tab for running the scanner (indicated by *Terminal*), a second terminal tab for remediating an issue that is found (indicated by *Terminal Remediation*), and a browser tab for viewing the OpenSCAP report (indicated by *OpenSCAP Report*).

Prior to getting started, we will install the package that consists of the command line interface of the OpenSCAP scanner (*oscap*). OpenSCAP also has a graphical tool called SCAP workbench, but in this lab, we will only be using the command line interface. We will also install the SCAP Security guide, which implements security guidance rules and remediation scripts by respective authorities, namely PCI DSS, STIG, etc. In this lab, we will scan the system against the PCI DSS profile. 

Ensure Apache httpd plus the OpenSCAP scanner and definitions are installed with the command below; it’s safe to run even if the packages already exist

`yum install -y httpd openscap-scanner scap-security-guide`{{execute T1}}

After installing, all SCAP Security Guide security policies are in the */usr/share/xml/scap/ssg/content/* directory. There are files for every platform available in a form of XCCDF, OVAL or datastream documents. In most of use cases, you want to use the datastreams, which filenames end with -ds.xml. SCAP datastreams represent a bundle of profiles which are used to define a compliance policy.

`ls /usr/share/xml/scap/ssg/content`{{execute T1}}

If you are interested in more details about the *openscap* tool :

`man oscap`

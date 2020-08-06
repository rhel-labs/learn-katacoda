# Running a scan against a profile

A XCCDF document is a structured collection of security configuration rules for some set of target system. In this case, it has the 
configuration rules that meet the PCI regulation.

Run the *oscap* tool providing the XCCDF formatted profile with ID (*xccdf_org.ssgproject.content_profile_pci-ds*), option to fetch remote resources if needed (*--fetch-remote-resources*), report output file name (*report.html*), and the checklist file as per the SCAP security guide (*/usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml*)

`oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_pci-dss --fetch-remote-resources --results scan-xccdf-results.xml --report report.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml`{{execute T1}}

__Note:__ This scan can take a few minutes to complete as it has to evaluate all the rules and store the results.  

<pre class="file">
Downloading: https://www.redhat.com/security/data/oval/com.redhat.rhsa-RHEL8.xml ... ok
Title   Enable auditd Service
Rule    xccdf_org.ssgproject.content_rule_service_auditd_enabled
Ident   CCE-80872-5
Result  pass

Title   Enable Auditing for Processes Which Start Prior to the Audit Daemon
Rule    xccdf_org.ssgproject.content_rule_grub2_audit_argument
Ident   CCE-80825-3
Result  pass

Title   Configure auditd mail_acct Action on Low Disk Space
Rule    xccdf_org.ssgproject.content_rule_auditd_data_retention_action_mail_acct
Ident   CCE-80678-6
Result  pass

Title   Configure auditd admin_space_left Action on Low Disk Space
Rule    xccdf_org.ssgproject.content_rule_auditd_data_retention_admin_space_left_action
Ident   CCE-80679-4
Result  pass

Title   Configure auditd Number of Logs Retained
Rule    xccdf_org.ssgproject.content_rule_auditd_data_retention_num_logs
Ident   CCE-80683-6
Result  pass

Title   Configure auditd max_log_file_action Upon Reaching Maximum Log Size
Rule    xccdf_org.ssgproject.content_rule_auditd_data_retention_max_log_file_action
Ident   CCE-80682-8
Result  pass

Title   Configure auditd space_left Action on Low Disk Space
Rule    xccdf_org.ssgproject.content_rule_auditd_data_retention_space_left_action
Ident   CCE-80684-4
Result  pass

Title   Configure auditd Max Log File Size
Rule    xccdf_org.ssgproject.content_rule_auditd_data_retention_max_log_file
Ident   CCE-80681-0
Result  pass

Title   Configure auditd to use audispd's syslog plugin
Rule    xccdf_org.ssgproject.content_rule_auditd_audispd_syslog_plugin_activated
Ident   CCE-80677-8
Result  pass

Title   Record Events that Modify the System's Network Environment
Rule    xccdf_org.ssgproject.content_rule_audit_rules_networkconfig_modification
Ident   CCE-80723-0
Result  pass

Title   Record Events that Modify the System's Mandatory Access Controls
Rule    xccdf_org.ssgproject.content_rule_audit_rules_mac_modification
Ident   CCE-80721-4
Result  pass

Title   System Audit Logs Must Have Mode 0640 or Less Permissive
Rule    xccdf_org.ssgproject.content_rule_file_permissions_var_log_audit
Ident   CCE-80819-6
Result  pass

Title   Record Events that Modify User/Group Information - /etc/security/opasswd
Rule    xccdf_org.ssgproject.content_rule_audit_rules_usergroup_modification_opasswd
Ident   CCE-80760-2
Result  pass

Title   Record Events that Modify User/Group Information - /etc/gshadow
Rule    xccdf_org.ssgproject.content_rule_audit_rules_usergroup_modification_gshadow
Ident   CCE-80759-4
Result  pass

Title   Ensure auditd Collects System Administrator Actions
Rule    xccdf_org.ssgproject.content_rule_audit_rules_sysadmin_actions
Ident   CCE-80743-8
Result  pass

Title   Ensure auditd Collects Information on Exporting to Media (successful)
Rule    xccdf_org.ssgproject.content_rule_audit_rules_media_export
Ident   CCE-80722-2
Result  pass

Title   Record Attempts to Alter Process and Session Initiation Information
Rule    xccdf_org.ssgproject.content_rule_audit_rules_session_events
Ident   CCE-80742-0
Result  pass

Title   Record Events that Modify User/Group Information - /etc/passwd
Rule    xccdf_org.ssgproject.content_rule_audit_rules_usergroup_modification_passwd
Ident   CCE-80761-0
Result  pass

Title   Make the auditd Configuration Immutable
Rule    xccdf_org.ssgproject.content_rule_audit_rules_immutable
Ident   CCE-80708-1
Result  pass

Title   Record Events that Modify User/Group Information - /etc/group
Rule    xccdf_org.ssgproject.content_rule_audit_rules_usergroup_modification_group
Ident   CCE-80758-6
Result  pass

Title   Record Events that Modify User/Group Information - /etc/shadow
Rule    xccdf_org.ssgproject.content_rule_audit_rules_usergroup_modification_shadow
Ident   CCE-80762-8
Result  pass

<< OUTPUT ABRIDGED >>
</pre>

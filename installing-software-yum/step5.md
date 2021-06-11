# Validating package files using `rpm`

If a program is suddenly misbehaving, it could be related to some key files not being
installed properly. `rpm` has a validation option (`-V`) which will compare
the local files with the expected files for the package. Remove a file from the
Wireshark package to test out this validation functionality:

`rm -f /usr/share/icons/hicolor/256x256/apps/wireshark.png`{{execute}}

Use the `-V` option with `rpm` to check the status of Wireshark.

`rpm -V wireshark`{{execute}}

<pre class=file>
missing     /usr/share/icons/hicolor/256x256/apps/wireshark.png
</pre>

Now that you have seen there is a missing file, reinstall the Wireshark
package to return it to its proper state:

`yum reinstall -y wireshark`{{execute}}

<pre class=file>
<< OUTPUT ABRIDGED >>
Arch   Version        Repository                        Size
===================================================================
Reinstalling:
wireshark
x86_64 1:2.6.2-12.el8 rhel-8-for-x86_64-appstream-rpms 3.7 M
<< OUTPUT ABRIDGED >>
</pre>

Check that __wireshark.png__ has been restored:

`ls /usr/share/icons/hicolor/256x256/apps/`{{execute}}

<pre class=file>
fedora-logo-icon.png  wireshark.png
</pre>

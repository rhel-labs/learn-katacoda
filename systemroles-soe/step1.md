# Configuring prerequisite repositories and packages

`subscription-manager  repos --enable=ansible-2.9-for-rhel-8-x86_64-rpms`{{execute}}

<pre class="file">
Repository 'ansible-2.9-for-rhel-8-x86_64-rpms' is enabled for this system.
</pre>

`yum -y install ansible rhel-system-roles`{{execute}}

<pre class="file">
<<< OUTPUT ABRIDGED >>>

==========================================================================================================================================
 Package                         Architecture        Version                        Repository                                       Size
==========================================================================================================================================
Installing:
 ansible                         noarch              2.9.15-1.el8ae                 ansible-2.9-for-rhel-8-x86_64-rpms               17 M
 rhel-system-roles               noarch              1.0-20.el8                     rhel-8-for-x86_64-appstream-rpms                503 k

<<< OUTPUT ABRIDGED >>>
</pre>

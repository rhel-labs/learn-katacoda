# Re-inspect the running container

In terminal 2, attach to the running container 
`podman attach $CONTAINER`{{execute T2}}

Check whether container has access to the home directory
`cd /home/; ls`{{execute T2}}

<pre class="file">
packer  rhel
</pre>

Check whether container has read access to the /var/spool/ directory
`cd /var/spool/; ls`{{execute T2}}

<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  up2date
</pre>

Check whether container has write access to the /var/spool/ directory
`touch test; ls`{{execute T2}}
<pre class="file">
anacron  cron  lpd  mail  plymouth  rhsm  test  up2date
</pre>

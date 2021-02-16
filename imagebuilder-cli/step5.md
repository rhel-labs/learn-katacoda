# Troubleshooting a compose

Sometimes machine image builds are not successful.  Looking at the logs
of the build may be useful when troubleshooting.

`composer-cli compose log $(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

Throughout the lab, you have seen the UUID of the compose transaction used in
command output and as an argument for working with individual machine image
operations.  The osbuild-composer back-end also uses this UUID to store data about
this, specific, machine image build.  

To look at the data associated with the machine image build you completed in
the lab -

`composer-cli compose results $(composer-cli compose status | head -n1 | cut -f1 -d" ")`{{execute}}

The output is a .tar that includes the logs, status, and resulting image. 

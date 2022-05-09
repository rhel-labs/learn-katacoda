Now that we've seen how the daemon is configured, let's see it in action.

In the user's home directory is a compiled binary, `cowsay`. There is nothing inherently malicious about this binary, though it provides a good example for our application control workflow. 

You should have no problems executing the `cowsay` binary:

`./cowsay "mooooo"`{{ execute T1 }}

Let's start up fapolicyd and see what happens:

`sudo systemctl start fapolicyd`{{ execute T1 }}
`./cowsay`

Great! Because the `cowsay` binary isn't in the RPM database, or the fapolicyd trust database configured at `/etc/fapolicyd/fapolicyd.trust`, the execution is blocked.

What if we know that this binary is trusted, and we want to allow it on the system? We have a couple of options:

* We could create a RPM spec file for the binary, build an RPM, and install it into the RPM database
* We can update the fapolicyd trust database

The second option seems better for this scenario - let's update the fapolicyd trust database. We can use the `fapolicyd-cli` to update file-backed trust source:

`sudo fapolicyd-cli --file add /home/user1/cowsay` {{ execute T1 }}

Now you can update the daemon:

`sudo fapolicyd-cli --update`{{ execute T1 }}

Now let's try the binary again:

`./cowsay "mooooo"` {{ execute T1 }}

Success! We've verified that fapolicyd can block unauthorized processes and applications on a system, and that we can manage exceptions for trusted applications.

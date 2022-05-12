Now that we've seen how the daemon is configured, let's see it in action.

Switch to the user `rhel`, with the password `redhat`

`su - rhel` {{ execute T1 }}

In the user's home directory is a compiled binary, `cowsay`. There is nothing inherently malicious about this binary, though it provides a good example for our application control workflow. 

You should have no problems executing the `cowsay` binary:

`./cowsay "mooooo"`{{ execute T1 }}

Let's start up fapolicyd and see what happens:

`sudo systemctl start fapolicyd` {{ execute T1 }}
`./cowsay "mooooo"` {{ execute T1 }}

Great! Because the `cowsay` binary isn't in the RPM database, or the file-backed trust database configured at `/etc/fapolicyd/fapolicyd.trust`, the execution is blocked.

What if we know that this binary is trusted, and we want to allow it on the system? We have a couple of options:

* We could create a RPM spec file for the binary, build an RPM, sign it, and install it into the RPM database
* We can update the file-backed trust database

The second option seems better for this scenario - let's update the file-backed trust database. We can use the `fapolicyd-cli` to update the trust source:

`sudo fapolicyd-cli --file add /home/user1/cowsay` {{ execute T1 }}

If we take a look at the file `/etc/fapolicyd/fapolicyd.trust` we can see that changes that have been made:

`sudo cat /etc/fapolicyd/fapolicyd.trust` {{ execute T1 }}

* The full-path to the file is listed (`/home/user1/cowsay`)
* The size of the file has been calculated and added
* The SHA-256 hash for the file has been calculated and added

Remember that we have `integrity = none` in our fapolicyd config file? These last two attributes - size and the SHA-256 has - are used for integrity checking. We'll take a closer look at this in the next step of the lab.

Now you can update the daemon:

`sudo fapolicyd-cli --update`{{ execute T1 }}

Let's try the binary again:

`./cowsay "mooooo"` {{ execute T1 }}

Success! We've verified that fapolicyd can block unauthorized processes and applications on a system, and that we can manage exceptions for trusted applications.

Let's take a quick look at fapolicyd and integrity. The `more` command is installed via the RPM database, so it's trusted to execute on the system:

`sudo rpm -qf /bin/more` {{ execute T1 }}

What if the more command was substituted out for something malicious? First, let's verify that fapolicyd is still running:

`sudo systemctl status fapolicyd`

Now let's substitute the `more` command for the `cowsay` binary in our user's home directory:

`sudo /bin/cp ./cowsay /bin/more` {{ execute T1 }}
`/bin/more "mooooo" {{ execute T1 }}

Hmmmm. So by default, fapolicyd doesn't check what the file looks like, only where it is executing from. This means that an attacker could potentially hijack the execution path of a trusted file, and execute malicious code on behalf of a user.

To mitigate these scenarios, fapolicyd supports different types of file integrity:

* File-size checking - this is a very fast method of integrity checking, where fapolicyd verifies that the file is the correct size before allowing execution
* Comparing SHA-256 hashes - computing and checking SHA-256 checksums is more secure than file-size checking, but does have an impact on system performance.
* Integrity Measurement Architecture (IMA) subsystem - IMA can be used by fapolicyd to support file integrity checks.

For this scenario we're going to use SHA-256 hashes to verify file integrity. This provides a good balance between speed and security, and is simple to setup and maintain.

You can configure integrity in the `/etc/fapolicyd/fapolicyd.conf` file:

`sudo sed -i 's/integrity.*/integrity = sha256/' /etc/fapolicyd/fapolicyd.conf` {{ execute T1 }}

Restart the daemon:

`sudo systemctl restart fapolicyd` {{ execute T1 }}

We can now verify whether file integrity checking is performed:

`/bin/more "mooooooo"` {{ execute T1 }}

Success! We've now mitigated the risk of an attacker hijacking a trusted binary on the system, by configuring fapolicyd integrity controls.

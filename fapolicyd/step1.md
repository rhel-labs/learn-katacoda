The File Access Policy Daemon (fapolicyd) controls the execution of applications based on a user-defined policy, and is one of the most effective ways to mitigate the risk of untrusted and possibly malicious applications on the system.

First, install the fapolicyd package on your Red Hat Enterprise Linux system.

`yum install fapolicyd`{{ execute T1 }}

Next, inspect the fapolicyd configuration that has been created.

`cat /etc/fapolicyd/fapolicyd.conf`{{ execute T1 }}

We can see a couple of things have been configured for us by default:

* The daemon is configured in enforcing mode (`permissive = 0`), meaning all unauthorized processed will be blocked. We can optionally configure the daemon for permissive mode and to log unauthorized processes, rather than block them.

* A new user has been created on the system for the daemon (`uid = fapolicyd`)

* The default sources of trust are the RPM database and a file-backed trust database. This means that any packages installed into the RPM database will be trusted by default. In addition, a file is configured at `/etc/fapolicyd/fapolicyd.trust` which can be used for third-party binaries and other applications not installed into the RPM database.

* There is currently no integrity checking configured (`integrity = none`)

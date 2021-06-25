# What are processes?

_Files_ keep track of information on a Linux system, providing a way for users
to organize and store information. Sometimes, files contain information that
can be run to carry out a specific operation. These kinds of files are called
_programs_. When you run a program, the running instance is called a _process_.
Modern Linux systems have tons of processing running at any given moment, so it
is crucial to have a way to manage these processes. On Red Hat Enterprise
Linux, this manager is __systemd__.

# __systemd__ vs. __systemctl__

When researching process management, you will come across two very similar terms:
__systemd__ and __systemctl__. These are very closely related.
__systemd__, short for system daemon, manages the state of the system and any
services running on it. __systemctl__ provides a series of commands for users to
interact with __systemd__.

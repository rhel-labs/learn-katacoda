# Overview:

Services are programs that run in the background of a system, out of the user’s view. They typically lack an interface and therefore have to be interacted with using commands. Services streamline the user experience by taking care of operations automatically and in a way that doesn’t distract the user. There is actually a service that manages the starting and stopping of other services, `systemd`. This lab provides the basics of starting and stopping services using `systemctl`, which is the command that allows users to interact with the `systemd` service.

# Goal:

After completing this lab, users will understand how to start, restart, and stop a service. You will also learn how to make a service start every time the system starts.

# Concepts included in this scenario:
* Learn how `systemd` and `systemctl` are related
* Start and stop a service with `systemctl`
* Enable a service with `systemctl` to make it persistent
* Restart a service to activate configuration changes
* View the status of a service

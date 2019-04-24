# Prerequisite setup
Run the following command on your system, by clicking it below, prior to proceeding with the scenario.

`yum install -y cockpit; systemctl enable --now cockpit; systemctl start firewalld; usermod -aG wheel rhel; echo redhat | passwd --stdin rhel`{{execute}}

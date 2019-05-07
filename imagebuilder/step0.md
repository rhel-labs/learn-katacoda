# Prerequisite setup
Run the following command on your system, by clicking it below, prior to proceeding with the scenario.

`yum install -y cockpit-composer lorax-composer composer-cli; systemctl enable --now cockpit.socket; systemctl enable --now lorax-composer.service; sudo usermod -a -G weldr rhel; echo redhat | passwd --stdin rhel`{{execute}}
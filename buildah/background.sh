#!/bin/bash

yum -y install buildah podman
podman pull registry.access.redhat.com/ubi8/ubi-init
setsebool -P container_manage_cgroup true

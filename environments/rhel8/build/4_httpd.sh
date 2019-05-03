set -ex

# start new container from scratch
newcontainer=$(buildah from scratch)
scratchmnt=$(buildah mount ${newcontainer})

# install the packages
yum install --installroot ${scratchmnt} httpd --releasever 8 --setopt=module_platform_id="platform:el8" -y

# Clean up yum cache
if [ -d "${scratchmnt}" ]; then
  rm -rf "${scratchmnt}"/var/cache/yum
fi

# configure container label and entrypoint
buildah config --label name=rhel8-httpd ${newcontainer}
buildah config --port 80 --cmd "/usr/sbin/httpd -DFOREGROUND" ${newcontainer}

# commit the image
buildah unmount ${newcontainer}
buildah commit ${newcontainer} rhel8-httpd

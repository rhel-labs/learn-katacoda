#!/bin/bash
set -ex

LOGFILE=/root/post-run.log
OS=

rm -f "${LOGFILE}"

log() {
    echo "${1}" >&2
    echo "[${OS}][$(date)] ${1}" >> "${LOGFILE}"
}

die() {
    log "${1}"
    exit 1
}

setup_swap() {
    SWAPFILE=/swapfile

    log "Preparing swap file"
    fallocate -l4G "${SWAPFILE}"
    chmod 600 "${SWAPFILE}"
    mkswap "${SWAPFILE}"
    swapon "${SWAPFILE}"
    log "swap file set up successfully..."
}

ubuntu_deps() {
    log "(OS=ubuntu) Installing additional packages..."

    apt update -y
    apt install -y qemu-kvm libvirt-daemon-system libvirt-clients \
                   virtinst bridge-utils dnsmasq-base cpu-checker \
                   cloud-image-utils

    log "Packages installed successfully..."
}

rhel8_deps() {
    log "(OS=rhel8) Installing additional packages..."
    dnf -y install virt-install
    dnf -y module install virt
    systemctl start libvirtd
    log "Packages installed successfully..."
}

install_deps() {
    os=$(grep ^ID= /etc/os-release | cut -d'=' -f2 | tr -d '"')
    case "${os}" in
    ubuntu)
        export OS=ubuntu
        ubuntu_deps
        ;;
    rhel)
        export OS=RHEL8
        hostnamectl set-hostname tang
        rhel8_deps
        ;;
    *)
        die "Unsupported operating system"
        ;;
    esac
}

import_vm() {
    NAME=clevis-vm
    DATA=/opt/data
    DISK=${DATA}/disk.qcow2

    log "Importing VM..."
    sudo virt-install --name=${NAME} --ram=2048 \
        --os-variant=generic --os-type=linux --vcpus=1 --graphics=none \
        --disk=path="${DISK}",size=10,bus=virtio,format=qcow2 --import \
        --console pty,target_type=serial --noreboot
    log "VM imported successfully"
}

get_vm() {
    log "Downloading VM..."
    IMAGE="katacoda-f34-nbde.qcow2"
    ARCHIVE="${IMAGE}.tar.gz"
    VMURL="http://www.uece.net/katacoda/${ARCHIVE}"
    MD5="15c96166df33ac7a95f084b7e5a3f927"
    curl -LO "${VMURL}"
    md5dl=$(md5sum "${ARCHIVE}" | awk '{ print $1 }')
    [ "${md5dl}" = "${MD5}" ] || die "Checksum does not match (${md5dl} vs expected(${MD5}))"
    tar xf "${ARCHIVE}"

    NAME=clevis-vm
    DATA=/opt/data
    DISK=${DATA}/disk.qcow2
    sudo mkdir -m755 -p "${DATA}"
    sudo mv "${IMAGE}" "${DISK}"

    USER=qemu
    [ "${OS}" = "ubuntu" ] && USER=libvirt-qemu
    sudo chown "${USER}". "${DATA}" -R
    log "VM downloaded"

    import_vm
}

setup_container() {
    log "Setting up container..."
    docker run -dt --privileged --name tang --hostname tang -p 80:80 \
        -v /opt/data:/opt/data \
        registry.fedoraproject.org/fedora-toolbox:34 /sbin/init
    log "Container ready"
    touch "${LOGFILE}".container
}

check_done() {
    container=
    vm=

    while /bin/true; do
        [ "${OS}" != "ubuntu" ] && container=true
        if [ -n "${container}" ] && [ -n "${vm}" ]; then
            log "Scenario is READY"
            touch "${LOGFILE}".done
            break
        fi

        [ -e "${LOGFILE}".container ] && container=true
        if virsh list --name --state-shutoff | grep clevis-vm; then
            vm=true
        fi

        [ -z "${container}" ] && log "container still NOT ready"
        [ -z "${vm}" ] && log "vm still NOT ready"

        sleep 2
    done
}

get_vm &
setup_swap

install_deps

if [ "${OS}" = "ubuntu" ]; then
    setup_container &
fi

import_vm &
check_done

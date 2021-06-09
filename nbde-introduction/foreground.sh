#!/bin/bash

LOGFILE="/root/post-run.log"
DONEFILE="${LOGFILE}".done

log() {
    echo "${1}" >> "${LOGFILE}"
}

write() {
    log "${1}"
    clear && echo "${1}"
}

hw_vm() {
    retvm=$(virt-host-validate 2>/dev/null | grep 'hardware virt' \
            | awk '{ print $7 }')
    if [ "${retvm}" = "PASS" ]; then
        echo "YES"
        return 0
    fi
    echo "NO"
    return 0
}

get_os() {
    os=$(grep ^ID= /etc/os-release | cut -d'=' -f2 | tr -d '"')
    case "${os}" in
    ubuntu)
        export OS=ubuntu
        ;;
    rhel)
        export OS=RHEL8
        ;;
    *)
        die "Unsupported operating system"
        ;;
    esac
}

get_os

START="${SECONDS}"
intro=
while [ ! -f "${DONEFILE}" ]; do
    if [ -z "${intro}" ]; then
        write "Please wait while the scenario is being prepared. It may take a little while..."
        intro=true
    fi

    printf "."
    sleep 2
done

ELAPSED=$((SECONDS-START))
write "Ready to start your scenario (preparation took ${ELAPSED} seconds, HW virt supported: $(hw_vm))"
[ "${OS}" = "ubuntu" ] && docker exec -it tang /opt/data/tang-scenario

#!/bin/bash

expand_path() {
    local cwd="$(pwd)"
    cd "$1"
    pwd
    cd "$cwd"
}

CURDIR=$(expand_path $(dirname $0))
export BUILDDIR="${CURDIR}/test/build"
export PACKAGEDIR="${CURDIR}/test/packages"

if [ "${1}" = "clean" ]; then
    rm -rf "${BUILDDIR}" 
    rm -rf "${PACKAGEDIR}" 
    echo "cleaned up"
    exit 0
else
    mkdir -p "${BUILDDIR}"
    mkdir -p "${PACKAGEDIR}"
fi

if [ ! -f "${BUILDDIR}/repo.conf" ]; then
    cat <<EOF > "${BUILDDIR}/repo.conf"
REPONAME=ctdo
GET_FROM_AUR=(
    thinkalert=m
    aiccu=m
    package-query=m
    p0f=m
)
EOF
fi

./aur-repo $*

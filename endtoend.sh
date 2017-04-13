#!/bin/bash
set -eux -o pipefail

# Create a temporary directory for the rpms we download
rpmsdir=$(mktemp -d)
trap 'rm -rf $rpmsdir' EXIT SIGHUP SIGINT SIGTERM

pushd $rpmsdir
bodhi updates download --updateid=$1
# TODO add support for testing koji builds
# koji download-build $1
popd


# create a yum repo and update the container
# will pull in updates as well as rpms from the update
# we are testing
pushd $rpmsdir
createrepo ./
dnf update -y --repofrompath=cwd,./
popd 

# creates ostree from stable + rpms
./buildostree.sh $rpmsdir/*rpm

# creates disk image from the ostree
./builddisk.sh ostreerepo/ 
# disk image is in cwd *.qcow2

# run the atomic-host-tests
./runtests.sh *.qcow2

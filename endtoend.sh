#!/bin/bash
set -eux -o pipefail

# Create a temporary directory for the rpms we download
rpmsdir=$(mktemp -d)
trap 'rm -rf $rpmsdir' EXIT SIGHUP SIGINT SIGTERM

pushd $rpmsdir
bodhi updates download --updateid=$1
popd

# creates ostree from stable + rpms
./buildostree.sh $rpmsdir/*

# creates disk image from the ostree
./builddisk.sh ostreerepo/ 
# disk image is in cwd *.qcow2

# run the atomic-host-tests
./runtests.sh *.qcow2

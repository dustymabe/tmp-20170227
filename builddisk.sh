#!/bin/bash
set -eux -o pipefail

currentdir=$(pwd)

# Clean up the imagefactory storage directory
imgdir=/var/lib/imagefactory/storage/
sudo rm -f $imgdir/*

# Create directory for temporary files
tmpdir=$(mktemp -d)

# Kill backgrounded jobs on exit
function clean_up {
    kill $(jobs -p)
    sudo rm -f $imgdir/*
    sudo rm -rf $tmpdir
}
trap clean_up EXIT SIGHUP SIGINT SIGTERM

# First argument is the path to the ostree repo share that over httpd now
pushd $1
python -m SimpleHTTPServer &
popd

# Change into tmpdir
#cp fedora-atomic.ks $tmpdir/
pushd $tmpdir

# Grab the kickstart file
curl -O -L https://pagure.io/fedora-kickstarts/raw/f25/f/fedora-atomic.ks

# Put new url into the kickstart file
sed -i 's|url=https://kojipkgs.fedoraproject.org/atomic/25/|url=http://192.168.122.1:8000/|' ./fedora-atomic.ks
# Set the ref to be the right one
sed -i 's|--ref=fedora-atomic/25/x86_64/updates/docker-host|--ref=fedora-atomic/25/x86_64/docker-host|' ./fedora-atomic.ks
# point to upstream
sed -i 's|\(%post.*$\)|\1\nostree remote delete fedora-atomic\nostree remote add --set=gpg-verify=false fedora-atomic https://kojipkgs.fedoraproject.org/atomic/25/|' ./fedora-atomic.ks

# Create a tdl file for imagefactory
#       <install type='url'>
#           <url>http://download.fedoraproject.org/pub/fedora/linux/releases/25/Everything/x86_64/os/</url>
#       </install>
cat <<EOF >./fedora-25.tdl
<template>
    <name>rawhide</name>
    <os>
        <name>Fedora</name>
        <version>22</version>
        <arch>x86_64</arch>
        <install type='iso'>
            <iso>file://${currentdir}/Fedora-Everything-netinst-x86_64-25-1.3.iso</iso>
        </install>
        <rootpw>password</rootpw>
        <kernelparam>console=ttyS0</kernelparam>
    </os>
</template>
EOF
#       <install type='url'>
#           <url>http://dl.fedoraproject.org/pub/fedora/linux/releases/25/Everything/x86_64/os/</url>

# –parameter results_location
# run imagefactory to build disk image
sudo imagefactory --debug --imgdir $imgdir --timeout 3000 base_image ./fedora-25.tdl --parameter offline_icicle true --file-parameter install_script ./fedora-atomic.ks

# Change out of temporary directory
popd

# convert to qcow
imgname=$(basename $imgdir/*body)
qemu-img convert -c -p -O qcow2 $imgdir/*body ./$imgname.qcow2

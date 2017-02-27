#!/bin/bash
set -eux -o pipefail

# Kill backgrounded jobs on exit
trap 'kill $(jobs -p)' EXIT

# First argument is the path to the ostree repo share that over httpd now
#pushd $1
#python -m SimpleHTTPServer &
#popd

# Grab the kickstart file
#curl -O -L https://pagure.io/fedora-kickstarts/raw/f25/f/fedora-atomic.ks

# Put new url into the kickstart file
#sed -i 's|url=https://kojipkgs.fedoraproject.org/atomic/25/|url=http://192.168.122.1:8000/|' ./fedora-atomic.ks
#sed -i 's|--ref=fedora-atomic/25/x86_64/updates/docker-host|--ref=fedora-atomic/25/x86_64/docker-host|' ./fedora-atomic.ks

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
            <iso>file:///sharedfolder/code/github.com/fedora-infra/bodhi/bodhi/client/Fedora-Everything-netinst-x86_64-25-1.3.iso</iso>
        </install>
        <rootpw>password</rootpw>
        <kernelparam>console=ttyS0</kernelparam>
    </os>
</template>
EOF

# –parameter results_location
# run imagefactory to build disk image
sudo imagefactory --debug --timeout 3000 base_image ./fedora-25.tdl --parameter offline_icicle true --file-parameter install_script ./fedora-atomic.ks

# convert to qcow
#qemu-img convert -O qcow2 /var/lib/imagefactory/storage/83bea7a7-aedb-4d2c-8a9c-3f13b332c411.body /sharedfolder/tmp/cloud-init-atomic-20170124.img.qcow2

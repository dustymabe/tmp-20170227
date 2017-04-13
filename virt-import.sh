#!/bin/bash

# exit on any error
set -eux -o pipefail

# A few tunable variables
NAME='tester'
DISK=$1
RAMSIZE='4096' # IN MB
DISKSIZE='20'  # IN GB
VCPUS='2'      # NUM of CPUs
TMPISO="./user-data-iso.iso${RANDOM}"
TMPDISK="./$(basename ${DISK})${RANDOM}"

USERDATA='
#cloud-config
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
'

METADATA='
instance-id: id-mylocal0001
local-hostname: cloudhost
'

echo "Creating user data iso $TMPISO"
pushd $(mktemp -d)
echo "$USERDATA" > user-data
echo "$METADATA" > meta-data
genisoimage -output $TMPISO -volid cidata -joliet -rock user-data meta-data
popd

echo "Creating snapshot disk $TMPDISK"
qemu-img create -f qcow2 -b $DISK $TMPDISK ${DISKSIZE}g
echo "Will use backing disk $DISK"
echo "Will use snapshot disk $TMPDISK"

# Build up the virt-install command
cmd='virt-install --import'
cmd+=" --name $NAME"
cmd+=" --cpu  host-passthrough" # for nested virt
cmd+=" --ram  $RAMSIZE"
cmd+=" --vcpus $VCPUS"
cmd+=" --disk path=$TMPDISK"
cmd+=" --disk path=${TMPDISK}.2,size=10" # A 2nd disk for whatever
cmd+=" --disk path=$TMPISO"
cmd+=" --accelerate"
cmd+=" --graphics none"
cmd+=" --force"
cmd+=" --network network=default,model=virtio"
cmd+=" --channel unix,mode=bind,target_type=virtio,name='org.qemu.guest_agent.0'"

# Run the command
echo "Running: $cmd"
$cmd

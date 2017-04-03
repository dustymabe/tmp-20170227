#!/bin/bash
set -eux -o pipefail

git clone -b dusty-disable-rpm-ostree-upgrade https://github.com/dustymabe/atomic-host-tests.git
currentdir=$(pwd)

cat <<EOF > jobname.cfg
[general]
cpu = 2
ram = 2048
ansible_dir = ${currentdir}/atomic-host-tests/

[vm1]
user = fedora
image = $1
EOF

cat <<'EOF' > jobname.txt
rpm-ostree status --json  | python -m json.tool
sudo sed -i s/gpgverify/gpg-verify/ /etc/ostree/remotes.d/fedora-atomic.conf
cat /etc/ostree/remotes.d/*
PLAYBOOK tests/improved-sanity-test/main.yml
rpm -qa
systemctl --failed
@@ sudo reboot
SLEEP 40
systemctl --failed
date
EOF

sudo tunir --multi jobname --config-dir ./

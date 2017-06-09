#!/bin/bash
set -eux -o pipefail

git clone https://github.com/projectatomic/atomic-host-tests.git
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
PLAYBOOK tests/improved-sanity-test/main.yml --tags cloud_image
rpm -qa
systemctl --failed &>/dev/null
@@ sudo reboot
SLEEP 40
systemctl --failed &>/dev/null
date
EOF

set +e  # dont error out if tests fail
sudo tunir --multi jobname --config-dir ./ 2>&1 | tee ./tests.log
if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo 'passed' > ./tests_result.txt
else
    echo 'failed' > ./tests_result.txt
fi

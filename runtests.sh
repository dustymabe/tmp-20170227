#!/bin/bash
set -eux -o pipefail

cat <<EOF > jobname.cfg
[general]
cpu = 1
ram = 1024

[vm1]
user = fedora
image = $1
EOF

cat <<'EOF' > jobname.txt
## rpm -q 
## systemctl --failed
## rpm-ostree status --json  | python -m json.tool
date
@@ sudo reboot
SLEEP 40
ls /etc
EOF

sudo tunir --multi jobname --config-dir ./

#!/bin/bash
set -eux -o pipefail

yum install -y epel-release
yum install -y ansible git
git clone https://github.com/dustymabe/tmp-20170227.git


ansible-playbook -i localhost, -c local playbook.yml

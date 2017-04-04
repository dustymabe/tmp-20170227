#!/bin/bash
set -eux -o pipefail

yum install -y epel-release
yum install -y ansible 

ansible-playbook -i localhost, -c local playbook.yml

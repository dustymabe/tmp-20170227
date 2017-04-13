#!/bin/bash
set -eux -o pipefail

branch=$1

yum install -y epel-release
yum install -y ansible git
git clone -b $branch https://github.com/dustymabe/tmp-20170227.git

cd tmp-20170227

# install docker
ansible-playbook -i localhost, -c local playbook.yml

# pull iso from artifacts.ci.centos.org
curl -O http://artifacts.ci.centos.org/sig-atomic/expires-7-days/Fedora-Everything-netinst-x86_64-25-1.3.iso

# pull container from artifacts.ci.centos.org
curl -O http://artifacts.ci.centos.org/sig-atomic/expires-7-days/f25image.tar.xz
docker load -i image ./f25image.tar.xz

# build container

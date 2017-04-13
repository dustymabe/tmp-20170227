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
# pull container from artifacts.ci.centos.org
rsync -avh sig-atomic@artifacts.ci.centos.org::sig-atomic/expires-7-days/f25UT/ ./
docker load -i ./f25image.tar.xz

# build container
docker run -it --rm -v $(pwd)/:/cwd/ --privileged f25image /bin/bash -c "chmod 777 /dev/kvm && libvirtd -d && virtlogd -d && cd /cwd/ && ./endtoend.sh $1" 

rsync -avh ././tests_result.txt ./tests.log ./*qcow2 sig-atomic@artifacts.ci.centos.org::sig-atomic/expires-7-days/$1/
rsync -ah ./ostreerepo/ sig-atomic@artifacts.ci.centos.org::sig-atomic/expires-7-days/$1/ostreerepo/

results=$(<./tests_result.txt)
echo -e "\nTESTS $results"

#!/bin/bash
set -eux -o pipefail

treefile=fedora-atomic-docker-host.json

# Create a local yum repository out of the rpms passed in from the
# command line.
mkdir localyumrepo
cp $@ localyumrepo/
pushd localyumrepo
createrepo ./
popd
localyumrepopath=$(readlink -f ./localyumrepo)

# Initialize ostree repository
# Todo - create this on top of existing ostree repo
mkdir ostreerepo
ostree --repo=ostreerepo init --mode=archive-z2

# Clone the fedora-atomic git repo
git clone -b f25 https://pagure.io/fedora-atomic.git

# Create a yum repo file
cat <<EOF > fedora-atomic/local.repo
[local]
name=local
baseurl=file:///$localyumrepopath
enabled=1
EOF
sed -i 's/"fedora-25-updates"/ "fedora-25-updates"\, "local"/' fedora-atomic/$treefile

# Do the compose
sudo rpm-ostree compose tree --repo=ostreerepo fedora-atomic/$treefile

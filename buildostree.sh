#!/bin/bash
set -eux -o pipefail

treefile=fedora-atomic-docker-host.json

# Create a temporary directory for us to operate out of
origdir=$(pwd)
tmpdir=$(mktemp -d)

# Clean up the tmp dir on exit
trap 'rm -rf $tmpdir' EXIT SIGHUP SIGINT SIGTERM

# Initialize ostree repository
# Todo - create this on top of existing ostree repo
if [[ ! -e ./ostreerepo ]]; then
    mkdir ostreerepo
    ostree --repo=ostreerepo init --mode=archive-z2
fi

# If no cachedir exists then we'll create one
if [[ ! -e ./cachedir ]]; then
    mkdir cachedir
fi

# Create a local yum repository out of the rpms passed in from the
# command line.
mkdir $tmpdir/localyumrepo
cp $@ $tmpdir/localyumrepo/
localyumrepopath=$(readlink -f $tmpdir/localyumrepo)
createrepo $localyumrepopath

# change into tmp dir. we'll work from here from now on
pushd $tmpdir

# Clone the fedora-atomic git repo
git clone -b f25 https://pagure.io/fedora-atomic.git

# Create a yum repo file
cat <<EOF > fedora-atomic/local.repo
[local]
name=local
baseurl=file://$localyumrepopath
enabled=1
EOF
sed -i 's/"fedora-25-updates"/ "fedora-25-updates"\, "local"/' fedora-atomic/$treefile
sed -i 's/gpgcheck=1/gpgcheck=0/' fedora-atomic/*repo # some updates aren't signed yet

# Do the compose
sudo rpm-ostree compose tree --repo=${origdir}/ostreerepo --cachedir=${origdir}/cachedir/ fedora-atomic/$treefile

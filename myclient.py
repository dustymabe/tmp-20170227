


PACKAGES = """
    acl
    atomic
    atomic-devmode
    attr
    audit
    audit-libs
    audit-libs-python
    audit-libs-python3
    authconfig
    basesystem
    bash
    bash-completion
    bind99-libs
    bind99-license
    boost-iostreams
    boost-program-options
    boost-random
    boost-regex
    boost-system
    boost-thread
    bridge-utils
    btrfs-progs
    bubblewrap
    bzip2
    bzip2-libs
    ca-certificates
    ceph-common
    checkpolicy
    chkconfig
    chrony
    cloud-init
    cloud-utils-growpart
    cockpit-bridge
    cockpit-docker
    cockpit-networkmanager
    cockpit-ostree
    cockpit-system
    conntrack-tools
    container-selinux
    coreutils
    coreutils-common
    cpio
    cracklib
    cracklib-dicts
    crypto-policies
    cryptsetup
    cryptsetup-libs
    curl
    cyrus-sasl-lib
    dbus
    dbus-glib
    dbus-libs
    device-mapper
    device-mapper-event
    device-mapper-event-libs
    device-mapper-libs
    device-mapper-persistent-data
    dhcp-client
    dhcp-common
    dhcp-libs
    diffutils
    dnsmasq
    docker
    docker-common
    dracut
    dracut-config-generic
    dracut-network
    e2fsprogs
    e2fsprogs-libs
    efibootmgr
    efivar-libs
    elfutils-default-yama-scope
    elfutils-libelf
    elfutils-libs
    emacs-filesystem
    etcd
    expat
    fcgi
    fedora-logos
    fedora-release
    fedora-release-atomichost
    fedora-repos
    file
    file-libs
    filesystem
    findutils
    fipscheck
    fipscheck-lib
    flannel
    freetype
    fuse
    fuse-libs
    gawk
    gc
    gdbm
    GeoIP
    GeoIP-GeoLite-data
    gettext
    gettext-libs
    glib2
    glibc
    glibc-all-langpacks
    glibc-common
    glib-networking
    glusterfs
    glusterfs-client-xlators
    glusterfs-fuse
    glusterfs-libs
    gmp
    gnupg
    gnupg2
    gnupg2-smime
    gnutls
    gobject-introspection
    gomtree
    gperftools-libs
    gpgme
    grep
    grub2
    grub2-efi
    grub2-tools
    grubby
    gsettings-desktop-schemas
    gssproxy
    guile
    gzip
    hardlink
    hostname
    info
    initscripts
    ipcalc
    iproute
    iproute-tc
    iptables
    iptables-libs
    iptables-services
    iputils
    iscsi-initiator-utils
    iscsi-initiator-utils-iscsiuio
    jansson
    json-glib
    kernel
    kernel-core
    kernel-modules
    keyutils
    keyutils-libs
    kmod
    kmod-libs
    kpartx
    krb5-libs
    kubernetes
    kubernetes-client
    kubernetes-master
    kubernetes-node
    less
    libacl
    libaio
    libarchive
    libassuan
    libatomic_ops
    libattr
    libbabeltrace
    libbasicobjects
    libblkid
    libcap
    libcap-ng
    libcephfs1
    libcgroup
    libcollection
    libcom_err
    libcroco
    libcrypt-nss
    libcurl
    libdaemon
    libdb
    libdb-utils
    libedit
    libev
    libevent
    libfdisk
    libffi
    libgcc
    libgcrypt
    libgomp
    libgpg-error
    libgudev
    libicu
    libidn
    libidn2
    libini_config
    libksba
    libmetalink
    libmnl
    libmodman
    libmount
    libndp
    libnetfilter_conntrack
    libnetfilter_cthelper
    libnetfilter_cttimeout
    libnetfilter_queue
    libnfnetlink
    libnfsidmap
    libnghttp2
    libnl3
    libnl3-cli
    libpath_utils
    libpcap
    libpng
    libproxy
    libpsl
    libpwquality
    librados2
    libradosstriper1
    librbd1
    libref_array
    librepo
    libreport-filesystem
    librgw2
    libseccomp
    libsecret
    libselinux
    libselinux-python
    libselinux-python3
    libselinux-utils
    libsemanage
    libsemanage-python
    libsemanage-python3
    libsepol
    libsigsegv
    libsmartcols
    libsolv
    libsoup
    libss
    libssh2
    libsss_idmap
    libsss_nss_idmap
    libsss_sudo
    libstdc++
    libtasn1
    libteam
    libtirpc
    libtomcrypt
    libtommath
    libtool-ltdl
    libunistring
    libunwind
    libusb
    libusbx
    libuser
    libutempter
    libuuid
    libverto
    libverto-libev
    libxkbcommon
    libxml2
    libyaml
    linux-atm-libs
    linux-firmware
    lsof
    lttng-ust
    lua-libs
    lvm2
    lvm2-libs
    lz4
    lzo
    make
    mdadm
    mokutil
    mozjs17
    mpfr
    ncurses
    ncurses-base
    ncurses-libs
    nettle
    net-tools
    NetworkManager
    NetworkManager-libnm
    NetworkManager-team
    newt
    newt-python3
    nfs-utils
    nmap-ncat
    npth
    nspr
    nss
    nss-altfiles
    nss-pem
    nss-softokn
    nss-softokn-freebl
    nss-sysinit
    nss-tools
    nss-util
    oci-register-machine
    oci-systemd-hook
    oddjob
    oddjob-mkhomedir
    openldap
    openssh
    openssh-clients
    openssh-server
    openssl
    openssl-libs
    os-prober
    ostree
    ostree-grub2
    p11-kit
    p11-kit-trust
    pam
    passwd
    pcre
    pigz
    pinentry
    pkgconfig
    plymouth
    plymouth-core-libs
    plymouth-scripts
    policycoreutils
    policycoreutils-python
    policycoreutils-python3
    policycoreutils-python-utils
    polkit
    polkit-libs
    polkit-pkla-compat
    popt
    ppp
    procps-ng
    psmisc
    publicsuffix-list-dafsa
    python
    python2-docker-pycreds
    python2-pysocks
    python2-requests
    python2-setuptools
    python2-urllib3
    python3
    python3-chardet
    python3-configobj
    python3-crypto
    python3-dateutil
    python3-dbus
    python3-decorator
    python3-docker-py
    python3-docker-pycreds
    python3-gobject-base
    python3-jinja2
    python3-jsonpatch
    python3-jsonpointer
    python3-libs
    python3-libxml2
    python3-markupsafe
    python3-oauthlib
    python3-pip
    python3-prettytable
    python3-pyserial
    python3-pysocks
    python3-PyYAML
    python3-requests
    python3-rpm
    python3-setuptools
    python3-six
    python3-slip
    python3-slip-dbus
    python3-sssdconfig
    python3-urllib3
    python3-websocket-client
    python-backports
    python-backports-ssl_match_hostname
    python-cephfs
    python-chardet
    python-docker-py
    python-ipaddress
    python-IPy
    python-IPy-python3
    python-libs
    python-pip
    python-rados
    python-rbd
    python-six
    python-websocket-client
    qrencode-libs
    quota
    quota-nls
    readline
    rootfiles
    rpcbind
    rpm
    rpm-build-libs
    rpm-libs
    rpm-ostree
    rpm-plugin-selinux
    rsync
    runc
    screen
    sed
    selinux-policy
    selinux-policy-targeted
    setools-console
    setools-libs
    setup
    shadow-utils
    shared-mime-info
    shim
    skopeo
    skopeo-containers
    slang
    socat
    sos
    sqlite
    sqlite-libs
    sssd-client
    strace
    sudo
    systemd
    systemd-bootchart
    systemd-container
    systemd-libs
    systemd-pam
    systemd-udev
    system-python
    system-python-libs
    tar
    tcpdump
    tcp_wrappers
    tcp_wrappers-libs
    teamd
    timedatex
    tmux
    trousers
    trousers-lib
    tzdata
    userspace-rcu
    ustr
    util-linux
    vim-minimal
    which
    xfsprogs
    xkeyboard-config
    xz
    xz-libs
    yajl
    zlib
    """.split()


from bodhi.client import bindings


client = bindings.BodhiClient()

testing = client.query(
        packages=','.join(PACKAGES), 
        releases='25',
        status='testing')

pending = client.query(
        packages=','.join(PACKAGES), 
        releases='25',
        status='pending')

for update in testing.updates + pending.updates:
    for build in update.builds:
        print("%s\tsigned:%s" % (build.nvr, build.signed))
    print("\t           url: %s" % update.url)
    print("\t        status: %s" % update.status)
    print("\tdate_submitted: %s\n" % update.date_submitted)
         

#print q.updates[0]
import sys
sys.exit()


# Take each update
#    - include rpms from update into local repo
#    - generate ostree
#    - generate disk image
#    - boot disk image
#    - optional: boot latest released disk image
#    - upda

# pull down treefile from pagure
#   https://pagure.io/fedora-atomic/blob/f25/f/fedora-atomic-docker-host.json
#   #and/or clone repo
#   git clone https://pagure.io/fedora-atomic.git
#   git checkout f25

#   bodhi updates download --builds openssl-1.0.2k-1.fc25 
#   bodhi updates download --updateid FEDORA-2017-40057be2c5


# was a test successful? yes -> no more testing needed
# no -> 
#   have we already run a test?
#     - was the last test run before the last updates mash completed
# 


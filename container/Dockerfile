# sudo docker run -it --rm -v $(pwd)/:/cwd/ -v /sharedfolder/cache/:/cwd/cachedir/  --privileged  -v /tmp:/tmp -v /dev/:/dev/ --tmpfs /run image /bin/bash
#FROM fedora:25
FROM registry.fedoraproject.org/fedora:25
#FROM registry.fedoraproject.org/fedora:26
#FROM fedora-docker-base-26-20170325.n.0.x86_64

RUN curl -L https://copr.fedorainfracloud.org/coprs/bowlofeggs/bodhi/repo/fedora-25/bowlofeggs-bodhi-fedora-25.repo > /etc/yum.repos.d/bowlofeggs-bodhi-fedora-25.repo
RUN curl -L https://copr.fedorainfracloud.org/coprs/dustymabe/oz/repo/fedora-26/dustymabe-oz-fedora-25.repo > /etc/yum.repos.d/dustymabe-oz-fedora-25.repo
RUN dnf install --assumeyes \
        bodhi-client sudo git \
        rpm-ostree ostree     \
        createrepo libvirt-client imagefactory imagefactory-plugins-TinMan \
        tunir ansible         \
        && dnf clean all

#RUN dnf --releasever 26 update -y rpm-ostree ostree
RUN dnf --releasever 26 update -y ostree https://kojipkgs.fedoraproject.org//work/tasks/4842/18934842/rpm-ostree-2017.3-4.fc26.x86_64.rpm

#LABEL RUN 

RUN dnf update -y https://kojipkgs.fedoraproject.org/work/tasks/5384/18935384/rpm-ostree-2017.3-4.fc25.x86_64.rpm

#STOPSIGNAL SIGRTMIN+3
#CMD [ "/sbin/init" ]

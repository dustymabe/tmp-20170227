# sudo docker run -it --rm -v $(pwd)/:/cwd/ -v /sharedfolder/cache/:/cwd/cachedir/  --privileged  -v /tmp:/tmp -v /dev/:/dev/ --tmpfs /run image /bin/bash
#FROM fedora:25
#FROM registry.fedoraproject.org/fedora:26
FROM fedora-docker-base-26-20170325.n.0.x86_64

#RUN curl -L https://copr.fedorainfracloud.org/coprs/bowlofeggs/bodhi/repo/fedora-25/bowlofeggs-bodhi-fedora-25.repo > /etc/yum.repos.d/bowlofeggs-bodhi-fedora-25.repo
RUN dnf install --assumeyes \
        bodhi-client sudo git \
        rpm-ostree ostree     \
        createrepo libvirt-client imagefactory imagefactory-plugins-TinMan \
        tunir ansible         \
        && dnf clean all

#LABEL RUN 
#STOPSIGNAL SIGRTMIN+3
#CMD [ "/sbin/init" ]

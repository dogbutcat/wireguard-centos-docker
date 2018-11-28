FROM centos:7

WORKDIR /root

ENV PORT=3456

RUN curl -Lo /etc/yum.repos.d/wireguard.repo https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/repo/epel-7/jdoss-wireguard-epel-7.repo && \
	rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org && \
	rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm && \
	yum install epel-release iproute -y && \
	yum --enablerepo=elrepo-kernel install kernel-ml-headers-$(uname -r) kernel-ml-devel-$(uname -r) -y && \
	yum -y install wireguard-dkms wireguard-tools qrencode

EXPOSE 3456/udp

COPY script script

ENTRYPOINT [ "script/run.sh" ]

CMD [  ]

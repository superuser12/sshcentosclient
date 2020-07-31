FROM centos:7.2.1511
RUN yum install -y openssh openssh-server openssh-clients openssl-libs
RUN systemctl enable sshd.service
CMD ["/sbin/init"]

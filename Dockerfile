FROM rockylinux:8.5.20220308
RUN yum install -y openssh openssh-server openssh-clients openssl-libs tcpdump iproute passwd
RUN echo 'password' | /usr/bin/passwd --stdin root
RUN systemctl enable sshd.service
CMD ["/sbin/init"]

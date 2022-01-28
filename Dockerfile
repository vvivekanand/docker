FROM centos:latest
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd 
RUN useradd -c "SSH User" -m sshuser 
RUN echo "sshuser:sshuser" | chpasswd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N "" 
EXPOSE 22 
CMD ["/usr/sbin/sshd","-D"
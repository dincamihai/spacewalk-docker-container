FROM opensuse/leap:42.3
MAINTAINER Mihai Dinca: "mdinca@suse.com"

RUN zypper --non-interactive in openssh rsync git iproute2 make java-1_8_0-openjdk ant
RUN zypper --non-interactive in apache-ivy
   
COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh
COPY .bashrc /root/.bashrc
COPY Makefile /root/Makefile
COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]

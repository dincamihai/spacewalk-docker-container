FROM opensuse/tumbleweed
MAINTAINER Mihai Dinca: "mdinca@suse.com"

RUN zypper --non-interactive in openssh rsync git iproute2 make java-1_8_0-openjdk ant
RUN zypper --non-interactive in apache-ivy
# RUN zypper --non-interactive in xvfb-run
# RUN zypper --non-interactive in java-1_8_0-openjdk-devel openssh rsync apache-ivy ant ant-junit
# 
# RUN zypper --non-interactive in which vim sudo
# 
# RUN useradd -ms /bin/bash eclim
#  
# ADD eclipse-inst-linux64.tar.gz /home/eclim/eclipse/
# ADD eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz /home/eclim/
# RUN chown -R eclim:users /home/eclim/eclipse
# RUN zypper --non-interactive install -t pattern devel_C_C++ 
 
# USER eclim
# WORKDIR /home/eclim
 
# COPY eclipse.sh /home/eclim/eclipse.sh
# COPY eclim.sh /home/eclim/eclim.sh
# 
# RUN Xvfb :1 -screen 0 1024x768x24 &
# RUN /home/eclim/eclipse.sh
 
# ADD vim.tar /home/eclim
# COPY eclim_2.6.0.jar /home/eclim/eclim.jar
# # RUN /home/eclim/eclim.sh
# # RUN DISPLAY=:1 /home/eclim/eclipse/eclimd -b
   
COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh
COPY .bashrc /root/.bashrc
COPY Makefile /root/Makefile
COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]

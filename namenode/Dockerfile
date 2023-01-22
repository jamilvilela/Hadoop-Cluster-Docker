## NameNome Hadoop configuration file

# Operational system
FROM ubuntu:latest

# Updates
RUN \
  apt-get update && apt-get install -y \
  openssh-server \
  python3 \
  rsync \
  sudo \
  arp-scan \
  net-tools \
  iputils-ping \
  vim \
  && apt-get clean

# user creation for hadoop install
RUN useradd -m hduser && echo "hduser:supergroup" | chpasswd && adduser hduser sudo && echo "hduser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && cd /usr/bin/ && sudo ln -s python3 python

# Copy SSH config file
ADD ./config-files/ssh_config /etc/ssh/ssh_config

# change the user
USER hduser

WORKDIR /home/hduser

# ssh key creation
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys

# work user
ENV HDFS_NAMENODE_USER=hduser
ENV HDFS_DATANODE_USER=hduser
ENV HDFS_SECONDARYNAMENODE_USER=hduser
ENV YARN_RESOURCEMANAGER_USER=hduser
ENV YARN_NODEMANAGER_USER=hduser

# JDK binary copy
ADD ./binary/jdk ./jdk

# JDK environment variables
ENV JAVA_HOME=/home/hduser/jdk
ENV PATH=$PATH:$JAVA_HOME:$JAVA_HOME/bin

# Haddop binary copy
ADD ./binary/hadoop ./hadoop

# Hadoop environment variables
ENV HADOOP_HOME=/home/hduser/hadoop
ENV PATH=$PATH:$HADOOP_HOME
ENV PATH=$PATH:$HADOOP_HOME/bin
ENV PATH=$PATH:$HADOOP_HOME/sbin

# NameNode files
RUN mkdir /home/hduser/hdfs
RUN mkdir /home/hduser/hdfs/namenode

# environment variables
RUN echo "PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
RUN echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc
RUN echo "PATH=$PATH:$JAVA_HOME/sbin" >> ~/.bashrc

# Copy config files
ADD ./config-files/hadoop-env.sh $HADOOP_HOME/etc/hadoop/
ADD ./config-files/core-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files/workers $HADOOP_HOME/etc/hadoop/

# Exposed ports
EXPOSE 50070 50075 50010 50020 50090 8020 9000 9864 9870 8030 8031 8032 8033 8040 8042 22
#!/bin/bash

# It should be run into each container

# Restart the service ssh
sudo service ssh restart

# Adjust the priviledges
sudo chown -R hduser:hduser /home/hduser/jdk
sudo chown -R hduser:hduser /home/hduser/hadoop

# make directoty ~/.ssh
mkdir ~/.ssh

# create the file ~/.ssh/authorized_keys
touch ~/.ssh/authorized_keys

# Adjust the priviledge
chmod 600 ~/.ssh/authorized_keys

# Copie a chave que está em /home/hduser/.ssh/authorized_keys no NameNode para o mesmo arquivo em cada datanode.

# Start do serviço do DataNode
hdfs --daemon start datanode

# Stop the service
hdfs --daemon stop datanode
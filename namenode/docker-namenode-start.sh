#!/bin/bash

# It should be run into the container

# Restart the service ssh
sudo service ssh restart

# Adjust the privileges
sudo chown -R hduser:hduser /home/hduser/jdk
sudo chown -R hduser:hduser /home/hduser/hadoop

# Format the NameNode (just once)
hdfs namenode -format

# Initialize the namenode
hdfs --daemon start namenode

# Se precisar parar o serviço:
hdfs --daemon stop namenode
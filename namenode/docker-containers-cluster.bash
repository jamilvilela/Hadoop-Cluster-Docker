# Image building
docker build . -t hadoop-namenode:data-lake-jamil

# Network creation for the hadoop cluster
docker network create -d bridge data-lake-network

# docker run the image inside a container 
docker run -it -d --net data-lake-network --hostname hdpmaster -p 9870:9870 -p 50030:50030 -p 8020:8020 --name hadoop-namenode hadoop-namenode:data-lake-jamil
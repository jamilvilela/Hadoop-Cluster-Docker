# Image building
docker build . -t hadoop-datanode:data-lake-jamil

# Network creation for the hadoop cluster
docker network create -d bridge data_lake_network

# docker run the image inside of the containers 
docker run -it -d --net data_lake_network --hostname datanode1 --name hadoop-datanode1 hadoop-datanode:data-lake-jamil

docker run -it -d --net data_lake_network --hostname datanode2 --name hadoop-datanode2 hadoop-datanode:data-lake-jamil
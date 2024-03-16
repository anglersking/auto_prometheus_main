docker rm -f plmxs
docker build  --network="host" -t plmxs . 
docker run -dit --net=host -v $(pwd)/out:/out -v /dev:/dev --privileged=true --name=plmxs plmxs
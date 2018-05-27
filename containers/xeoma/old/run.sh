firewall-cmd --zone=public --add-port=8090/tcp --permanent && firewall-cmd --reload
docker stop xeoma
docker rm -f xeoma
container=$(docker ps | grep xeoma | cut -d' ' -f1) && echo "container = $container" && docker rm -f $container
docker stop container; docker rm -f container
docker stop $container && docker rm -f $container

CID=$(docker run --name xeoma -d -t -p 8090:8090 xeoma) && echo CIS=xeoma
    docker exec xeoma /home/xeoma/bin/xeoma.app -showpassword

docker logs -f xeoma

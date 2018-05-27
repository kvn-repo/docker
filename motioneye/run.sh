#firewall-cmd --zone=public --add-port=8765/tcp --permanent
#firewall-cmd --reload
mkdir -p /docker/motioneye/data
docker rm --force motioneye

docker run -d --name motioneye \
	–p 8765:8765 \
	-v /docker/motioneye/data:/data \
        -v /docker/volumes/motioneye/etc:/etc/motioneye \
        -v /etc/localtime:/etc/localtime:ro \
        -h motioneye \
        -d motioneye \
	motioneye
	
	


#docker run -d --name motioneye \
##        -p 8765:8765 \
#        -p 8766:7999 \
#	-v /docker/motioneye/data:/data \
#        -v /docker/volumes/motioneye/etc:/etc/motioneye \
#        -v /etc/localtime:/etc/localtime:ro \
#        -h motioneye \
#        -d motioneye
#	motioneye

#docker run -i \
#           -t \
#           --restart=always \
#           --device=/dev/video0 \
#           -v /docker/volumes/motioneye/etc:/etc/motioneye \
#           -v /docker/volumes/motioneye/run:/var/run/motioneye \
#           -v /docker/volumes/motioneye/data:/var/lib/motioneye \
#           -v /etc/localtime:/etc/localtime:ro \
#           --name motioneye \
#           -p 8765:8765 \
#           -p 8766:7999 \
#           -h motioneye \
#           -d motioneye
docker logs -f motioneye


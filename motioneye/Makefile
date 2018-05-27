build:
	mkdir -p /docker/volumes/motioneye
	docker build -t motioneye .
clean:
	docker stop motioneye
	docker rm motioneye
	docker rmi motioneye
	/usr/local/docker/admin/cleanup.sh

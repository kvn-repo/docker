build:
	mkdir -p /docker/volumes/xeoma
	docker build -t xeoma .
clean:
	docker rm --force xeoma
	docker rmi --force xeoma
	/usr/local/docker/admin/cleanup.sh
	rm -rf /docker/volumes/xeoma

docker run -d  \
--name="xeoma" \
--restart="always" \
--net=host \
-p 8090:8090 \
-v /docker/volumes/xeoma/local:/usr/local/Xeoma \
-v /docker/volumes/exoma/archive:/usr/local/Xeoma/XeomaArchive \
xeoma


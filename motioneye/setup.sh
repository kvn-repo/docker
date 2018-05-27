sudo firewall-cmd --zone=public --add-port=554/tcp --permanent
sudo firewall-cmd --zone=public --add-port=554/udp --permanent
sudo firewall-cmd --zone=public --add-port=62088/tcp --permanent
sudo firewall-cmd --zone=public --add-port=62088/udp --permanent
sudo firewall-cmd --zone=public --add-port=888/tcp --permanent
sudo firewall-cmd --zone=public --add-port=888/udp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8085/udp --permanent
sudo firewall-cmd --zone=public --add-port=8085/udp --permanent
sudo firewall-cmd --zone=public --add-port=8766/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8766/tcp --permanent
sudo firewall-cmd --reload
sudo groupadd -g 10000 motioneye
sudo useradd -g 10000 motioneye

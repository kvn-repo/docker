FROM fedora
MAINTAINER me <kvn.eml@gmail.com>

RUN dnf -y update
RUN dnf -y install tar gcc*

RUN curl -o /root/xeoma_linux64.tgz http://felenasoft.com/xeoma/downloads/xeoma_linux64.tgz && \
	tar -xvzf /root/xeoma_linux64.tgz -C /root && \
	/root/xeoma.app -install -allmanual && \
	rm /root/xeoma_linux64.tgz


RUN touch /root/firstrun

# Set up start up scripts
ADD xeoma.sh  /bin/
RUN chmod +x /bin/xeoma.sh
VOLUME /usr/local/Xeoma
CMD xeoma.sh

# Expose the port
EXPOSE 8090

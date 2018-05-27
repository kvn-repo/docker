# Xeoma

FROM fedora
MAINTAINER Kevin Hansen <kvnhnsn@.com>


RUN dnf -y update && dnf -y install wget tar sudo alsa-lib-devel libX11-devel
RUN echo 'root:root' | chpasswd
RUN useradd -d /home/xeoma -m -s /bin/bash xeoma && echo xeoma:xeoma | chpasswd
RUN echo 'xeoma ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/xeoma && chmod 0440 /etc/sudoers.d/xeoma

USER xeoma

WORKDIR /home/xeoma
RUN mkdir -p /home/xeoma/.config/Xeoma

VOLUME /home/xeoma/.config/Xeoma

# Download Xeoma
RUN mkdir -p /home/xeoma/bin && wget http://felenasoft.com/xeoma/downloads/xeoma_linux64.tgz -O /tmp/xeoma.tgz 
RUN tar -C '/home/xeoma/bin/' -xzf /tmp/xeoma.tgz

# Expose ssh and Xeoma ports
EXPOSE 8090
EXPOSE 22

# Launch the server
CMD ["/home/xeoma/bin/xeoma.app", "-core", "-log", "-showpassword"]


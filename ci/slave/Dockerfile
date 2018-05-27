FROM jenkins/jnlp-slave:3.16-1-alpine
USER root
ENV ANSIBLE_VERSION 2.4.2.0

ENV BUILD_PACKAGES \
 bash \
 ca-certificates \
 curl \
 git \
 mercurial \
 jq \
 openssh-client \
 python \
 py-boto \
 py-dateutil \
 py-httplib2 \
 py-jinja2 \
 py-paramiko \
 py-pip \
 py-setuptools \
 py-yaml \
 sshpass \
 tar \
 unzip \
 wget \
 zip



RUN apk --update add --virtual build-dependencies \
 gcc \
 musl-dev \
 libffi-dev \
 openssl-dev \
 python-dev

RUN set -x && \
   apk update && apk upgrade && \
   apk add --no-cache ${BUILD_PACKAGES} && \
   pip install --upgrade pip && \
   pip install python-keyczar docker-py && \
   # Cleaning up
   apk del build-dependencies && \
       rm -rf /var/cache/apk/*

#==========
# Maven
#==========
ENV MAVEN_VERSION 3.5.0

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

#==========
# Ant
#==========

ENV ANT_VERSION 1.10.1

RUN curl -fsSL https://www.apache.org/dist/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-ant-$ANT_VERSION /usr/share/ant \
  && ln -s /usr/share/ant/bin/ant /usr/bin/ant

ENV ANT_HOME /usr/share/ant


#====================================
# JMETER
#====================================
RUN mkdir /usr/share/jmeter \
      && wget -O - "https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.tgz" \
      | tar -xz --strip=1 -C /usr/share/jmeter

#==========
# Ansible
#==========

RUN \
 mkdir -p /etc/ansible/ /ansible

RUN \
 echo "[local]" >> /etc/ansible/hosts && \
 echo "localhost" >> /etc/ansible/hosts

RUN \
 curl -fsSL https://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz -o ansible.tar.gz && \
 tar -xzf ansible.tar.gz -C /ansible --strip-components 1 && \
 rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV PYTHONPATH /ansible/lib
ENV PATH /ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /ansible/library
ENV ANSIBLE_KEEP_REMOTE_FILES 1
USER jenkins


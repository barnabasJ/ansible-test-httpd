FROM centos:6
LABEL maintainer="Jovanovics Barnabas"

# Install Ansible and other requirements.
RUN yum makecache fast \
 && yum -y install deltarpm epel-release \
      centos-release-scl \
 && yum -y update \
 && yum -y install \
      sudo \
      which \
      initscripts \
      python-urllib3 \
      pyOpenSSL \
      python2-ndg_httpsclient \
      python-pyasn1 \
      python27 \
      git \
      gcc \
 && yum clean all

RUN echo easy_install-2.7 pip | scl enable python27 - \
 && echo pip install ansible==2.4.3 testinfra pytest pycrypto | scl enable python27 -


# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

RUN yum install -y httpd httpd-itk\
    && mkdir -p /etc/httpd/modsecurity.d/activated_rules

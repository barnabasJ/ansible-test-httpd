FROM barnabasj/ansible-test-base
RUN yum install -y httpd
    && mkdir -p /etc/httpd/modsecurity.d/activated_rules
RUN pip install --upgrade pip setuptools \
    && pip install ansible pycrypto pytest pytest-gitignore pytest-xdist \
    && pip install git+https://github.com/etingof/apacheconfig.git#egg=apacheconfig \
    && pip install -e git+https://github.com/barnabasJ/testinfra.git@apache_config#egg=testinfra

FROM barnabasj/ansible-test-base
RUN yum install -y httpd \
    && mkdir -p /etc/httpd/modsecurity.d/activated_rules

FROM wiryonolau/httpd-php

ARG LO_VERSION=6.0.5

# Install openjdk
RUN yum install -y cairo cups-libs libSM java-1.8.0-openjdk wget \
    && yum clean all \
    && rm -rf /var/cache/yum/*

# Install libreoffice
RUN wget -O /tmp/libreoffice.tar.gz "http://download.documentfoundation.org/libreoffice/stable/${LO_VERSION}/rpm/x86_64/LibreOffice_${LO_VERSION}_Linux_x86-64_rpm.tar.gz" \
    && mkdir -p /tmp/libreoffice \
    && tar -xvf /tmp/libreoffice.tar.gz -C /tmp/libreoffice --strip 1 \
    && yum install -y /tmp/libreoffice/RPMS/*.rpm \ 
    && rm -rf /tmp/libreoffice \
    && rm -rf /tmp/libreoffice.tar.gz

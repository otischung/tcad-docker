FROM rockylinux:9.3

SHELL ["/bin/bash", "-c"]
ARG THREADS=96
ARG TARGETPLATFORM

RUN mkdir -p /cad/synopsys && \
    ln -s /cad /usr/cad

WORKDIR /usr/cad/synopsys
COPY ./src/* /usr/cad/synopsys/

RUN yum install -y csh iputils net-tools vim
RUN tar zxvf *1of*.tgz && \
    tar xvf CIC.tar && \
    echo "140.126.24.16    lshc" >> /etc/hosts && \
    echo "140.110.127.149    lstn" >> /etc/hosts && \
    echo "140.110.140.29    lstc" >> /etc/hosts && \
    echo "127.0.0.1       localhost.localdomain     localhost" >> /etc/hosts && \
    echo "140.113.217.11  lab512" >> /etc/hosts && \
    rm *.tar *.tgz && \
    mkdir /workspace

WORKDIR /workspace
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

SHELL ["/bin/tcsh", "-c"]
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/bin/tcsh"]

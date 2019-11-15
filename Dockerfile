FROM alpine
  
ENV NPS_VERSION 0.24.0
ENV NPS_RELEASE_URL_1   https://github.com/cnlh/nps/releases/download/v0.23.2/linux_amd64_server.tar.gz
ENV NPS_RELEASE_URL_2   https://github.com/cnlh/nps/releases/download/v0.24.0/nps_linux_amd64
WORKDIR /
RUN     wget --no-check-certificate ${NPS_RELEASE_URL_1} && \
        tar xzf /linux_amd64_server.tar.gz && \
        rm /linux_amd64_server.tar.gz && \
        rm /nps/nps && \
        wget --no-check-certificate ${NPS_RELEASE_URL_2} && \
        chmod +x nps_linux_amd64 && \
        mv /nps_linux_amd64 /nps/nps

VOLUME /nps/conf

CMD /nps/nps

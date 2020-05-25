FROM centos:7 as builder


COPY ./APIGateway_Install.run /opt/APIGateway_Install.run
COPY ./scripts/runInstall.sh /opt/runInstall.sh
RUN chmod +x /opt/runInstall.sh && /opt/runInstall.sh 


FROM centos:7 
LABEL maintainer="support@axway.com"

RUN yum install epel-release -y \
yum -y update \
&& yum -y install ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl \
        libicu \
        libunwind \
        netcat

RUN groupadd emtuser -g 1000
RUN adduser emtuser -u 1000 -g 1000 -c "EMT User" && \
    chmod 777 /opt
COPY --chown=emtuser --from=builder /opt/Axway /opt/Axway
WORKDIR /azp
COPY ./scripts/start.sh . 
RUN chmod +x start.sh

CMD ["./start.sh"]

#!/bin/sh

echo 'Performing install steps...'
cd /opt && \ 
   ./APIGateway_Install.run \
        --mode unattended \
        --setup_type advanced \
        --enable-components packagedeploytools \
        --disable-components apigateway,qstart,policystudio,analytics,configurationstudio,apimgmt,cassandra \
        --prefix /opt/Axway/ && \
    rm -rf /opt/Axway/Axway-installLog.log \
        /opt/Axway/uninstall* \
        /opt/Axway/apigateway/upgrade \
        /opt/Axway/apigateway/docs \
        /opt/Axway/apigateway/Linux.x86_64/bin/wkhtmltopdf \
        /opt/Axway/apigateway/tools/filebeat* \
        /opt/Axway/apigateway/webapps/quickstart

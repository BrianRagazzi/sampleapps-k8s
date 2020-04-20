#!/bin/bash
images=('mssql-app-service-proxy'
        'mssql-control-watchdog'
        'mssql-controller'
        'mssql-dns'
        'mssql-hadoop'
        'mssql-mleap-serving-runtime'
        'mssql-mlserver-py-runtime'
        'mssql-mlserver-r-runtime'
        'mssql-monitor-collectd'
        'mssql-monitor-elasticsearch'
        'mssql-monitor-fluentbit'
        'mssql-monitor-grafana'
        'mssql-monitor-influxdb'
        'mssql-monitor-kibana'
        'mssql-monitor-telegraf'
        'mssql-security-domainctl'
        'mssql-security-knox'
        'mssql-security-support'
        'mssql-server'
        'mssql-server-controller'
        'mssql-server-data'
        'mssql-ha-operator'
        'mssql-ha-supervisor'
        'mssql-service-proxy'
        'mssql-ssis-app-runtime')

for image in ${images[*]}
do
   docker pull mcr.microsoft.com/mssql/bdc/$image:latest
   docker tag mcr.microsoft.com/mssql/bdc/$image:latest harbor.pae.ragazzilab.com/bdc/$image:latest
   docker push harbor.pae.ragazzilab.com/bdc/$image:latest
   docker rmi mcr.microsoft.com/mssql/bdc/$image:latest
   docker rmi harbor.pae.ragazzilab.com/bdc/$image:latest
done

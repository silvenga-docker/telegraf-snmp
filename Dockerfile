FROM telegraf:1.7

# https://github.com/influxdata/influxdata-docker/issues/208#issuecomment-381793475

RUN echo "deb http://ftp.us.debian.org/debian stretch main non-free" >> /etc/apt/sources.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping snmp procps snmp-mibs-downloader \
    && rm -rf /var/lib/apt/lists/*

RUN wget http://dl.ubnt-ut.com/snmp/UBNT-MIB -P /usr/share/snmp/mibs \
    && wget http://dl.ubnt-ut.com/snmp/UBNT-UniFi-MIB -P /usr/share/snmp/mibs
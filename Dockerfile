FROM telegraf:1.14

RUN set -xe \
    && echo "deb http://ftp.us.debian.org/debian stretch main non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y snmp-mibs-downloader wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && wget http://dl.ubnt-ut.com/snmp/UBNT-MIB -P /usr/share/snmp/mibs \
    && wget http://dl.ubnt-ut.com/snmp/UBNT-UniFi-MIB -P /usr/share/snmp/mibs \
    && wget "https://download.schneider-electric.com/files?p_enDocType=Firmware&p_File_Name=powernet430.mib&p_Doc_Ref=APC_POWERNETMIB_430" --content-disposition -P /usr/share/snmp/mibs \
    && echo "mibs +ALL" > /etc/snmp/snmp.conf

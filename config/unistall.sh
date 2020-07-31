#!/bin/bash

yum erase -y traceroute

rm -rf /root/monitoreo
mv /var/log/monitoreo /root/log_monitoreo.BAK
sed -i '/monitoreo/d' /var/spool/cron/root
rm -f /var/email/root
rm -f /var/spool/email/root

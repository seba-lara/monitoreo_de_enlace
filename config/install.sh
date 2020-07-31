#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TR=$(traceroute)

while [[ $? != 0 ]];
do
	 rpm -i /root/traceroute-2.0.22-2.el7.x86_64.rpm
done

if [[ $? == 0 ]];
then
	mkdir -p /var/log/monitoreo
	mkdir -p /root/monitoreo
	touch /var/log/monitoreo/traceroute.log
	touch /var/log/monitoreo/uptime.log
	touch /var/log/monitoreo/latency.log

	cp ${DIR}/uptime.sh /root/monitoreo/
	cp ${DIR}/traceroute.sh /root/monitoreo/
	cp ${DIR}/latency.sh /root/monitoreo/
	cp ${DIR}/unistall.sh /root/monitoreo

GREP=$(cat /var/spool/cron/root | grep "* * * * * /root/monitoreo/latency.sh" | grep "* * * * * /root/monitoreo/uptime.sh" )
	if [[ $GREP != 0 ]]; then
	cat ${DIR}/root >> /var/spool/cron/root
	fi

	chmod +x /root/monitoreo/uptime.sh
	chmod +x /root/monitoreo/traceroute.sh
	chmod +x /root/monitoreo/latency.sh
	chmod +x /root/monitoreo/unistall.sh
	rm -f /root/traceroute-2.0.22-2.el7.x86_64.rpm
fi
exit 0

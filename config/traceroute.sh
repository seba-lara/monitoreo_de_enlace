#!/bin/bash
truncate -s 10M /var/log/monitoreo/traceroute.log
#Interfaz activa
#Se comenta la variable INT por bugs en la opcion -i de traceroute
#INT=$(ip -o -br a | grep 192 | awk 'NR == 1 {print $1}')

#Host de destino
TGT=(10.75.40.166)


TR=$(traceroute -m 10 $TGT 2>&1)
echo -e "\e[96m$(date +%F\ %T)\e[0m - $TR" &>> /var/log/monitoreo/traceroute.log
exit 0

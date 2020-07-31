#!/bin/bash
truncate -s 10M /var/log/monitoreo/uptime.log
#Host a pinguear
#TARGET="si-primary"
TARGET=(10.75.40.166)

# archivo log
LOG="/var/log/monitoreo/uptime.log"

# ping de 3 paquetes cada 2 segundos, esperando una respuesta en maximo 3 seg.
PING=$(ping -n -c 3 -i 2 -W 3 $TARGET 2>&1)

if [[ $? != 0 ]]
then
        if [[ $PING =~ "loss" ]]
        then
                # no reply
                ERROR=$(echo "$PING" | grep 'loss')
        else
                # destino unreachable
                ERROR=$PING
        fi
        echo -e "\e[96m$(date +%F\ %T)\e[0m - Check Fallido - $ERROR" &>> $LOG
/root/monitoreo/traceroute.sh
fi

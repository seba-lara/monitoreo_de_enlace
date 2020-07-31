#!/bin/bash
truncate -s 10M /var/log/monitoreo/latency.log
ping -c 4 10.75.40.166 | grep "statistic" -A 1 | tail -n1 >> /var/log/monitoreo/latency.log 2>&1

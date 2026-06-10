#!/bin/bash

LOGFILE="system_health.log"

echo "==================================" >> $LOGFILE
echo "Report Generated: $(date)" >> $LOGFILE
echo "==================================" >> $LOGFILE

echo "CPU Load:" >> $LOGFILE
uptime >> $LOGFILE

echo "" >> $LOGFILE
echo "Memory Usage:" >> $LOGFILE
free -h >> $LOGFILE

echo "" >> $LOGFILE
echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "ALERT: Disk usage above 80%" >> $LOGFILE
fi

echo "" >> $LOGFILE
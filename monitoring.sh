#!/bin/bash

while true; do
  ARCH=$(uname -a)
  CPU_PHYSICAL=$(lscpu | grep "Socket(s):" | awk '{print $2}')
  VCPU=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
  RAM_USAGE=$(free -m | awk 'NR==2{printf "%.0f/%.0fMB (%.2f%%)", $3, $2, $3*100/$2}')
  DISK_USAGE=$(df -BG --output=size,used,pcent / | awk 'NR==2 {printf "%s/%s (%s)\n", $2, $1, $3}')
  CPU_LOAD=$(uptime | awk '{printf "%.1f%%", $(NF-2)}')
  LAST_BOOT=$(who -b | awk '{print $3, $4}')
  LVM_STATUS=$(lsblk | grep "lvm" &> /dev/null && echo "yes" || echo "no")
  TCP_CONNECTIONS=$(ss -tn 2>/dev/null | awk 'NR>1 {print}' | wc -l)
  USER_LOG=$(users | wc -w)
  IP_MAC=$(ip -4 -o addr show | awk '!/^[0-9]*: ?lo/ {print $4 " ("$6")"}')
  SUDO_CMDS=$(journalctl _COMM=sudo | grep -c COMMAND)

  MESSAGE="
#Architecture: $ARCH
#CPU physical : $CPU_PHYSICAL
#vCPU : $VCPU
#Memory Usage: $RAM_USAGE
#Disk Usage: $DISK_USAGE
#CPU load: $CPU_LOAD
#Last boot: $LAST_BOOT
#LVM use: $LVM_STATUS
#Connections TCP : $TCP_CONNECTIONS ESTABLISHED
#User log: $USER_LOG
#Network: IP $IP_MAC
#Sudo : $SUDO_CMDS cmd
"

  echo "$MESSAGE" | wall
  sleep 600
done

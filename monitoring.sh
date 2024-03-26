#!/bin/bash

while true; do
  ARCH=$(uname -m)
  DISTRIBUTION=$(cat /etc/redhat-release | awk '{print $1}')
  VERSION=$(cat /etc/redhat-release | awk '{print $4}')
  KERNEL=$(uname -r)
  CPU_PHYSICAL=$(lscpu | grep "Socket(s):" | awk '{print $2}')
  VCPU=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
  RAM_USAGE=$(free -m | awk 'NR==2{printf "%.0f/%.0fMB (%.2f%%)", $3, $2, $3*100/$2}')
  DISK_USAGE=$(df -BG --output=size,used,pcent / | awk 'NR==2 {printf "%s/%s (%s)\n", $2, $1, $3}')
  CPU_LOAD=$(top -b -n1 | grep "Cpu(s)" | awk '{printf "%.1f%%", $2+$4}')
  LAST_BOOT=$(who -b | awk '{print $3, $4}')
  LVM_STATUS=$(lvs --noheadings -o lv_active LVMGroup 2>/dev/null | head -n 1 | grep -q "active" && echo "yes" || echo "no")
  TCP_CONNECTIONS=$(ss -tn state established '( dport = :ssh or sport = :ssh )' | grep -c -v LISTEN)
  USER_LOG=$(users | wc -w)
  IP_MAC=$(ip -4 -o addr show | awk '!/^[0-9]*: ?lo/ {print $4 " ("$6")"}')
  SUDO_CMDS=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

  MESSAGE="
#Architecture: $DISTRIBUTION $KERNEL $VERSION $ARCH GNU/Linux
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

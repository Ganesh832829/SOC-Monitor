#!/bin/bash

echo "================================"
echo "       LINUX SOC MONITOR"
echo "================================"

echo ""
echo "[1] SYSTEM INFORMATION"
hostname
uname -r

echo ""
echo "[2] CURRENT USER"
whoami
id

echo ""
echo "[3] RUNNING PROCESSES"
ps -eo pid,ppid,user,comm --sort=-%cpu | head -10

echo ""
echo "[4] RUNNING SERVICES"
systemctl list-units --type=service --state=running --no-pager | head -15

echo ""
echo "[5] SUDO GROUP MEMBERS"
getent group sudo

echo ""
echo "[6] CRON JOBS"
crontab -l 2>/dev/null | awk '!/^#/ && NF' || echo "No user cron jobs"

echo ""
echo "======= SCAN COMPLETED ======="

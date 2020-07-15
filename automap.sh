#!/bin/bash
usage() { 
	echo "This script must be run as root" 
	echo -e "\nUsage:\nautomap.sh <Target IP> \n"
}

if [-z $1];
then
	usage
	exit 1
fi

nmap -T4 -sS -oN first-scan.txt $1
echo "Primary Scan Complete"
nmap -sC -sV -oN secondary-scan.txt -oG grep-secondary.txt $1
echo "Secondary Scan Complete"
masscan -p1-65535,U:1-65535 $1 --rate=1000
echo "All Ports Scan Complete"

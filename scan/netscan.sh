#!/bin/bash

masscan $1 --top-ports 100 --rate 1000 -oG network-ports
echo "Hosts Up"
cat network-ports | cut -d " " -f 6 | uniq > hosts-up

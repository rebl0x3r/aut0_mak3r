#!/bin/bash
# made with <3 by @themasterch
clear
read -p "Enter target(IP/DOMAIN): " name
read -p "Enter count of ping requests(4000): " count
read -p "Enter data size(MAX.:65000): " size
read -p "Enter IPv4 or IPv6(4/6): " ip
read -p "Enter interval between every ping(3): " inval

#name=$(dig +short $name | tail -1)

ping -c $count  -s $size -f -n -$ip -i $inval -v $name | grep loss | awk '{print "Website responsed with : " $6 " " $7 " " $8 " and " $10 }' | tr -d ","
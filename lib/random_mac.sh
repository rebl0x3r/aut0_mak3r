#!/bin/bash
export PURPLE="\e[01;35m"
export Z="\e[0m"
export BLUE="\e[01;34m"

if [ $# -eq 0 ]
then
        echo "Please specify an interface:
$0 eth0
$0 wlan0
"
else
        echo -e $PURPLE "Generate random mac address...."
        a1=`cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w 2 | head -n 1`
        a2=`cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w 2 | head -n 1`
        a3=`cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w 2 | head -n 1`
        a4=`cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w 2 | head -n 1`
        a5=`cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w 2 | head -n 1`
        a6=`cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w 2 | head -n 1`

        ifconfig $1 down
        ifconfig $1 hw ether $a1":"$a2":"$a3":"$a4":"$a5":"$a6
        ifconfig $1 up

        echo -e $BLUE "New mac address for ${PURPLE}$1:" $a1":"$a2":"$a3":"$a4":"$a5":"$a6
        echo -e $Z
fi
exit


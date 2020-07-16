#!/bin/bash

# colors

# Reset
rs='\033[m'

# Regular Colors
r='\033[0;31m'
g='\033[0;32m'
y='\033[0;33m'
b='\033[0;34m' 
p='\033[0;35m'
c='\033[0;36m'
w='\033[0;37m'

# Background
or='\033[41m'
og='\033[42m'
oy='\033[43m'
ob='\033[44m'
op='\033[45m'
oc='\033[46m'
ow='\033[47m'

# Bold

bd="\e[1m"

# Path
path=$(pwd)

clear


function phishing {
    clear
    echo -e "${r}[!] ${y}This installation could take a while\n"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to start> "
    read enter
    sleep 1
    echo -e "\n${g}[i] ${b}Installing ${r}hiddeneye${b}...\n"
    sleep 0.5
    pkg install git python php curl openssh grep -y
    git clone -b Termux-Support-Branch https://github.com/DarkSecDevelopers/HiddenEye.git; chmod 777 HiddenEye; cd Hiddeneye; pip install requests; cd ..
    echo -e "\n${g}[i] ${b}Successfully installed hiddeneye.\n"
    echo -e "${g}[i] ${b}To start type: ${r}python HiddenEye.py"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to continue> "
    read enter
    echo -e "\n${g}[i] ${b}Installing ${r}SocialPhish${b}...\n"
    sleep 0.5
    git clone https://github.com/xHak9x/SocialPhish.git; cd SocialPhish; chmod +x socialphish.sh; cd ..
    echo -e "\n${g}[i] ${b}Successfully installed socialphish.\n"
    echo -e "${g}[i] ${b}To start type: ${r}bash socialphish.sh"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to go back> "
    main
}

function bruteforce {
    clear
    echo -e "${r}[!] ${y}This installation could take a while\n"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to start> "
    read enter
    sleep 1
    echo -e "\n${g}[i] ${b}Installing ${r}instainsane${b}...\n"
    sleep 0.5
    git clone https://github.com/permikomnaskaltara/instainsane; cd instainsane; chmod +x instainsane.sh; chmod +x install; bash install.sh
    sleep 1
    echo -e "\n${g}[i] ${b}Successfully installed instainsane.\n"
    echo -e "${g}[i] ${b}To start type: ${r}bash instainsane.sh"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to continue> "
    read enter
    echo -e "\n${g}[i] ${b}Installing ${r}InstaBrute${b}...\n"
    sleep 0.5
    git clone https://github.com/Ha3MrX/InstaBrute.git; apt install tor -y; chmod +x InstaBrute/*
    echo -e "\n${g}[i] ${b}Successfully installed InstaBrute.\n"
    echo -e "${g}[i] ${b}To start type: ${r}bash insta.sh"
    sleep 0.5
    echo -ne "${b}[${r}>${b}] ${p}Press enter to continue> "
    read enter
    echo -e "\n${g}[i] ${b}Installing ${r}PureL0G1Cs Bruter${b}...\n"
    sleep 0.5
    pkg install python; pkg install python-pip; pip install --upgrade pip; git clone https://github.com/Pure-L0G1C/Instagram; cd Instagram; pip3 install -r requirements.txt; cd ..
    echo -e "\n${g}[i] ${b}Successfully installed PureL0G1Cs Bruter.\n"
    echo -e "${g}[i] ${b}To start type: ${r}python3 instagram.py <username> <wordlist> -m 2"
    sleep 0.5
    echo -ne "${b}[${r}>${b}] ${p}Press enter to continue> "
    read enter
    sleep 1
    echo -e "\n${g}[i] ${b}Installing ${r}alkrinsta${b}...\n"
    sleep 0.5
    pkg update; pkg upgrade -y; git clone https://github.com/ALKR-HACKHECKZ/alkrinsta.git
    sleep 1
    echo -e "\n${g}[i] ${b}Successfully installed alkrinsta.\n"
    echo -e "${g}[i] ${b}To start type: ${r}python3 cupp.py -i"
    echo -e "${g}[i] ${b}To start type: ${r}python3 alkrinsta.py"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to go back> "
    main
}


function instaservices {
    clear
    echo -e "${r}[!] ${y}This installation could take a while\n"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to start> "
    read enter
    sleep 1
    echo -e "\n${g}[i] ${b}Installing ${r}instagram-tools${b}...\n"
    sleep 0.5
    pkg install git -y; pkg install nodejs -y; git clone https://github.com/masokky/instagram-tools.git
    sleep 1
    echo -e "\n${g}[i] ${b}Successfully installed instagram-tools.\n"
    echo -e "${g}[i] ${b}To start type: ${r}node index.js"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to continue> "
    read enter
    echo -e "\n${g}[i] ${b}Installing ${r}igtools${b}...\n"
    sleep 0.5
    git clone https://github.com/ikiganteng/bot-igeh.git; cd bot-igeh; unzip node_modules.zip; npm install https://github.com/huttarichard/instagram-private-api; npm audit fix; cd ..
    echo -e "\n${g}[i] ${b}Successfully installed igtools.\n"
    echo -e "${g}[i] ${b}To start type: ${r}ls; node <filename>"
    sleep 1
    echo -ne "${b}[${r}>${b}] ${p}Press enter to go back> "
    main
}


function main {
    echo -e "
${rs}                                                  ${ob}${bd}      ${rs}      
${rs}                                                 ${ob}${bd} |\ |\. ${rs}
${rs}                                                 ${ob}${bd} \ \| | ${rs}
${rs}	                                          ${ob}${bd} \ | | ${rs}
${ob}${bd}   ____         __        ______          __     .--'' / ${rs}  
${ob}${bd}  /  _/__  ___ / /____ _ /_  __/__  ___  / /__  /o     \' ${rs}
${ob}${bd} _/ // _ \(_-</ __/ _ \/  / / / _ \/ _ \/ (_-<  \      /
${ob}${bd}/___/_//_/___/\__/\_,_/  /_/  \___/\___/_/___/  {>o<}='
${ob}${bd}                                               
${or}by @Leakerhounds${rs}      ${op}collection by @BlackFlare${rs}
${oy}Directory:${rs}            ${op}$path${rs}
    
${bd}${b}[${r}1${b}] ${y}Insta-Phishing ${g}    Installing some phishing frameworks${rs}
${bd}${b}[${r}2${b}] ${y}Insta-Bruteforce ${g}  Installing some bruteforce tools${rs}
${bd}${b}[${r}3${b}] ${y}Insta-Services ${g}    Installing instagram manage tools(likes etc.)${rs}
${bd}${b}[${r}4${b}] ${y}Back To Main ${g}      Go back to main menu of tool${rs}
${bd}${b}[${r}5${b}] ${y}Exit ${g}              Quit the Insta Tools tool${rs}
    "

    testt=0
    while [ $testt = 0 ]
    do 
        echo -e "${bd}"
        echo -ne "${r}【 mak3r@root 】${y}/lib/insta.sh ${b}~>:${r} "
        read use
        case "$use" in 
            1)
            phishing
            testt=1
            ;;
            2)
            bruteforce
            testt=1
            ;;
            3)
            instaservices
            testt=1
            ;;
            4)
            if [ -f 4ut0m4t10n.sh ]
            then
                bash 4ut0m4t10n.sh
            elif [ -f 4ut0m4t10n.sh ]
	    then
		cd ..
                bash 4ut0m4t10n.sh
            else
		cd $HOME/aut0_mak3r
		bash 4ut0m4t10n.sh
            fi
            testt=1
            ;;
            5)
            echo -e "${b}[${g}i${b}] ${r}Quitting :-)"
            exit
            testt=1
            ;;
            *)
		    echo '[!] Wrong command!'
		    sleep 1
		    ;;
        esac
    done

}


main



#
# Written By @TheMasterCH
# Special Upload ...:)_
#

#!/bin/bash

path=$(pwd)
backup_window_size="printf '\e[8;24;80t'"
ipaddr=$(curl ifconfig.me)
ipaddr2=$(curl icanhazip.com)

#some colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESTORE="\e[39"
BOLD="\e[1m"
NORMAL="\e[0m"

printf '\e[8;35;100t'

#functions

function main {
	bash 4ut0m4t10n.sh
}

function brackets {
	curl -LO https://github.com/adobe/brackets/releases/download/release-1.14.1/Brackets.Release.1.14.1.64-bit.deb
	apt install ./Brackets.Release.1.14.1.64-bit.deb
	mv -v Brackets.Release.1.14.1.64-bit.deb /tmp
	}
function atom {
	apt install snapd -y
	apt update
	systemctl start snapd.service
	snap install atom --classic
	echo "[*] Atom has been successfully installed."
	sleep 1
	}
function visualcode {
	apt install snapd -y
	apt update
	systemctl start snapd.service
	snap install --classic code
	echo "[*] Visual Code Studio has been successfully installed."
	sleep 1
	}
function bluefish {
	apt-get install bluefish -y
	echo "[*] Bluefish editor has been successfully installed."
	}

function geany {
	apt-get install geany -y
	echo "[*] Geany editor has been installed."
	}





function err_report {
		if exit[1]
		then
			echo -e $RED "Please report all errors to: ${BLUE}https://github.com/ViperZCrew"
			read -p "Do you want to report error?[Y/N]: " rprt
			if [[ $rprt == "y" || $rprt == "Y" ]]
			then 
				firefox https://github.com/ViperZCrew
			else
				err_solver
			fi
		fi
}

function err_solver {
	
	clear
	echo -e "${RED}[!] ${YELLOW}Wrong command..."
	sleep 2
	clear
	bash 4ut0m4t10n.sh
}

function package_installer {
	
	echo -e $BOLD ""
	echo -ne "${CYAN}Tilix... -> "
	sleep 0.5
	if ! hash tilix 2>/dev/null;then
		echo -e $RED "Not installed [✗]"
		apt install tilix -y
	else
		echo -e $GREEN "Installed [✓]"
	fi	
	
	echo -e $BOLD ""
	echo -ne "${CYAN}Python... -> "
	sleep 0.5
	if ! hash python 2>/dev/null;then
		echo -e $RED "Not installed [✗]"
		apt install python -y
	else
		echo -e $GREEN "Installed [✓]"
	fi

	echo -e $BOLD ""
	echo -ne "${CYAN}Nano... -> "
	sleep 0.5
	if ! hash nano 2>/dev/null;then
		echo -e $RED "Not installed [✗]"
		apt install nano -y
	else
		echo -e $GREEN "Installed [✓]"
	fi

	echo -e $BOLD ''	
	echo -ne "${CYAN}Figlet... -> "
	sleep 0.5
	if ! hash figlet 2>/dev/null;then
		echo -e $RED "Not installed [✗]"
		apt install figlet -y
	else
		echo -e $GREEN "Installed [✓]"
	fi

}	

function command_check {

	echo -e "${RED}[*] ${YELLOW}Checking if tool callable..."
	if [ -f /usr/bin/tmaker ]
	then
		echo -e "${GREEN}[*] ${YELLOW}You can call the tool by: ${BLUE}tmaker"
	else
		echo -e "${RED}[*] ${YELLOW}Tool is not callable, adding it...."
		cp -R $path/4ut0m4t10n.sh /usr/bin/tmaker 
		chmod +x /usr/bin/tmaker
		echo -e "${GREEN}[*] ${YELLOW}Done."
		echo -e "${GREEN}[*] ${YELLOW}You can call the tool by: ${BLUE}tmaker"
	fi

}

function pause {
	read -p "$*"
}

function full_config {
	cd $path/lib
	cp -R *.bin /lib/firmware/i915
	chmod a+x *.sh
	chmod a+x proxy.py
	cd ..
	cd openvpn
	chmod a+x openvpn.sh
	cd ..
	clear
	echo -e "${GREEN}Checking root..."
	echo ''
	sleep 1
	if [ "$EUID" -ne 0 ]
	then
		echo -e "${RED}[✗] No root detected >:("
	else
		echo -e "${GREEN}[✓] Root Access :)"
	fi
	clear
	sleep 1.5
	pause 'Press [Enter] to continue to start....'
	clear
	echo -e $YELLOW"[!] Starting package installer.."
	sleep 0.5
	
	package_installer
	echo -e "${CYAN}[!] Configuring your source list."
	sleep 0.7
	clear
	echo -e "${CYAN}[!] Configuring your source list.."
	sleep 0.7
	clear	
	echo -e "${CYAN}[!] Configuring your source list..."
	sleep 0.7
	rm -rf /etc/apt/sources.list
	touch /etc/apt/sources.list
	echo "deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
deb https://deb.torproject.org/torproject.org stretch main
deb-src https://deb.torproject.org/torproject.org stretch main" >> /etc/apt/sources.list
	cound_words=$(wc -l /etc/apt/sources.list | cut -d\  -f 1)
	sleep 1
	echo -e $BLUE"Added ${RED}$cound_words ${BLUE}lines to sources list."
	pause 'Press [Enter] to continue....'
	echo -e $BOLD ""
	echo -e $YELLOW ""
	read -p "[*] Do you want to see the added lines[y/N]? " sl
	if [[ $sl == "y" || $sl == "Y" ]]
	then
		cd lib
		tilix -e bash source.sh
		sleep 0.5
		killp=$(ps aux | grep xterm | head -1  | awk '{print $2}')
		kill -9 $killp 2>/dev/null
		cd ..
	else
		echo ""
		echo -e "${RED}[skiping] ${YELLOW}Ignoring new entries at ${RED}/etc/apt/sources.list..."
		sleep 1
	fi
	echo -e $BOLD ""
	echo -e $RED"[!] Importing kali.org archive key:"
	wget -q -O - https://www.kali.org/archive-key.asc | apt-key add -
	echo -e "${YELLOW}[!] Updating system."
	#apt update
	#apt upgrade -y
	#apt full-upgrade -y
	echo ""
	echo -e "${GREEN}[✓] ${CYAN}Your system has been updated."
	pause 'Press [Enter] to continue....'
	sleep 1
	clear
	echo -e $CYAN ""
	echo -e $BOLD ""
	read -p "Do you want to see your kali linux version[y/N]? " kv
	if [[ $kv == "y" || $kv == "Y" ]]
	then
		vk=$(cat /etc/os-release | grep VERSION= | sed -n 's/[A-Z"=]//g;p')
		clear
		echo -e "${BOLD}"
		echo -e "${GREEN}[*] Your kali version is:${RED} $vk${GREEN}."
	else
		echo -e "${GREEN}[✓] ${CYAN}Done!"
		pause 'Press [Enter] to continue....'
	fi
	dpkg --add-architecture i386
	sleep 1
	echo -e $MAGENTA ""
	read -p "[*] Do you want install packages[y/N]? " pck
	if [[ $pck == "y" || $pck == "Y" ]]
	then
		echo -e "[~] ${GREEN}Installing new packages, get something to drink and relax.."
		apt install firmware-misc-nonfree firmware-netxen firmware-realtek python3 python3-* tor tor-arm torbrowser-launcher proxychains filezilla* software-center gdebi geany neofetch git bettercap urlsnarf ngrep awk curl mdk3 mdk4 bc cowpatty php-cgi php apache2 libssl-dev gpa gnupg2 net-tools wget postfix libncurses5 libxml2 tcpdump libexiv2-dev build-essential python-xmpp python-pip ssh ssh-tools htop stacer bleachbit leafpad snapd yersinia cmake make g++ gcc libidevicemobile openssh-server openssl screen wapiti whatweb nmap golismero host wget uniscan wafw00f dirb davtest theharvester xsser dnsrecon fierce dnswalk whois sslyze lbd dnsenum dmitry davtest nikto dnsmap netcat gvfs gvfs-common gvfs-daemons gvfs-libs gconf-service gconf2 gconf2-common gvfs-bin psmisc filezilla filezilla-common gdebi vlc firmware-misc-nonfree firmware-netxen firmware-realtek speedtest speedtest-cli apktool maven default-jdk default-jre openjdk-8-jdk openjdk-8-jrezlib1g-dev libncurses5-dev lib32z1 lib32ncurses6 -y
		sed -i s/geteuid/getppid/g /usr/bin/vlc
		clear
		echo -e $GREEN "[✓] ${CYAN}Packages has been successfully installed."
		sleep 2
		clear
		echo ''
		echo -e $BOLD "${BLUE}
Kali linux has some metapackages, means it installs particular stuff you maybe need, i will list some options which you can choose to countinue.		
		
${RED}[> kl <] -:- ${YELLOW}Kali linux metapackage includes various network service such as apache and ssh, the kernel of kali and many updated versions. [1,5 GB]
		
${RED}[> kf <] -:- ${YELLOW}Kali Forensic is perfectly for forensic works. This resource contains forensic tools. [3,1 GB]		
		
${RED}[> kp <] -:- ${YELLOW}Kali linux password tools contains over 40 different password cracking utilities. [6,0 GB]

${RED}[> kr <] -:- ${YELLOW}Kali rfid tools are for users who are doing research and exploitation. [1,5 GB]
		
${RED}[> ks <] -:- ${YELLOW}Kali SDR tools contains large collection of software defined radios tools. [2,4 GB]

${RED}[> kv <] -:- ${YELLOW}Kali voice over ip tools are for people doing voip testing and research. [1,8 GB]

${RED}[> kw <] -:- ${YELLOW}Kali web application tools includes tools for web application hacking. [4,9 GB]

${RED}[> ki <] -:- ${YELLOW}Kali wireless includes tools targeted towards wireless networks. [6,6 GB]

${RED}[> menu <] -:- ${YELLOW}Skipping this and go back to menu.
"

		echo -e "${MAGENTA}"
		printf "【 mak3r@root 】${YELLOW}>/full_config ~>:${GREEN}  " 
		read mp
		if [[ $mp == "kl" ]]; then
			apt install kali-linux -y
		else
			err_solver
		fi
		
		if [[ $mp == "kf" ]]; then
			apt install kali-linux-forensic -y
		else
			echo ''
		fi
				
		if [[ $mp == "kp" ]]; then		
			apt install kali-linux-pwtools -y	
		else
			echo ''
		fi
		
		if [[ $mp == "kr" ]]; then		
		
			apt install kali-linux-rfid -y
		else
			echo ''
		fi
		
		if [[ $mp == "ks" ]]; then
			apt install kali-linux-sdr -y
		else
			echo ''
		fi
		
		if [[ $mp == "kv" ]]; then		
			apt install kali-linux-voip -y
		else
			echo ''
		fi
		
		if [[ $mp == "kw" ]]; then
			apt install kali-linux-web -y
		else
			echo ''
		fi
		
		if [[ $mp == "ki" ]]; then		
			apt install kali-linux-wireless -y
		else
			echo ''
		fi
		
		if [[ $mp == "menu" ]]; then
			clear
			pause 'Press [Enter] to continue....'
			echo -e "${GREEN}[~] ${RED}Skipping.."
			sleep 0.5
			clear
			echo -e "${GREEN}[~] ${RED}Skipping...."
			sleep 0.5
			clear
			echo -e "${GREEN}[~] ${RED}Skipping."
			sleep 0.5
			clear
			echo -e "${GREEN}[~] ${RED}Skipping..."
			
		else
			echo -e $RED "[!] ${YELLOW}Some packages can not be installed."
		fi
	else
		echo -e $RED"[!] ${YELLOW}Skipping."
	fi	
	sleep 1.5
	clear
	printf "${RED}[*] ${YELLOW}Do you want to make a update command in one[Y/N]? "	
	read upd
	if [[ $upd == "y" || $upd == "Y" ]]
	then
		echo ""
		printf "${RED}[?] ${YELLOW}Name of command: "
		read updd
		echo "
function $updd {

	apt-get update &&
	apt-get dist-upgrade -y &&
	apt-get autoremove -y &&
	apt-get autoclean &&
	apt-get clean &&
	reboot
	}" >> /root/.bashrc
		echo -e "${RED}[!] ${BLUE}Type ${RED}$updd ${BLUE}to make a full update for your kali linux."
		echo -e "${MAGENTA}[!] ${RED}To see changes, close terminal and start terminal again!"
		clear
	else
		echo -e $BOLD ""
		clear
	fi
	printf "${RED}[*] ${YELLOW}Do you want to install tor browser[Y/N]? "
	read tr
	if [[ $tr == "y" || $tr == "Y" ]]
	then
		echo -e "${RED}[*] ${YELLOW}Installing Tor Browser.."
		sleep 0.5
		clear
		echo -e "${RED}[*] ${YELLOW}Installing Tor Browser..."
		sleep 0.5
		clear
		echo -e "${RED}[*] ${YELLOW}Installing Tor Browser...."
		sleep 0.5
		clear
		echo -e "${RED}[*] ${YELLOW}Installing Tor Browser.."
		sleep 1.5
		clear
		echo -e "${RED}[✓] ${GREEN}Repositories already exists in file."
		echo -e "${RED}[*] ${YELLOW}Adding key."
		wget -O- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
		echo -e "${RED}[*] ${YELLOW}Updating & Configurate changes."
		apt update
		apt-get install tor torbrowser-launcher deb.torproject.org-keyring -y
		echo -e "${GREEN}[✓] ${CYAN}Done!."
		pause 'Press [Enter] to continue....'
		clear
		read -p "Do you want to start tor browser[Y/N]? " str
		if [[ $str == "y" || $str == "Y" ]]
		then
			cd /root/Downloads
			curl -LO https://dist.torproject.org/torbrowser/9.0.5/tor-browser-linux32-9.0.5_en-US.tar.xz
			tar -xvf tor-browser-linux32-9.0.5_en-US.tar.xz
			cd tor-browser_en-US
			chmod +rwx start-tor-browser.desktop
			cd Browser
			echo -e "${RED}[*] ${YELLOW}Remove line 94-98, save and exit it."
			sleep 2.5
			gedit start-tor-browser
			./start-tor-browser
			pause 'Press [Enter] to continue....'
		else
			echo -e "${GREEN}[~] ${RED}Skipping.."
			sleep 0.5
			clear
			echo -e "${GREEN}[~] ${RED}Skipping...."
			sleep 0.5
			clear
			echo -e "${GREEN}[~] ${RED}Skipping."
			sleep 0.5
			clear
			echo -e "${GREEN}[~] ${RED}Skipping..."
			clear
	
		fi
	else
		echo -e "${GREEN}[~] ${RED}Skipping.."
		sleep 0.5
		clear
		echo -e "${GREEN}[~] ${RED}Skipping...."
		sleep 0.5
		clear
		echo -e "${GREEN}[~] ${RED}Skipping."
		sleep 0.5
		clear
		echo -e "${GREEN}[~] ${RED}Skipping..."
		pause 'Press [Enter] to continue....'
		clear
	fi	
	echo -e "${YELLOW}[*] ${BLUE}Adding secure DNS server in /etc/resolv.conf."
	clear 
	echo -e "${RED}[*] ${YELLOW}Listing your currently dns server:(ignoring comments)"
	cat /etc/resolv.conf | sed '/#/d'
	sleep 1
	read -p "[?] Backup resolv.conf file[Y/N]?: " bck
	if [[ $bck == "y" || $bck == "Y" ]]
	then
		echo -e "${BLUE}[*] ${GREEN}Backuping original file..."
		sleep 0.2
		cp -R /etc/resolv.conf $path/backup

	else
		echo -e "${GREEN}[~] ${RED}Skipping.."
		sleep 0.5
		clear
		echo -e "${GREEN}[~] ${RED}Skipping...."
		sleep 0.5
		clear
		echo -e "${GREEN}[~] ${RED}Skipping."
		sleep 0.5
		clear
		echo -e "${GREEN}[~] ${RED}Skipping..."
		pause 'Press [Enter] to continue....'
		clear
	fi
	pause 'Press [Enter] to continue..'
	sleep 0.5
	printf "${MAGENTA}[*] ${GREEN}Anonymous DNS, Fast DNS or Quit(skip)[A/F/Q]?: "
	read dns
	if [[ $dns == "A" || $dns == "A" ]]
	then
		clear
		echo -e "${BLUE}"
		figlet An0nM0de
		sleep 1
		echo -e "${RED}[!] ${MAGENTA}Adding following IP address to your DNS list: "
		sleep 0.5
		cat lib/anon_dns.txt | sed -r '/#/d'
		rm -rf /etc/resolv.conf 
		cat lib/anon_dns.txt 2>/dev/null | tail -n2 >> /etc/resolv.conf
		sleep 0.8
		echo -e "${GREEN}[*] ${MAGENTA}Done."
		pause 'Press [Enter] continue.'

	elif [[ $dns == "f" || $dns == "F" ]]		
	then
		clear 
		echo -e "${BLUE}"
		figlet F4stM0de
		sleep 1
		echo -e "${RED}[!] ${MAGENTA}Adding following IP address to your DNS list: "
		sleep 0.5
		cat lib/fast_dns.txt | sed -r '/#/d'
		#sed -r '1,2 s/#/\r/' 
		rm -rf /etc/resolv.conf
		cat lib/fast_dns.txt 2>/dev/null | tail -n2 >> /etc/resolv.conf
		sleep 0.8
		echo -e "${GREEN}[*] ${MAGENTA}Done."
		pause 'Press [Enter] continue.'
	else
		echo -e "${GREEN}[*] ${MAGENTA} Skipping."
	fi
	clear
	echo -e "${GREEN}[*]${BLUE}Do you want to generate a password for your own security?[Y/N]?: "
	read pwdg
	if [[ $pwdg == "y" || $pwdg == "Y" ]]
	then
		bash lib/pwd.sh
	fi
	printf 'Do you want to configure an openvpn account?[y/N]'
	read ovpn
	if [[ $ovpn == "y" || $ovpn == "Y" ]]
	then
		echo -e "${RED}[*]${YELLOW}Getting credentials..."
		sleep 1.2
		echo -e "${GREEN}[*] ${YELLOW}Successfully got credentials."
		echo -e "${RED}[*] ${YELLOW}Your username is: ${GREEN}${username}"
		echo -e "${RED}[*] ${YELLOW}Your password is: ${GREEN}${password}"
		echo -e $GREEN ""
		read -p "[?] Do you want to make an ovpn account now?[Y/N]: " moa
		if [[ $moa == "y" || $moa == "Y" ]]
		then
			if [ -d $path/openvpn ]
			then 
				cd openvpn
				wget https://freevpnme.b-cdn.net/FreeVPN.me-OpenVPN-Bundle-January-2020.zip
				unzip FreeVPN.me-OpenVPN-Bundle-January-2020.zip
				rm FreeVPN.me-OpenVPN-Bundle-January-2020.zip
				find -iname \*.* | rename -v "s/ /-/g" 2>/dev/null
				xterm -e bash openvpn.sh
			else
				mkdir openvpn
				cd openvpn
				wget https://freevpnme.b-cdn.net/FreeVPN.me-OpenVPN-Bundle-January-2020.zip
				unzip FreeVPN.me-OpenVPN-Bundle-January-2020.zip
				rm FreeVPN.me-OpenVPN-Bundle-January-2020.zip
				find -iname \*.* | rename -v "s/ /-/g" 2>/dev/null
				xterm -e bash openvpn.sh
			fi
		fi
		clear
		#xterm -e cd openvpn; bash openvpn.sh&
	else
		echo -e "${RED}[!] ${BLUE}Skipping..."
		#err_solver
	fi
	clear
	r=0
	while [ $r = 0 ]
		do
		echo -e "
- - 	Brackets	- -
		
- -	Atom 		- -

- -	Visual Code	- -

- -	Geany		- -

- -	Bluefish 	- -

- - 	Quit 		- -

${RED}Type the editor name in windows in lowercase letters.			
		"
		echo -ne "[?] Which linux code editor you would use?: "
		read name
		case "$name" in
			brackets)
			brackets
			r=1
			;;
			atom)
			atom
			r=1
			;;
			visualcode)
			visualcode
			r=1
			;;
			bluefish)
			bluefish
			r=1
			;;
			geany)
			geany
			r=1
			;;
			quit)
			echo "[!] skipping."
			r=1
			;;
			*)
			echo '[!] Wrong command!'
			sleep 1
			r=0
			;;
		esac
	done
	clear
	echo -e $RED "[*] ${YELLOW}Loading some other configurating options..."
	sleep 2
	clear
	echo -ne $RED"[?] ${MAGENTA}Do you want to install an ISO burner[Y/N]?: "
	read etch
	if [[ $etch == "Y" || $etch == "y" ]]
	then
		clear
		cd /root/Downloads
		curl -LO https://github.com/balena-io/etcher/releases/download/v1.5.80/balena-etcher-electron-1.5.80-linux-x64.zip
		unzip balena-etcher-electron-1.5.80-linux-x64.zip
		rm balena-etcher-electron-1.5.80-linux-x64.zip
		if [ -f /usr/bin/iso-burner ]
		then
			clear
			echo -e "${GREEN}[*] ${MAGENTA}File already exists."
		else
			clear
			echo -e "${RED}[!] ${MAGENTA}File not exists, will doing it for you."
			cd /root/Downloads
			mv -v balenaEtcher-1.5.80-x64.AppImage iso-burner &>/dev/null
			mv -v iso-burner /usr/bin &>/dev/null
		fi
		clear
		echo -e "${GREEN}[*] ${BLUE}You have successfully installed balena etcher."
		echo -e "${GREEN}[*] ${BLUE}To run this tool type ${RED}iso-burner ${BLUE}do not remove the file from /usr/bin."
	fi
	echo -e "${RED}[!] ${CYAN}Testing your internet speed right now..."
	sleep 2
	cd $path/lib
	speedtest-cli >> results.txt
	echo -ne "${GREEN}[*] ${MAGENTA}Your provider is: "
	cat results.txt | grep from | awk '{print $3 " " $4 " " $5}'
	sleep 0.5
	echo -ne "${GREEN}[*] ${MAGENTA}Your ms/ping is: "
	head -n5 results.txt | tail -1 | awk 'NF>1{print $8, $NF}'
	sleep 0.5
	echo -ne "${GREEN}[*] ${MAGENTA}Your download speed is: "
	cat results.txt | grep Download | awk '{print $2, $3}'
	sleep 0.5
	echo -ne "${GREEN}[*] ${MAGENTA}Your upload speed is:"
	cat results.txt | grep Upload | awk '{print $2, $3}'
	sleep 1
	echo -e "${RED}[!] ${BLUE}Your original IP is: ${YELLOW}$ipaddr"
	echo -ne "${GREEN}[*] ${MAGENTA}Your current IP address is : "
	curl ifconfig.me
	echo ""
	echo -e "${GREEN}[✓] ${YELLOW}Configuring successfully."

	sleep 1.5
	cd $path
	pause 'Press [Enter] to exit'
}

function install_tools {
	clear
	figlet th3_T00Lz
	echo ""
	echo ""
	echo -e "
${RED}[1] ${MAGENTA}Information Gathering			${BLUE}[6] ${MAGENTA}Website Tools
${YELLOW}[2] ${MAGENTA}WiFi Hacking				${YELLOW}[7] ${MAGENTA}Random Tools 
${GREEN}[3] ${MAGENTA}Phishing Tools			   	${GREEN}[8] ${MAGENTA}Tools Collection
${YELLOW}[4] ${MAGENTA}Bruteforcer & Password Tools 		${RED}[9] ${MAGENTA}Bomber - SMS - E-Mail
${BLUE}[5] ${MAGENTA}DDoS Tools
	"
	
	printf "${YELLOW}[*] ${GREEN}Select category: "
	read catg
	
	################################
	# 							   #
	# Functions for all categories #
	#							   #
	################################
	
	function infogath {
		echo -e "${Green}[*] ${CYAN}Listing some information gathering tools: "
		echo "
		${YELLOW}[2] ${CYAN}FBI - Facebook Information Grabs Private Information Of Target.
		${YELLOW}[3] ${CYAN}Sherlock - Hunts Down Username On Over 30 Different Platforms With Same Name.
		${YELLOW}[4] ${CYAN}Th3Inspector - It A Basic Tool For Gathering Information Of Websites.
		${YELLOW}[5] ${CYAN}Photon - Incredibly Fast Crawler Designed For OSINT.
		${YELLOW}[6] ${CYAN}theHarvester - Doing OSINT To Crawl Emails, Names, Domains, IPs.
		${YELLOW}[7] ${CYAN}Back To Menu
		
		"
		
		printf "${RED}【 mak3r@root 】 ${YELLOW}/install_tools/information_gathering/${BLUE}~>: "
		read inf
		
		function fbi {
			echo -e "${GREEN}[*] ${BLUE}Installing tool.."
			cd /opt
			git clone https://github.com/xHak9x/fbi
			cd fbi
			pip2 install -r requirements.txt
			clear
			echo "alias fbi='python2 /opt/fbi/fbi.py'" >> /root/.bashrc
			echo -e "${GREEN}[*] ${YELLOW}Successfully installed, to use tool restart terminal."
			echo -e "${GREEN}[*] ${YELLOW}To start tool type: fbi"
			}
		
		function sherlock {
			echo -e "${GREEN}[*] ${BLUE}Installing tool.."
			cd /opt
			git clone https://github.com/sherlock-project/sherlock.git
			cd sherlock
			python3 -m pip install -r requirements.txt
			clear
			echo "alias sherlock='python3 /opt/sherlock/sherlock.py'" >> /root/.bashrc
			echo -e "${GREEN}[*] ${YELLOW}Successfully installed, to use tool restart terminal."
			echo -e "${GREEN}[*] ${YELLOW}To start tool type: sherlock <username>"
			}
			
		function inspector {
			echo -e "${GREEN}[*] ${BLUE}Installing tool.."
			cd /opt
			git clone https://github.com/Moham3dRiahi/Th3inspector.git
			cd Th3inspector
			chmod +x install.sh && ./install.sh
			clear
			echo "alias theinspector='perl /opt/Th3inspector/Th3inspector.pl'" >> /root/.bashrc
			echo -e "${GREEN}[*] ${YELLOW}Successfully installed, to use tool restart terminal."
			echo -e "${GREEN}[*] ${YELLOW}To start tool type: theinspector"
			}
			
		function photon {
			echo -e "${GREEN}[*] ${BLUE}Installing tool.."
			cd /opt
			git clone https://github.com/s0md3v/Photon.git
			cd Photon
			python3 -m pip install -r requirements.txt
			clear
			echo "alias photon='python3 /opt/Photon/photon.py'" >> /root/.bashrc
			echo -e "${GREEN}[*] ${YELLOW}Successfully installed, to use tool restart terminal."
			echo -e "${GREEN}[*] ${YELLOW}To start tool type: photon -u <url>"			
			}
			
		function harvester {
			echo -e "${GREEN}[*] ${BLUE}Installing tool.."
			apt-get install theharvester -y
			clear
			echo -e "${GREEN}[*] ${YELLOW}Successfully installed, to use tool restart terminal."
			echo -e "${GREEN}[*] ${YELLOW}To start tool type: theharvester"
			}
		
		}
	
	function wifihack {
		echo ""
		}
	
	function phishtool {
		echo ""
		}
	
	function ddostool {
		echo ""
		}
	
	function websitetool {
		echo ""
		}
		
	function randmontool {
		echo ""
		}	

	function toolcoll {
		echo ""
		}
	
	function bombtool {
		echo ""
		}

	#this tools are coming soon.

}

function social_media {
	clear
	echo "
	[1] Telegram
	[2] IRC
	
	
	"
	
	
	printf "${RED}【 mak3r@root 】 ${YELLOW}/social_media ${BLUE}~>: "
	read sm

}
function tt {
	clear
	termux_tools
}
function termux_tools {

	clear
	figlet TermuXT00Ls
	echo -e "
${RED}[1] ${YELLOW}Updating System
${RED}[2] ${YELLOW}Installing Packages
${RED}[3] ${YELLOW}Mobile Pentesting
${RED}[4] ${YELLOW}Custom PS1 (mrblackx's special)
${RED}[menu] ${YELLOW}Back To Main Menu
	"

	function update_ter {
		clear
		echo -e "${GREEN}[*] ${YELLOW}Installing updates, hold on.."
		apt update
		apt upgrade -y
		pkg upgrade -y
		echo "${GREEN}[*] ${YELLOW}Done."
		pause 'Press [ENTER] to go back'
		termux_tools
	}

	function install_pck {
		clear
		echo -e "${GREEN}[*] ${YELLOW}Installing Termux packages, hold on.."
		sleep 1
		chmod +x $path/lib/installer.sh
		bash $path/lib/installer.sh
		echo -e "${RED}[!] ${YELLOW}Please run the update for termux, some packages has been added, an update is required!(choose 1 in the menu)"
		sleep 1.5
		echo -e "${GREEN}[*] ${YELLOW}Done."
		sleep 1
		pause 'press [ENTER] to continue'
		termux_tools
}

function mobile_pt {
	clear
	figlet M0biL3_penT3st
	echo -e "
${RED}[1] ${YELLOW}Instagram Collection ${GREEN}<--> ${BLUE}Installing Instagram Tools
${RED}[2] ${YELLOW}Website Collection   ${GREEN}<--> ${BLUE}Installing Website Tools
${RED}[3] ${YELLOW}Facebook Collection	 ${GREEN}<--> ${BLUE}Installing Facebook Tools
${RED}[4] ${YELLOW}DDoS Downloader	 ${GREEN}<--> ${BLUE}Installing A DDoS Downloader Tool(Linux/Termux)
${RED}[5] ${YELLOW}Metasploit		 ${GREEN}<--> ${BLUE}Installing Metasploit Framework
${RED}[6] ${YELLOW}Framework Collection ${GREEN}<--> ${BLUE}Installing Some Frameworks
${RED}[back] ${YELLOW}Back To Termux Tools 
	"
	#back = tt
	
	}
function custom_term {
	echo -e "${RED}[*] ${YELLOW}Customizing your terminal in thoughts to mrblackx..."
	sleep 1
	echo -ne "${GREEN}[*] ${YELLOW}Enter your name-: "
	read name
	echo -e "${GREEN}[*] ${BLUE}Doing the work...."
	sleep 2
	cd ..
	cd usr/etc
	cp -R bash.bashrc $path/backup
	echo 'PS1="\n\e[32mCurrent Directory: \e[35m\w/\n\e[31;1;40mroot\e[37;0;40m@\e[36;1;40m$name~: ' >> bash.bashrc
	clear
	echo -e "${GREEN}[*] ${YELLOW}Please restart your terminal."
	echo -e "${GREEN}[*] ${BLUE}To restore the default termux, type:${YELLOW}mv -v $path/backup/bash.bashrc /data/data/com.termux/file/usr/etc/bash.bashrc "
	pause 'press [ENTER] to go back'
	termux_tools
	}



	while tt=0
	do
		echo -ne "${RED}【 mak3r@root 】 ${YELLOW}/termux_tools ${BLUE}~>: "
		read termt
		case "$termt" in
			1)
			update_ter
			tt=1
			;;
			2)
			install_pck
			tt=1
			;;
			3)
			mobile_pt
			tt=1
			;;
			4)
			custom_term
			tt=1
			;;
			menu)
			main
			tt=1
			;;
			*)
			echo '[!] Wrong command!'
			sleep 1
			;;
		esac
	done
}

function quit {	
	clear
	echo -e "${RED}[*] ${YELLOW} Pre-setting options."
	pause 'Press [Enter] to continue....'
	echo -e "${RED}[*] ${CYAN}Quitting.."
	sleep 0.5
	clear
	echo -e "${RED}[*] ${CYAN}Quitting..."
	sleep 0.5
	clear
	echo -e "${RED}[*] ${CYAN}Quitting...."
	sleep 0.5
	clear
	echo -e "${RED}[*] ${CYAN}Quitting.."
	sleep 0.5
	clear
	echo -e "${RED}[*] ${CYAN}Quitting..."
	sleep 0.5
	clear
	exit
	echo -e "${RED}[!] ${BLUE}Wrong command. Quitting."
}


#banner

clear
sleep 0.5
echo -e $BLUE "

Welcome To

████████╗██╗  ██╗███████╗ ███▄ ▄███▓ ▄▄▄       ██ ▄█▀▓█████  ██▀███  
╚══██╔══╝██║  ██║██╔════╝ ▓██▒▀█▀ ██▒▒████▄     ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒
   ██║   ███████║█████╗   ▓██    ▓██░▒██  ▀█▄  ▓███▄░ ▒███   ▓██ ░▄█ ▒
   ██║   ██╔══██║██╔══╝   ▒██    ▒██ ░██▄▄▄▄██ ▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄ 
   ██║   ██║  ██║███████╗ ▒██▒   ░██▒ ▓█   ▓██▒▒██▒ █▄░▒████▒░██▓ ▒██▒
   ╚═╝   ╚═╝  ╚═╝╚══════╝  
"

echo -e $MAGENTA"${BOLD}The Automatic Configure Script For Kali Linux.   "
echo ""
echo -e $RED"Version		: v0.1"
echo ""
echo -e $GREEN"Tools		: 4"
echo ""
echo -e $MAGENTA"Creator		: MrBlackX"
echo ""
echo -e $BLUE"Telegram 	: @Rebl0x3r"
echo ""
command_check
echo -e "${RED}[!] ${YELLOW}Directory of The makeR: ${MAGENTA}${path}."
echo ""
sleep 0.5
printf "${RED}[> full_config <] ${YELLOW}   Starting to configure your kali linux for hacking."
echo ""
sleep 0.5
printf "${RED}[> install_tools <] ${YELLOW} Lists you a list of tools that are recommend to install."
echo ""
sleep 0.5
printf "${RED}[> social_media <] ${YELLOW}  Lists you a list of social media that can be installed."
echo ""
sleep 0.5
printf "${RED}[> termux_tools <] ${YELLOW}  Termux section for mobile users."
echo ""
sleep 0.5
printf "${RED}[> credits <] ${YELLOW}       Lists credits & contact."
echo ""
sleep 0.5
printf "${RED}[> quit <] ${YELLOW}          Leaving(press q to quit)."
echo ""
echo ""
echo -e $BLUE ""



#main 

x=0
while [ $x = 0 ]
do
	echo -ne '【 mak3r@root 】~>: '
	read ex
	case "$ex" in
		full_config)
		full_config
		x=1
		;;
		install_tools)
		echo -e "${RED}[!] ${BLUE}Sorry this is under process."
		x=1
		;;
		social_media)
		social_media
		x=1
		;;
		termux_tools)
		termux_tools
		x=1
		;;
		credits)
		credits
		x=1
		;;
		quit)
		quit
		x=1
		;;
		q)
		x=1
		echo 'Exiting..'
		sleep 0.5
		;;
		*)
		echo '[!] Wrong command!'
		sleep 1
		;;
	esac
done

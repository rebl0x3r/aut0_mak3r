path=$(pwd)

function NL {
	cd ..
	cd openvpn/1---FreeVPN.me---NL
	clear
	echo -e $BLUE "Username : $username"
	echo -e $BLUE "Password : $password"
	sleep 1
	openvpn --config FreeVPN.me-UDP-40000.ovpn
}

function FR {
	cd ..
	cd openvpn/2----FreeVPN.se---FR
	clear
	echo -e $BLUE "Username : $username"
	echo -e $BLUE "Password : $password"
	sleep 1
	openvpn --config FreeVPN.se-UDP-40000.ovpn
}

function FR2 {
	cd ..
	cd openvpn/3---FreeVPN.im---FR
	clear
	echo -e $BLUE "Username : $username"
	echo -e $BLUE "Password : $password"
	sleep 1
	openvpn --config FreeVPN.im-UDP-40000.ovpn
}

function FR3 {
	cd ..
	cd openvpn/4---FreeVPN.it---FR
	clear
	echo -e $BLUE "Username : $username"
	echo -e $BLUE "Password : $password"
	sleep 1
	openvpn --config FreeVPN.it-UDP-40000.ovpn
}

function PL {
	cd ..
	cd openvpn/5---FreeVPN.be---PL
	clear
	echo -e $BLUE "Username : $username"
	echo -e $BLUE "Password : $password"
	sleep 1
	openvpn --config FreeVPN.be-UDP-40000.ovpn
}

function DE {
	cd ..
	cd openvpn/6---FreeVPN.co.uk---DE
	clear
	echo -e $BLUE "Username : $username"
	echo -e $BLUE "Password : $password"
	sleep 1
	openvpn --config FreeVPN.co.uk-UDP-40000.ovpn
}

username="freevpn.me"
RED="\e[31m"
BLUE="\e[34m"
curl https://freevpn.me/accounts/ 2> /dev/null | egrep -Eio ">OpenVPN</h3>.*" | egrep -Eio "Username.*?</li><li><b>Unlimited</b>" | awk '{print $2"\n"$3}' | cut -d'<' -f1 > pass.txt
password=$(cat pass.txt | tail -1)

clear
echo -e $RED "Available countries:"
echo -e $RED ""
echo -e "
Netherlands 	[NL]
France 		[FR]
France2 	[FR2]
France3 	[FR3]
Poland		[PL]
Germany		[DE]		
"
read -p "[-] Select an country: " ac
a=0
while [ $a = 0 ]
do
	case "$ac" in
		NL)
		NL 
		a=1
		;;
		FR)
		FR
		a=1
		;;
		FR2)
		FR2
		a=1
		;;
		FR3)
		FR3
		a=1
		;;
		PL)
		PL
		a=1
		;;
		DE)
		DE
		a=1
		;;
		*)
		echo '[!] Wrong command!'
		sleep 1
		;;
	esac
done

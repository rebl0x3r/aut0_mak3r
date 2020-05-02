echo "Do you want to generate a password[Y/N]?: "
read pwdg
if [[ $pwdg == "Y" || $pwdg == "y" ]]
then
	echo "This is a simple password generator"
	echo "[*] Enter length of password: "
	read PWDL
	x=0
	while [ $x = 0 ]
	do
		clear
		echo "[?] Save or Exit [S/E]"
		read answer
		case "$answer" in
			S)
			echo "[!] Saving selected."
			for p in $(seq 1);
			do
				openssl rand -base64 48 | cut -c1-$PWDL >> lib/pwd.txt
			done
			echo "[+] Password saved at: lib/pwd.txt"
			x=1
			;;
			s)
			echo "[!] Saving selected."
			for p in $(seq 1);
			do
				openssl rand -base64 48 | cut -c1-$PWDL >> lib/pwd.txt
			done
			echo "[+] Password saved at: lib/pwd.txt"
			x=1
			;;
			E)
			for p in $(seq 1);
			do
				openssl rand -base64 48 | cut -c1-$PWDL
			done
			sleep 2
			echo "[!] Exiting..."
			x=1
			;;
			e)
			for p in $(seq 1);
			do
				openssl rand -base64 48 | cut -c1-$PWDL
			done
			sleep 2
			echo "[!] Exiting..."
			x=1
			;;
			*)
			echo "[-] Invalid Option.."
			sleep 0.5
			;;
		esac
	done		
fi


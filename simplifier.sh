#!/bin/sh
cyan='\e[1;36m'
green='\033[92m'
red='\e[1;31m'


	
main_menu () {

	toilet --metal -f smblock Simplifier
	echo  $cyan"1: Scanning"
	echo  $green"2: Brute Force "
	echo  $cyan
	read -p "User~#: " choice
}

finished=false
while [ $finished = false ]
do
	main_menu

	if [ $choice = "1" ] 
	then
		figlet "Nmap"
		read -p " IP or Range " ip
		nmap -v $ip
		read -p " Main Menu? [Y/n] " main
		if [ $main = 'y' ] || [ $main = 'Y' ]
		then
			main_menu
		else 
			finished=true
			
		fi

	fi

	if [ $choice = "2" ]
	then
		echo $green
		figlet "Bruteforce"
		read -p " Hydra or Medusa " brute
		if [ $brute = "Hydra" ] || [ $brute = "hydra" ]
		then
			figlet "Hydra"
			read -p " Enter username or path to username list: " user
			read -p " Enter password or path to password list: " pass
			read -p " Enter target IP Address or Range: " range
			read -p " Enter protocol: " protocol
			hydra -L $user -P $pass $range $protocol 
			read -p " Main Menu? [Y/n] " main
			if [ $main = 'y' ] || [ $main = 'Y' ]
			then
				main_menu
			else
				finished=true
			fi

		else
			figlet "Medusa"
			read -p " Enter username or path to username list: " user
			read -p " Enter password or path to password list: " pass
			read -p " Enter target IP Address or Range " range
			read -p " Enter protocol: " protocol
			medusa -h $range -U $user -P $pass -M $protocol 
			read -p " Main Menu? [Y/n] " main
			if [ $main = 'y' ] || [ $main = 'Y' ]
			then
				main_menu
			else
				finished=true
			fi
		fi
	fi
done


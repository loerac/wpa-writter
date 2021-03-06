#!/bin/bash

# Takes in two arguements; name of SSID and the password
ssid="\"$1\""
password="\"$2\""

if [ "$3" != "" ]; then
	if [ "$4" != "" ]; then
		type=${3:1}
		name="\"$4\""
		if [ "$type" == "u" ]; then
			## In order to echo anything to the wpa_supplicant.conf file, you'll need sudo
			## the 'sudo tee -a ' will append the the end of the file with permission
			echo "" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
			echo "network={" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf

			# '-e ' \t'' is used to add a tab space
			echo -e ' \t'ssid=$ssid | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'priority=1 | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'proto=RSN | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'key_mgmt=WPA-EAP | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'pairwise=CCMP | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'auth_alg=OPEN | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'eap=PEAP | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'identity=$name | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'password=$password | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf > /dev/null
			echo -e ' \t'password=NULL
			echo -e ' \t'phase1=\"peaplabel=0\" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
			echo -e ' \t'phase2=\"auth=MSCHAPV2\" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
		else
			echo "Error: no command found for $type"
			exit 1
		fi
	else
		echo "Error: need username"
		exit 1
	fi
else
	## In order to echo anything to the wpa_supplicant.conf file, you'll need sudo
	## the 'sudo tee -a ' will append the the end of the file with permission
	echo "" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
	echo "network={" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'ssid=$ssid | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'psk=$password | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf > /dev/null
	echo -e ' \t'password=NULL
fi

echo "}" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
clear
echo "Complete"
echo "Shutdown the Raspberry Pi to connect to $ssid"

#!/bin/bash

# Setting the type of WPA that'll be used
# u: univeristy/school
# h: home
type=${1: 1}
if [ "$type" != "u" ]; then
	if [ "$type" != "h" ]; then
		echo "Error: don't know the command $type"
		exit 1
	fi
fi
# Takes in two arguements; name of SSID and the password
name="\"$2\""
password="\"$3\""

## In order to echo anything to the wpa_supplicant.conf file, you'll need sudo
## the 'sudo tee -a ' will append the the end of the file with permission
echo "" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
echo "network={" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf

if [ "$type" == "u" ]; then
	# '-e ' \t'' is used to add a tab space
	echo -e ' \t'ssid=\"StoutSecure\" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'priority=1 | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'proto=RSN | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'key_mgmt=WPA-EAP | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'pairwise=CCMP | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'auth_alg=OPEN | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'eap=PEAP | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'identity=$name | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'password=$password | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'phase1=\"peaplabel=0\" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'phase2=\"auth=MSCHAPV2\" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
elif [ "$type" == "h" ]; then
	echo -e ' \t'ssid=$name | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
	echo -e ' \t'psk=$password | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf
fi
echo "}" | sudo tee -a  /etc/wpa_supplicant/wpa_supplicant.conf

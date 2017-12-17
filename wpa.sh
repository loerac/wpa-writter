#!/bin/bash

# Takes in two arguements; name of SSID and the password
name="ssid=\"$1\""
password="psk=\"$2\""

# In order to echo anything to the wpa_supplicant.conf file, you'll need sudo
# the 'sudo tee -a' will append the the end of the file with permission
echo "" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "network={" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo -e ' \t '$name | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo -e ' \t '$password  | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "}"  | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf

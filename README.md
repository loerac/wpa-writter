# wpa-password-writer
Writes the SSID and password to the wpa_supplicant.conf file

It is recommend that you'll add a space before running the script so command doesn't save in the history with the password. To do this, you'll need to add change HISTCONTROL to be equal to HISTCONTROL=ignorespace in the ~/.bashrc file. When you enter your password, make sure that you're password is inside singel quotes.

Commands:

-u: Writes to wpa_supplicant.conf for university

-h: Writes to wpa_supplicant.conf for home

Example:

$ ./wpa.sh -u ssid_name 'ssid_password'

  ^ There's a space between the "$" and the "."

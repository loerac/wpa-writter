# wpa-password-writer
Writes the SSID and password to the wpa_supplicant.conf file

It is recommended that you add a space before running the script so the command doesn't save in the history with the password. To do this, you'll need to change *HISTCONTROL* to be equal to *HISTCONTROL=ignorespace* in the ~/.bashrc file. When you enter your password, make sure that you're password is inside single quotes.

After the bash script writes to the .conf file, **shutdown** your pi and then power it back up. I have found shutting down the Pi works better than rebooting when writing to the .conf file

### Commands:
-u: Writes to wpa_supplicant.conf for university. Make sure to put your username after the -u

### Example:
$ ./wpa.sh [ssid_name] '[ssid_password]'

$ ./wpa.sh [ssid_name] '[ssid_password]' -u [username]

  ^ There's a space between the "$" and the "."



This script can be used to authenticate with mac addresses. This script cannot check mac addresses on iOS or Android.
When connecting mobile devices, the check is discarded. 
The first time you connect, it checks to see if there is a file with a mac address for this user (/ auth_mac).
If not, then this is the first connection a file is created with the username and the mac address is written. 
If the user connects via ethernet for the first time and the next time he uses wifi, he will not be able to connect. 
To do this, you will need to manually add mac addresses to the file.
create log file to logfile=/var/log/mac_auth.log
add to openvpn-server config file
client-connect /usr/local/sbin/auth_mac.sh

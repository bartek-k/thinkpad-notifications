#!/bin/sh

WIN2002_LIST=winhelp2002.mvps.org.list
WINHELP_LIST_OUT=/tmp/$WIN2002_LIST

echo "Proccessing: $WIN2002_LIST"
wget http://winhelp2002.mvps.org/hosts.txt -O $WINHELP_LIST_OUT -q
egrep '^0\.0\.0\.0' /tmp/winhelp2002.mvps.org.list | sed -e 's/\r//g' | awk '{ printf "address=/.%s/127.0.0.1\n", $2 } ' > /home/$WIN2002_LIST
echo "Total: " `wc -l /home/$WIN2002_LIST`

echo "Restarting dnsmasq"
service dnsmasq restart

#!/bin/sh

WIN2002_LIST=winhelp2002.mvps.org.block
WINHELP_LIST_OUT=/tmp/$WIN2002_LIST
DEST="/usr/local/etc/dnsmasq.d/$WIN2002_LIST"


echo "Proccessing: $WIN2002_LIST"
wget http://winhelp2002.mvps.org/hosts.txt -O $WINHELP_LIST_OUT -q
egrep '^0\.0\.0\.0' $WINHELP_LIST_OUT | sed -e 's/\r//g' | awk '{ printf "address=/.%s/127.0.0.1\n", $2 } ' > $DEST
echo "Total: " `wc -l $DEST`

echo "Restarting dnsmasq"
service dnsmasq restart

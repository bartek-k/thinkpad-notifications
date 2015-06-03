#!/bin/sh

BATT_STATE=`acpitool -b`
BATT_INFO=`acpitool -B | egrep '(Design|Remaining|Last)'`
#AC_STATE=`grep POWER_SUPPLY_STATUS /sys/class/power_supply/BAT0/uevent | cut -d= -f2`

INFO="
$BATT_STATE
$BATT_INFO
"

~/bin/notification_service/client.py -i battery "Battery info" "$INFO"

#!/bin/sh

DEVICE_ID=13
STATE=`xinput list-props $DEVICE_ID | grep "Device Enabled" | rev | awk '{print $1}'`

if test $STATE = "1"; then
    xinput disable $DEVICE_ID
    ~/bin/notification_service/client.py -i input-tablet "Touchpad" "Disabled"
else
    xinput enable $DEVICE_ID
    ~/bin/notification_service/client.py -i input-tablet "Touchpad" "Enabled"
fi

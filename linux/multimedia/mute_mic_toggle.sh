#!/bin/sh

INTERVAL=1000
STATUS_PREFIX="Microphone:"

amixer sset Capture,0 toggle
amixer sget Capture,0 | grep -c "\[off\]" > /dev/null

if test $? = 0; then
    ~/bin/notification_service/client.py -i microphone-sensitivity-muted-symbolic "Microphone" "MUTE"
else
    ~/bin/notification_service/client.py -i microphone-sensitivity-high-symbolic "Microphone" "ACTIVE"
fi

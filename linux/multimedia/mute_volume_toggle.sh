#!/bin/sh

amixer -D pulse sset Master toggle
amixer sget Master,0 | grep -c "\[off\]" > /dev/null

if test $? = 0; then
    ~/bin/notification_service/client.py -i notification-audio-volume-muted "Volume" "MUTE"
else
    ~/bin/notification_service/client.py -i notification-audio-volume-medium "Volume" "ACTIVE"
fi

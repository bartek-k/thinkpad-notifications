#!/bin/sh

#amixer -q -D pulse set Master on
ICON=""
if test $1 = 0; then
    amixer -q set Master 3-
    ICON=notification-audio-volume-low
else
    amixer -q set Master 3+
    ICON=notification-audio-volume-high
fi

TITLE="Volume"
CURRENT_VOLUME=`amixer get Master,0 | egrep -o '\[[0-9]+%\]'`
amixer sget Master,0 | grep -c "\[off\]" > /dev/null
if test $? = 0; then
    TITLE="$TITLE (mute)"
fi

~/bin/notification_service/client.py -i $ICON "$TITLE" "Current: $CURRENT_VOLUME"

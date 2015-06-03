#!/bin/sh

STATE=`cat /sys/class/backlight/acpi_video0/brightness`
INFO="Current state: $STATE"

~/bin/notification_service/client.py -i video-display "Backlight" "$INFO"

#!/usr/bin/env sh

#Display the time in 12 hour format with AM/PM
TIME=$(date '+%I:%M %p')

CLOCKICON=􀐫

sketchybar --set $NAME icon=$CLOCKICON label="$TIME |"

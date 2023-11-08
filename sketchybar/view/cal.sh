#!/usr/bin/env sh

sketchybar --add item   cal right                                     \
           --set cal    update_freq=5                                 \
                        script="$PLUGIN_DIR/cal.sh"                   \
                      	label.padding_left=6                             \
                      	background.color=0xff222222           \

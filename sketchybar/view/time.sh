#!/usr/bin/env sh

sketchybar  --add item  time right                                      \
            --set time  update_freq=5                                   \
                        script="$PLUGIN_DIR/time.sh"                    \
                      	label.padding_left=6                             \
                      	background.color=0xff222222           \

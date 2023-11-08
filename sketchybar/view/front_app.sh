#!/usr/bin/env sh

sketchybar --add item       front_app left                                    \
           --subscribe      front_app front_app_switched                      \
           --set            front_app script="$PLUGIN_DIR/front_app.sh"       \
                            label.padding_left=-6                             \
                            label.padding_right=800                             \
                            background.color=0xff135678 		 \
                            #background.color=0xff${NORD3:1}           \

#!/usr/bin/env sh

sketchybar --add item wifi right                      \
           --set wifi update_freq=4                   \
                      script="$PLUGIN_DIR/wifi.sh"    \
                      label.padding_left=6                             \
                      background.color=0xff222222           \

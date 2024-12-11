#!/bin/bash
POPUP_OFF="sketchybar --set audio.output$1 popup.drawing=off"
AUDIODEVICES=(
  label.color="$PEACH"
  label.max_chars=50
  icon=􀑪
  display=2
  icon.color="$PEACH"
  background.drawing=off
  popup.align=right
  update_freq=5
  script="$PLUGIN_DIR/audio_devices.sh"
  click_script="sketchybar --set \$NAME popup.drawing=toggle; sleep 4; $POPUP_OFF"
)

sketchybar --add item audio.output right \
  --set audio.output "${AUDIODEVICES[@]}" \
  --subscribe audio.output mouse.clicked

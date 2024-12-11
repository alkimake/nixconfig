#!/bin/bash

update_audio() {
  # Get current audio device
  CURRENT_DEVICE=$(SwitchAudioSource -c)
  
  # Get all audio devices
  DEVICES=$(SwitchAudioSource -a)
  
  # Create the menu
  sketchybar --remove '/audio.device.*/'
  
  # Set the main label to current device (truncated if needed)
  TRUNCATED_NAME=$(echo "$CURRENT_DEVICE" | cut -c 1-20)
  if [ "$CURRENT_DEVICE" != "$TRUNCATED_NAME" ]; then
    TRUNCATED_NAME="${TRUNCATED_NAME}..."
  fi
  
  sketchybar --set "$NAME" label="$TRUNCATED_NAME"
  
  # Create menu items for each device
  COUNTER=0
  while IFS= read -r device; do
    # Skip empty lines
    [ -z "$device" ] && continue
    
    # Create menu item
    ITEM_NAME="audio.device.$COUNTER"
    sketchybar --add item "$ITEM_NAME" popup."$NAME" \
               --set "$ITEM_NAME" label="$device" \
               --set "$ITEM_NAME" click_script="SwitchAudioSource -s \"$device\"; $PLUGIN_DIR/audio_devices.sh"
    
    ((COUNTER++))
  done <<< "$DEVICES"
}

update_audio

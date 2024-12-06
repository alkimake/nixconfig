#!/bin/bash

plist_data=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources)
input_info=$(echo "$plist_data" | plutil -convert xml1 -o - -)
current_input_source=$(echo "$input_info" | grep -A1 'KeyboardLayout Name' | tail -n1 | cut -d '>' -f2 | cut -d '<' -f1)

if [ "$current_input_source" = "ABC" ]; then
    sketchybar --set input_source icon="󱌯"
elif echo "$input_info" | grep -q "com.apple.inputmethod.Korean"; then
    sketchybar --set input_source icon="🇰🇷"
elif echo "$input_info" | grep -q "com.apple.inputmethod.Japanese"; then
    sketchybar --set input_source icon="🇯🇵"
fi

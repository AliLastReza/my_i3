#!/bin/bash

# IMPORTANT: Replace "Your Touchpad Name" with the exact name you found using 'xinput list'
# Example: "SYNA7500:00 06CB:CD47 Touchpad"
TOUCHPAD_NAME="Your Touchpad Name"

# Get the current state of the touchpad's "Device Enabled" property
# We grep for the line, then use awk to extract the last field (0 for disabled, 1 for enabled)
CURRENT_STATE=$(xinput list-props "$TOUCHPAD_NAME" | grep "Device Enabled" | awk '{print $NF}')

if [ "$CURRENT_STATE" -eq 1 ]; then
    # Touchpad is currently enabled, so disable it
    xinput disable "$TOUCHPAD_NAME"
    #notify-send "Touchpad" "Disabled" # Optional: show a notification
else
    # Touchpad is currently disabled, so enable it
    xinput enable "$TOUCHPAD_NAME"
    #notify-send "Touchpad" "Enabled" # Optional: show a notification
fi

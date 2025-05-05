#!/bin/bash

# In GUI Ubuntu Settings set custom keyboard shortcuts enter full path command
# bash -c "/home/magnus/my-bash-scripts/toggle-trackpad.sh"

# Ensure environment is set up correctly when run from GUI
export DISPLAY=:0
export XDG_CURRENT_DESKTOP=GNOME
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Get current touchpad state
current_state=$(gsettings get org.gnome.desktop.peripherals.touchpad send-events)

# Toggle touchpad
if [ "$current_state" == "'enabled'" ]; then
    gsettings set org.gnome.desktop.peripherals.touchpad send-events 'disabled'
    notify-send "Touchpad disabled"
else
    gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
    notify-send "Touchpad enabled"
fi


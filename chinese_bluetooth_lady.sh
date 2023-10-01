#!/bin/bash

CONNECTED_SOUND="./chinese_bluetooth_lady_connect.mp3"
DISCONNECTED_SOUND="./chinese_bluetooth_lady_disconnect.mp3"

# Function that lists the currently connected devices
check_devices () {
bluetoothctl paired-devices | cut -f2 -d' '|
while read -r uuid
do
    info=`bluetoothctl info $uuid`
    if echo "$info" | grep -q "Connected: yes"; then
       echo "$info" | grep "Name"
    fi
done
}

# Store the initial list of paired devices
initial_devices=$(check_devices)

# Play the disconnected audio at initial boot
#play "$DISCONNECTED_SOUND"

while true; do
    # Get the current list of paired devices
    current_devices=$(check_devices)

    # Check for newly connected devices
    newly_connected=$(comm -13 <(echo "$initial_devices") <(echo "$current_devices"))

    # Check for newly disconnected devices
    newly_disconnected=$(comm -13 <(echo "$current_devices") <(echo "$initial_devices"))

    if [[ -n $newly_connected ]]; then
        # A device is newly connected
        play "$CONNECTED_SOUND"
        initial_devices="$current_devices"  # Update initial list
    elif [[ -n $newly_disconnected ]]; then
        # A device is newly disconnected
        play "$DISCONNECTED_SOUND"
        initial_devices="$current_devices"  # Update initial list
    fi

    sleep 3  # Adjust the interval as needed
done

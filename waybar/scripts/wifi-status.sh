#!/bin/zsh

while true; do
    # Check if Wi-Fi is enabled
    if [[ "$(nmcli -t -f WIFI g)" == "enabled" ]]; then
        # Get active connection and signal strength
        STATUS=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d':' -f2)
        if [[ -n "$STATUS" ]]; then
            SIGNAL=$(nmcli -t -f SIGNAL dev wifi | head -n 1)
            # Choose icon based on signal strength
            if [[ "$SIGNAL" -ge 75 ]]; then
                ICON="󰤨"  # Strong signal
            elif [[ "$SIGNAL" -ge 50 ]]; then
                ICON="󰤥"  # Medium signal
            elif [[ "$SIGNAL" -ge 25 ]]; then
                ICON="󰤢"  # Weak signal
            else
                ICON="󰤟"  # Very weak signal
            fi
            # Output SSID first, then the icon with a tooltip
            echo "$STATUS   $ICON"
        else
            echo "No Connection   󰤭"
        fi
    else
        echo "Wi-Fi Disabled   󰤮"
    fi
    sleep 5
done
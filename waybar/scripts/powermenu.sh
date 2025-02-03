#!/bin/zsh

# Show the notification (non-blocking) as a popup
yad --notification --text="Choose action:\n1. Shutdown\n2. Reboot\n3. Sleep\n4. Cancel" --timeout=10 --button="Shutdown:0" --button="Reboot:1" --button="Sleep:2" --button="Cancel:3"

# Get the exit status and trigger the action based on the selection
case $? in
    0)  # Shutdown
        systemctl poweroff
        ;;
    1)  # Reboot
        systemctl reboot
        ;;
    2)  # Sleep
        systemctl suspend
        ;;
    3)  # Cancel
        echo "Operation canceled."
        ;;
    *)
        echo "No valid option selected."
        ;;
esac
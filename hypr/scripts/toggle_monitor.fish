#!/bin/fish

set laptop_monitor (hyprctl monitors all | rg -m 1 "eDP" | cut -d" " -f2)
set available_monitors (hyprctl monitors)
echo $laptop_monitor
echo $available_monitors
if echo $available_monitors | rg -q "$laptop_monitor" 
    and echo $available_monitors | rg -q "\bDP|\bHDMI"
    notify-send "Disabling laptop screen"
    sleep 3
    hyprctl keyword monitor "$laptop_monitor, disable"
else
    notify-send "Enabling laptop screen"
    sleep 3
    hyprctl keyword monitor "$laptop_monitor,2560x1440@165,2560x0,1"
end

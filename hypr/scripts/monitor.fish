#!/bin/fish

set laptop_monitor "eDP-2"

if hyprctl monitors | rg -q "HDMI-A-1|\bDP-1"
	# set laptop_monitor (hyprctl monitors | rg eDP | cut -d" " -f2)
	hyprctl keyword monitor "$laptop_monitor, disable"
else
	hyprctl keyword monitor "$laptop_monitor, preferred, auto, 1"
end

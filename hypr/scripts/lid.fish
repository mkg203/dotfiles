#!/bin/fish

set laptop_monitor "eDP-2"

if hyprctl monitors | rg -q "HDMI-A-1"
	# set laptop_monitor (hyprctl monitors | rg eDP | cut -d" " -f2)
	if $argv[2] == "close"
		hyprctl keyword monitor "$laptop_monitor, disable"
	else if  $argv[2] == "open"
		hyprctl keyword monitor "$laptop_monitor, preferred, auto, 1"
	end
end

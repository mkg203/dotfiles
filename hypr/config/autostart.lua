local autostart = {
	"waybar",
	"hyprpaper",
	"dunst",
	"pypr",
	"warp-taskbar",
}

hl.on("hyprland.start", function()
	for _, cmd in ipairs(autostart) do
		hl.exec_cmd(cmd)
	end
end)

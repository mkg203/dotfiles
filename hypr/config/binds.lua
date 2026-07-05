local mainMod = "SUPER"
local sideMod = "CTRL"

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("print", hl.dsp.exec_cmd("grimblast copysave screen"))
hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

hl.bind(sideMod .. " + space", hl.dsp.exec_cmd("pkill wofi || wofi"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty -e yazi"))

hl.bind(sideMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(sideMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(sideMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(sideMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- pypr binds

hl.bind(sideMod .. " + SHIFT + F", hl.dsp.exec_cmd("pypr toggle term"))
hl.bind(sideMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("pypr toggle btop"))

-- workspace binds

hl.bind(sideMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(sideMod .. " + SHIFT + H", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("ALT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("ALT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("ALT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("ALT + J", hl.dsp.window.move({ direction = "d" }))

for i = 1, 10 do
	-- move to workspace
	hl.bind(mainMod .. " + " .. tostring(i % 10), hl.dsp.focus({ workspace = tostring(i) }))
	-- move window to workspace
	hl.bind(sideMod .. " + SHIFT + " .. tostring(i % 10), hl.dsp.window.move({ workspace = tostring(i) }))
end

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))

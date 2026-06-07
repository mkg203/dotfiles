local monitors = {
	external = { output = "DP-9", mode = "2560x1440@180", position = "0x0", scale = 1 },
	internal = { output = "eDP-1", mode = "2560x1440@165", position = "auto", scale = 1 },
}

hl.monitor(monitors.external)
hl.monitor({ output = monitors.internal.output, disabled = true })

local function configure_monitors(timeout, trigger)
	return function(event_monitor)
		if event_monitor and event_monitor.name and event_monitor.name:find("eDP") then
			return
		end
		hl.timer(function()
			local docked = hl.get_monitor(monitors.external.output)
			local enabled = hl.get_monitor(monitors.internal.output)

			if docked and enabled then
				hl.notification.create({ text = "disabling laptop screen", timeout = 3000 })

				hl.monitor(monitors.external)
				hl.monitor({ output = monitors.internal.output, disabled = true })

			elseif not docked and not enabled and trigger ~= "config.reloaded" then
				hl.notification.create({ text = "External monitor disconnected! Waking up laptop.", timeout = 30000 })

				hl.monitor(monitors.internal)
				hl.exec_cmd("hyprctl reload")
			end
		end, { timeout = timeout, type = "oneshot" })
	end
end

hl.on("hyprland.start", function()
	if hl.get_monitor("DP-9") then
		hl.monitor({ output = monitors.internal.output, disabled = true })
		hl.monitor(monitors.external)
	else
		hl.monitor(monitors.internal)
	end
end)
hl.on("config.reloaded", configure_monitors(500, "config.reloaded"))
hl.on("monitor.added", configure_monitors(200, "monitor.added"))
hl.on("monitor.removed", configure_monitors(1000, "monitor.removed"))

hl.config({
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },
    general = {
        gaps_in    = 5,
        gaps_out   = 12,
        border_size = 1,
        ["col.active_border"]   = "rgba(E5E4E2ee)",
        ["col.inactive_border"] = "rgba(595959aa)",
        layout           = "dwindle",
        resize_on_border = true,
    },
    input = {
        kb_layout  = "us",
        follow_mouse = 1,
        sensitivity  = 1.0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
        },
    },
    cursor = {
        no_hardware_cursors = true,
    },
    animations = { enabled = true }
})

hl.curve("myBezier", {
    type   = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default",   style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })

hl.gesture({
   fingers = 3,
   direction = "horizontal",
   action = "workspace"
})

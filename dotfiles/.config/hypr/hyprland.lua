-- Documenation: https://wiki.hypr.land/Configuring/Start/
-- Dispatchers, relevant for key bindings: https://wiki.hypr.land/Configuring/Basics/Dispatchers/
-- API: https://alejandrominaya.github.io/hyprland-lua-docs/#s5

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- hl.monitor({
-- 	output = "",
-- 	mode = "preferred",
-- 	position = "auto",
-- 	-- scale = "auto",
-- 	scale = 1,
-- })

hl.monitor({
	output = "eDP-1",
	-- mode = "preferred",
	mode = "2560x1600@300",
	position = "0x1440",
	-- scale = "auto",
	scale = 1,
})

hl.monitor({
	output = "DP-8",
	-- mode = "preferred",
	mode = "2560x1440@100",
	position = "0x0",
	-- scale = "auto",
	scale = 1,
})

hl.monitor({
	output = "DP-9",
	-- mode = "preferred",
	mode = "2560x1440@100",
	position = "2560x0",
	-- scale = "auto",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
-- local terminal = "ghostty"
local terminal = "x-terminal-emulator"
local fileManager = "pcmanfm-qt"
-- local menu = "hyprlauncher"
-- local menu = "dmenu_run"
local menu = "rofi -show run -matching fuzzy"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	-- hl.exec_cmd(terminal)
	-- hl.exec_cmd("nm-applet")
	-- hl.exec_cmd("waybar & hyprpaper & firefox")
	hl.exec_cmd("ashell")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 0,

		border_size = 1,

		col = {
			active_border = { colors = { "rgba(ff0000ee)", "rgba(ff0000ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "master",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- See https://github.com/hyprwm/Hyprland/blob/main/example/layouts/grid.lua
hl.layout.register("grid", {
	recalculate = function(ctx)
		local n = #ctx.targets
		if n == 0 then
			return
		end
		local cols = math.ceil(math.sqrt(n))
		for i, target in ipairs(ctx.targets) do
			target:place(ctx:grid_cell(i, cols))
		end
	end,
	layout_msg = function(ctx, msg)
		local id = active_id(ctx)
		local command = msg:match("^(%S+)")
		if command == "cycle_next" or command == "h" then
			if id then
				state.split[id] = "h"
			end
		end
		return true
	end,
})

-- require("grid")

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
	input = {
		kb_layout = "us",
		kb_variant = "colemak",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		repeat_delay = 250,
		repeat_rate = 25,

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		natural_scroll = true,

		-- touchpad = {
		-- 	natural_scroll = true,
		-- },
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- local closeWindowBind =
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("copyq toggle"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Return", hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
-- hl.bind(mainMod .. " + J", hl.dsp.window.cycle_next({ next = false }))
hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))
-- hl.bind(mainMod .. " + K", hl.dsp.window.cycle_next({ next = true }))
hl.bind(mainMod .. " + T", function()
	local workspace = hl.get_active_workspace()
	hl.workspace_rule({ workspace = workspace.name, layout = "master" })
end)
hl.bind(mainMod .. " + M", function()
	local workspace = hl.get_active_workspace()
	hl.workspace_rule({ workspace = workspace.name, layout = "monocle" })
end)
hl.bind(mainMod .. " + G", function()
	local workspace = hl.get_active_workspace()
	hl.workspace_rule({ workspace = workspace.name, layout = "lua:grid" })
end)
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ next = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ prev = true }))
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapnext"))
-- hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapprev"))
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
-- hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + comma", hl.dsp.focus({ monitor = "-1" }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ monitor = "+1" }))
-- hl.bind(mainMod .. " + tab", hl.dsp.focus({ last = true }))
hl.bind(mainMod .. " + tab", function()
	-- focus last active workspace on the current monitor
	local last_workspace = hl.get_last_workspace(hl.get_active_monitor())
	if last_workspace then
		hl.dispatch(hl.dsp.focus({ workspace = last_workspace.name, on_current_monitor = true }))
	end
end)
-- hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "e-1", on_current_monitor = true }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "e+1", on_current_monitor = true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.window.move({ monitor = "-1", follow = false }))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.window.move({ monitor = "+1", follow = false }))

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + SPACE", hl.dsp.workspace.toggle_special("magic"))
hl.bind("ALT" .. " + SPACE", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- Get window properties: hyprctl clients

hl.window_rule({
	name = "floating window - firefox lib",
	match = {
		title = "Library",
		class = "firefox",
	},
	float = true,
	center = true,
	size = { "(monitor_w - 400)", "(monitor_h - 200)" },
})

hl.window_rule({
	name = "floating windows",
	match = {
		class = "(pavucontrol|Scratchpad|Linphone|zoom)",
	},
	float = true,
	-- workspace = "special:magic",
})

hl.window_rule({
	name = "copyq",
	match = {
		class = "com.github.hluk.copyq",
	},
	float = true,
	center = true,
	border_size = 0,
})

hl.window_rule({
	name = "rambox",
	match = {
		class = "rambox",
	},
	workspace = 1,
})

hl.window_rule({
	name = "pinned windows",
	match = {
		class = "(game.exe|steam_app_default|Qemu-system-x86_64|qemu)",
	},
	workspace = 5,
})

hl.window_rule({
	name = "magic workspace terminal",
	match = {
		class = "(Floating.Terminal)",
	},
	float = true,
	size = { "monitor_w * 0.95", "monitor_h / 2.5" },
	move = { "(monitor_w - window_w) / 2", 100 },
	workspace = "special:magic",
	border_size = 0,
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- TODO: move function to source file of its own
local function move80percPane(moveDir, fixDir)
	return function(window, pane)
		local total_size = window:get_dimensions().pixel_height
		-- Technically the pane can / will occupy more than 80% because window:get_dimensions gives you the whole height _without_ system window decoration
		-- *but* it will include the tab-bar
		local target_size = total_size * 0.8
		local current_size = pane:get_dimensions().pixel_height
		local direction
		if current_size < target_size then
			direction = fixDir
		else
			direction = moveDir
		end
		local change_in_pixels = target_size - current_size
		local pixel_per_row = pane:get_dimensions().viewport_rows / current_size
		local change_in_rows = math.floor(math.abs(change_in_pixels * pixel_per_row))
		window:perform_action(wezterm.action.AdjustPaneSize({ direction, change_in_rows }), pane)
	end
end

-- TODO: -->8-- move to external config file for easier customisation
-- Spawn a fish shell in login mode
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
-- TODO: --8<--
--
-- TODO: -->8--move to external config for easier customisation
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 11
config.line_height = 1.3
-- Font adjustments for MacOS external Screen with 1440p
config.freetype_load_flags = "FORCE_AUTOHINT"
config.freetype_render_target = "Light"
-- config.freetype_interpreter_version = 38
config.front_end = "WebGpu"
-- TODO: --8<--
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- This config disables MacOS window decoration but let's you resize and drag on the borders nonetheless
-- config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- fine-tune colour theme
local custom_colour_scheme = wezterm.color.get_builtin_schemes()["rose-pine-moon"]
-- pretty, lighter than background, grey
custom_colour_scheme.selection_bg = "#455565"
config.color_schemes = { ["rose-pine-moon-cu"] = custom_colour_scheme }
config.color_scheme = "rose-pine-moon-cu"

config.prefer_egl = true
config.max_fps = 144

-- explicitly activate key composition for left option - so ¨a will become ä; weirdly this setting is also needed so that ß is possible to type
config.send_composed_key_when_left_alt_is_pressed = true

-- timeout is the time until wezterm exits leader-mode
-- TODO: reiterate: CMD+b is a bit straining on the hand over time
-- config.leader = { key = "b", mods = "CMD", timeout_milliseconds = 3000 }
-- TODO reiterate: Using tmux prefix for now, as it has proven to be ergonomic in the past
-- to avoid clashes with tmux there is a key config to send CTRL+b on CTRL+b-CTRL+b
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 3000 }

-- TODO: Move to external file
-- TODO: Update CMD-U and CMD-D to set to 80% of the screen
config.keys = {
	{
		-- send CTRL+b on <leader>-CTRL-b, in case leader is CTRL-b
		key = "b",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({
			key = "b",
			mods = "CTRL",
		}),
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- TODO: clear selection from copy_mode on 'q' (quit)
	-- clear selection on copy when pressing 'y' in copy_mode (for reference; wezterm already does that)
	-- {
	-- 	key = "y",
	-- 	mods = "NONE",
	-- 	mode = "copy_mode",
	-- 	action = wezterm.action.Multiple({
	-- 		wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	-- 		wezterm.action.ClearSelection,
	-- 	}),
	-- },
	{
		key = "u",
		mods = "LEADER|CTRL",
		action = wezterm.action.Multiple({
			wezterm.action.ActivatePaneDirection("Up"),
			wezterm.action_callback(move80percPane("Up", "Down")),
		}),
	},
	{
		key = "d",
		mods = "LEADER|CTRL",
		action = wezterm.action.Multiple({
			wezterm.action.ActivatePaneDirection("Down"),
			wezterm.action_callback(move80percPane("Down", "Up")),
		}),
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- tmux like key for copy mode
	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
}
-- Jump to tab 1 - 9 with Leader -> corresponding number
-- Indexes start at 0
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end
-- Jump to tab 10 (index 9)
-- TODO: Find a way to append `0` to the range of `1, 9`
table.insert(config.keys, {
	key = tostring("0"),
	mods = "LEADER",
	action = wezterm.action.ActivateTab(9),
})

return config

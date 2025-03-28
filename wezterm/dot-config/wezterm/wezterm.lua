-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 11
config.line_height = 1.3
-- Font adjustments for MacOS external Screen with 1440p
config.freetype_load_flags = "FORCE_AUTOHINT"
config.freetype_render_target = "Light"
-- config.freetype_interpreter_version = 38
config.front_end = "WebGpu"

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
config.leader = { key = "b", mods = "CMD", timeout_milliseconds = 3000 }

-- TODO: Move to external file
-- TODO: Update CMD-U and CMD-D to set to 80% of the screen
config.keys = {
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
	-- clear selection on copy when pressing 'y' in copy_mode
	-- {
	-- 	key = "y",
	-- 	mods = "NONE",
	-- 	mode = "copy_mode",
	-- 	action = wezterm.action.Multiple({
	-- 		wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	-- 		wezterm.action.ClearSelection,
	-- 	}),
	-- },
	-- {
	-- 	key = "u",
	-- 	mods = "LEADER|CMD",
	-- 	action = wezterm.action.AdjustPaneSize({
	-- 		"DOWN",
	-- 		wezterm.gui.screens()["active"].heigth * 0.8 - wezterm.pane.getDimension(),
	-- 	}),
	-- },
	-- action = wezterm.action_callback(function(win, pane)
	--   local tab = win:active_tab()
	-- -- also found:
	--           local tab = window:active_tab()
	-- local panes = tab:panes()
	-- local total_size = window:gui_window():get_dimensions().viewport_rows
	-- if pane:get_dimensions().rows < target_size then
	--   window:perform_action(
	--     wezterm.action.AdjustPaneSize { 'Down', target_size - pane:get_dimensions().rows },
	--     pane
	--   )
	-- end
	-- -- end of "also found"
	--   if tab then
	--     local panes = tab:panes()
	--     if #panes == 2 then -- Ensure there are exactly two panes
	--       win:perform_action(wezterm.action.AdjustPaneSize{"Up", 10}, pane)
	--     end
	--   end
	-- end),
	{
		key = "u",
		mods = "LEADER|CMD",
		action = wezterm.action.Multiple({
			wezterm.action.ActivatePaneDirection("Up"),
			wezterm.action.AdjustPaneSize({ "Down", 50 }),
		}),
	},
	{
		key = "d",
		mods = "LEADER|CMD",
		action = wezterm.action.Multiple({
			wezterm.action.ActivatePaneDirection("Down"),
			wezterm.action.AdjustPaneSize({ "Up", 50 }),
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

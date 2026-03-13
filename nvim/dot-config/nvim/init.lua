require("settings.opts")
require("settings.keymap")
require("autocommands.line-numbers")

local function isEmpty(s)
	return s == nil or s == ''
end

if not isEmpty(vim.g.user_ide) then
	local initFile = "init-" .. vim.g.user_ide
	local status, error = pcall(require, initFile)
	if not status then
		print("WARNING: Could not load " .. initFile)
		print("error: " .. error)
	end
end

-- NOTE: You can require modules in a non-failing way, eg. if the code is distributed and not every distribution has a local-settings file
-- pcall(require, "local-keymap")
-- vim.cmd(":color unokai") -- This command will still run
-- NOTE: you'd handle error state like this
-- local status, lfs = pcall(require, "lfs")
-- if(status) then
--    --lfs exists, so use it.
-- end
-- More information: https://www.lua.org/pil/8.4.html

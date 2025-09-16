require("settings.opts")
require("settings.keymap")
require("autocommands.line-numbers")

-- NOTE: You can require modules in a non-failing way, eg. if the code is distributed and not every distribution has a local-settings file
-- pcall(require, "local-keymap")
-- vim.cmd(":color unokai") -- This command will still run
-- NOTE: you'd handle error state like this
-- local status, lfs = pcall(require, "lfs")
-- if(status) then
--    --lfs exists, so use it.
-- end
-- More information: https://www.lua.org/pil/8.4.html

-- Function to set hybrid numbers for focused window
local function set_hybrid_numbers()
  vim.opt.relativenumber = true
  vim.opt.number = true
end

-- Function to set absolute numbers for inactive windows
local function set_absolute_numbers()
  vim.opt.relativenumber = false
  vim.opt.number = true
end

-- Autocommands to switch line number styles
-- :autocmd adds to the list of autocommands regardless of whether they are already present.  When your .vimrc file is sourced twice, the autocommands will appear twice.  To avoid this, define your autocommands in a group, so that you can easily clear them:
vim.api.nvim_create_augroup("HybridLineNumbers", { clear = true })
-- Alternative to removing all autocommands - instead use a variable to ensure that Vim includes the autocommands only once:
-- :if !exists("autocommands_loaded")
-- :  let autocommands_loaded = 1
-- :  au ...
-- :endif
vim.api.nvim_create_autocmd("FocusGained", {
  group = "HybridLineNumbers",
  pattern = "*", -- Pattern of file name; autocommand groups can be assigned to specific file types
  callback = set_hybrid_numbers,
})
-- vim.api.nvim_create_autocmd("BufEnter", {
vim.api.nvim_create_autocmd("WinEnter", {
  group = "HybridLineNumbers",
  pattern = "*",
  callback = set_hybrid_numbers,
})
vim.api.nvim_create_autocmd("FocusLost", {
  group = "HybridLineNumbers",
  pattern = "*",
  callback = set_absolute_numbers,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = "HybridLineNumbers",
  pattern = "*",
  callback = set_absolute_numbers,
})

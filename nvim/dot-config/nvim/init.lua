vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "utf-8"

-- Open new splits by default on the right and below respectively
vim.opt.splitright = true
vim.opt.splitbelow = true

--  TODO: what are these doing?
-- hi Normal guibg=NONE ctermbg=NONE
-- hi EndOfBuffer guibg=NONE ctermbg=NONE

-- TODO: figure out how to correctly set leader key
-- vim.g.mapleader = "<Space>"
-- vim.g.maplocalleader = "<Space>"

-- Reset search highlight on <ESC>
vim.keymap.set("n", "<ESC>", ":noh<CR><ESC>")
-- For now setting <Leader> hard coded to <Space>
-- Buffer controls
vim.keymap.set({ "n", "v" }, "[b", ":bprevious<CR>")
vim.keymap.set({ "n", "v" }, "]b", ":bnext<CR>")
vim.keymap.set({ "n", "v" }, "<Space>bd", ":bdelete<CR>")

-- Window controls
-- TODO: add check that there is more than 1 window left, otherwise don't close
vim.keymap.set({ "n", "v" }, "<Space>wd", ":q<CR>")

-- TODO: I need to figure out how to remap "move window" to <C-W><uppercase-LHJK>

-- vim.keymap.set({ "n", "v" }, "<C-W>J", "<C-J>")
-- vim.keymap.del({ "n", "v" }, "<C-J>")
vim.keymap.set({ "n", "v" }, "<C-J>", "<C-W>j")

-- vim.keymap.set({ "n", "v" }, "<C-W>K", "<C-K>")
-- vim.keymap.del({ "n", "v" }, "<C-K>")
vim.keymap.set({ "n", "v" }, "<C-K>", "<C-W>k")

-- vim.keymap.set({ "n", "v" }, "<C-W>H", "<C-H>")
-- vim.keymap.del({ "n", "v" }, "<C-H>")
vim.keymap.set({ "n", "v" }, "<C-H>", "<C-W>h")

-- vim.keymap.set({ "n", "v" }, "<C-W>L", "<C-L>")
-- vim.keymap.del({ "n", "v" }, "<C-L>")
vim.keymap.set({ "n", "v" }, "<C-L>", "<C-W>l")

vim.keymap.set({ "n", "v" }, "<Space>|", ":vsplit<CR>")
vim.keymap.set({ "n", "v" }, "<Space>-", ":split<CR>")
vim.keymap.set({ "n", "v" }, "[t", ":tabprevious<CR>")
vim.keymap.set({ "n", "v" }, "]t", ":tabnext<CR>")
vim.keymap.set({ "n", "v" }, "<Space>td", ":tabclose<CR>")
vim.keymap.set({ "n", "v" }, "<Stace>tn", ":tabnew<CR>")

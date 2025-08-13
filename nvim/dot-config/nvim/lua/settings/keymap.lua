vim.g.mapleader = " "
-- TODO: figure out if and what for I need local leader and what to configure it to
-- vim.g.maplocalleader = " "

-- Key binding inspired by lazyvim https://www.lazyvim.org/configuration/general#keymaps
-- Buffer controls
-- TODO: Write / use script to change buffer before deleting this buffer
-- deleting a buffer that is open in a window will close the window, too
vim.keymap.set({ "n", "v" }, "<leader>bd", "<cmd>bdel<cr>", { desc = "[d]elete Buffer" })
vim.keymap.set({ "n", "v" }, "<leader>bD", "<cmd>bdel<cr>", { desc = "[D]elete Buffer and close window" })
vim.keymap.set({ "n", "v" }, "[b", "<cmd>bprev<cr>", { desc = "Prev [b]uffer" })
vim.keymap.set({ "n", "v" }, "]b", "<cmd>bnext<cr>", { desc = "Next [b]uffer" })
vim.keymap.set({ "n", "v" }, "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Reset search highlight on <ESC>
vim.keymap.set("n", "<ESC>", "<cmd>noh<cr><esc>")

-- Window controls
-- TODO: add check that there is more than 1 window left, otherwise don't close
vim.keymap.set({ "n", "v" }, "<leader>wd", ":q<CR>")

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

-- tab controls
vim.keymap.set({ "n", "v" }, "[t", "<cmd>tabprevious<cr>", { desc = "Previous [T]ab" })
vim.keymap.set({ "n", "v" }, "]t", "<cmd>tabnext<cr>", { desc = "Next [T]ab" })
vim.keymap.set({ "n", "v" }, "<leader>td", "<cmd>tabclose<cr>", { desc = "[D]elete Tab" })
vim.keymap.set({ "n", "v" }, "<leader>tn", "<cmd>tabnew<cr>", { desc = "[D]elete Tab" })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "utf-8"

-- Open new splits by default on the right and below respectively
vim.opt.splitright = true
vim.opt.splitbelow = true

-- spellcheck
vim.opt.spell = true
vim.opt.spelllang = { "en_gb", "de" }

-- Make sure we use terminal colours and no theme
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = nil })
-- Other (vim) settings I found that may be useful in the future:
-- :hi Normal guibg=NONE ctermbg=NONE
-- :hi EndOfBuffer guibg=NONE ctermbg=NONE
-- :set notermguicolor
-- -- further reading: [Consistent terminal colors with 16-ANSI-color Vim themes](https://jeffkreeftmeijer.com/vim-16-color/)
-- If you can't find the appropriate lua-mapping to a vim-command, you can call it directly with `vim.cmd('colorscheme unokai')`

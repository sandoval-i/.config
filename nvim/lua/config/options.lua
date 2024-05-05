local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.cursorline = true
opt.termguicolors = false
opt.list = true

opt.hlsearch = false
opt.incsearch = true

opt.ignorecase = true
opt.smartcase = true

opt.breakindent = true
opt.wrap = false

vim.cmd([[let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro"]])

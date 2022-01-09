vim.opt.nu=true

vim.opt.smartindent=true
vim.opt.autoindent=true
vim.opt.expandtab=true

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

vim.opt.textwidth=79
vim.opt.hlsearch=false
vim.opt.incsearch=true

vim.opt.splitright=true
vim.opt.splitbelow=true

-- Disable auto comment insertion
vim.bo.fo=vim.bo.fo:gsub('cro', '')

-- Netrw conf
vim.g.netrw_banner=false
vim.g.netrw_liststyle=3
vim.g.netrw_winsize=80


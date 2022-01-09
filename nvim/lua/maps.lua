-- MAPS
vim.g.mapleader = " " 

function vim.api.map(key, map, mode, opts)
  o = opts or {}
  m = mode or 'n'
  vim.api.nvim_set_keymap(m, key, map, o)
end

vim.api.map('n', 'nzzzv')
vim.api.map('N', 'Nzzzv')
vim.api.map('Y', 'y$')

vim.api.map('>', '>gv', 'v')
vim.api.map('<', '<gv', 'v')

vim.api.map('J', ':move +2<cr>gv=gv', 'v', {silent = true})
vim.api.map('K', ':move -2<cr>gv=gv', 'v', {silent = true})

vim.api.map(',', ',<c-g>u', 'i')
vim.api.map('.', '.<c-g>u', 'i')
vim.api.map('!', '!<c-g>u', 'i')
vim.api.map('?', '?<c-g>u', 'i')

vim.api.map('(', '(<c-g>u', 'i')


vim.api.map('<Esc>', '<c-\\><c-n>', 't')

vim.cmd[[
  cnoreabbrev W w
  cnoreabbrev Wq wq
  cnoreabbrev WQ wq
  cnoreabbrev Q q
]]

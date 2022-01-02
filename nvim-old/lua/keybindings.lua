-- Maps
local keymap = vim.api.nvim_set_keymap
keymap('t', '<Esc>', '<C-\\><C-n>', {})

keymap('n', '=', ':vertical res +5<CR>', {})
keymap('n', '-', ':vertical res -5<CR>', {})

keymap('n', 'n', 'nzzzv', {})
keymap('n', 'N', 'Nzzzv', {})

keymap('n', 'j', 'gj', {})
keymap('n', 'k', 'gk', {})
keymap('n', '0', 'g0', {})
keymap('n', '$', 'g$', {})

keymap('v', '<', '<gv', {})
keymap('v', '>', '>gv', {})
keymap('v', 'J', ':m > +1<CR>gv=gv', {})
keymap('v', 'K', ':m < -1<CR>gv=gv', {})

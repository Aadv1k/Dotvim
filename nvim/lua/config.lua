-- Global
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.hlsearch=false
vim.opt.incsearch=true

vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

vim.opt.smartindent=true
vim.opt.wrap=true

vim.opt.exrc=true
vim.opt.mouse='nv'
vim.opt.updatetime=50

vim.opt.visualbell=false
vim.opt.errorbells=false
vim.opt.scrolloff=4
vim.opt.cmdheight=1

vim.opt.nu = true


-- AUTOCMD

vim.cmd[[
	autocmd BufWrite *.py,*.json,*.js :Neoformat
]]

vim.cmd[[
	autocmd BufRead *.rst,*.md,*.txt,*.txt call SetWritingMode()
    function! SetWritingMode()
        set nonu
        set spell!
        nmap K 1z=
    endfunction
]]


vim.cmd[[
	autocmd BufRead *.py,*.rb,*.lua call SetFourTab()
	function! SetFourTab()
		set tabstop=4
		set softtabstop=4
		set shiftwidth=4
		set expandtab
		set shiftround
		set textwidth=80
	endfunction			
]]

vim.cmd[[
    autocmd BufRead *.html,*.htm call SetHtmlMode()
    function! SetHtmlMode() 
        nmap <CR> <c-y>, " emmet
    endfunction
]]

-- Plugin conf 
-- local lsp = require 'lspconfig'
-- lsp.pyright.setup{}

require'nvim-treesitter.configs'.setup {
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
  },
}

vim.g.neoformat_enabled_python = {'autopep8', 'yapf', 'docformatter'}
vim.g.neoformat_enabled_javascript = {'prettier',}

vim.g.onedark_style = 'darker' -- dark darker deep cool warm warmer
require('onedark').setup()

--[[
local cmp = require 'cmp'
cmp.setup {

    snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
    },


    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },

    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5},
        { name = 'vsnip' },
    },

    experimental = {
      native_menu = false,
    }
}
]]

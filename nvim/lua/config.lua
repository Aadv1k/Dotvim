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
        nmap <Space> <c-y>, " emmet
    endfunction
]]

-- Plugin conf 
local lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--- PYTHON
lsp.pyright.setup{
  capabilities = capabilities,
}

-- CSS
lsp.cssls.setup{
  capabilities = capabilities,
}

-- HTML
lsp.html.setup {
  capabilities = capabilities,
}

-- TS/JS
lsp.tsserver.setup{
  capabilities = capabilities,
}


require'nvim-treesitter.configs'.setup {
  ignore_install = { "html" },
  highlight = {
    enable = true,
  },
}

vim.g.neoformat_enabled_python = {'autopep8', 'yapf', 'docformatter'}
vim.g.neoformat_enabled_javascript = {'prettier',}

-- vim.g.onedark_style = 'darker' -- dark darker deep cool warm warmer
-- require('onedark').setup()
vim.cmd[[ color gruvbox ]]

local cmp = require 'cmp'
cmp.setup {

    snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
    },


    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },

    sources = {
        { name = 'vsnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5},
        { name = 'nvim_lua' },
    },

    experimental = {
      native_menu = false,
    }
  }

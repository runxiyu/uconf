local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/ethanholz/nvim-lastplace'
Plug 'https://github.com/mattn/vim-goimports' -- golang.org/x/tools/cmd/goimports
Plug 'https://github.com/junegunn/vim-easy-align'
Plug 'https://github.com/ibhagwan/fzf-lua'
vim.call('plug#end')

vim.opt.shortmess:prepend("IrCFlotTO")
vim.opt.undofile   = true
vim.opt.encoding   = "utf-8"
vim.opt.undodir    = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.incsearch  = true
vim.opt.hidden     = true -- allow background buffers
vim.opt.laststatus = 2
vim.opt.showmode   = true -- set false when using airline
vim.opt.timeoutlen = 50
vim.opt.mouse      = "a"
vim.opt.mousemodel = "extend"
vim.opt.clipboard  = "unnamedplus"

vim.g.vimtex_view_method = "zathura"

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<F3>",  ":set hlsearch!<CR>")

vim.cmd.colorscheme('default')
vim.opt.background                           = "dark"
vim.opt.termguicolors                        = true
vim.opt.guifont                              = "monospace:h14"
vim.g.neovide_theme                          = 'auto'
vim.g.neovide_input_macos_option_key_is_meta = 'both'
vim.g.neovide_cursor_animation_length        = 0.02

vim.cmd.highlight({ "Normal",          "guibg=black"               })
vim.cmd.highlight({ "StatusLine",      "guibg=black", "guifg=gray" })
vim.cmd.highlight({ "Todo",            "guibg=red"                 }) -- TODO
vim.cmd.highlight({ "DiagnosticWarn",  "guibg=#333333"             })
vim.cmd.highlight({ "DiagnosticError", "guibg=#333333"             })

require'nvim-treesitter.configs'.setup {
	ensure_installed = {
	},
	sync_install = true,
	auto_install = true,
	ignore_install = { "latex", "bibtex" },
	highlight = {
		enable = true,
		disable = { "latex", "bibtex" }, -- VimTeX handles this for us
		additional_vim_regex_highlighting = { "latex", "bibtex", "markdown" },
	},
}

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
require'lspconfig'.clangd.setup{}
require'lspconfig'.pylsp.setup{
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'W391'},
					maxLineLength = 100
				}
			}
		}
	}
}
require'lspconfig'.gopls.setup{}
-- require'lspconfig'.eslint.setup{}

require'nvim-lastplace'.setup {
	lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
	lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
	lastplace_open_folds = true
}

-- curl https://git.runxiyu.org/runxiyu/current/uconf.git/plain/.local/share/nvim/site/autoload/plug.vim -o "$HOME"/.local/share/nvim/site/autoload/plug.vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/tomasiser/vim-code-dark'
Plug 'https://github.com/skwee357/nvim-prose'
Plug 'https://github.com/ethanholz/nvim-lastplace'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/mattn/vim-goimports'
vim.call('plug#end')

vim.opt.shortmess:prepend("I")
vim.opt.undofile       = true
vim.opt.encoding       = "utf-8"
vim.opt.undodir	       = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.incsearch      = true
vim.opt.hidden	       = true -- allow background buffers
vim.opt.laststatus     = 2
vim.opt.showmode       = false -- set false when using airline
vim.opt.timeoutlen     = 50
vim.opt.mouse	       = ""
vim.opt.clipboard      = "unnamedplus"

vim.g.vimtex_view_method = "zathura"

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<F3>",  ":set hlsearch!<CR>")
-- vim.keymap.set({"n", "i"}, "<C-M>", ":keepp /<++><CR>ca<")

vim.g.codedark_conservative = 0
vim.g.codedark_modern       = 1
vim.g.codedark_italics      = 1
vim.g.codedark_transparent  = 1
vim.g.airline_theme         = "codedark"
vim.opt.background          = "dark"
vim.opt.guifont             = "monospace:h20"
-- vim.cmd.colorscheme('default')
vim.cmd.colorscheme('codedark')
-- vim.cmd.colorscheme('vim')

vim.cmd([[
let maplocalleader = ','
let leader	   = '\'
]])


require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"ada",
		"asm",
		"bash",
		-- "bibtex", -- seems broken on commented lines
		"c",
		"commonlisp",
		"comment",
		"css",
		"csv",
		"diff",
		"git_config",   
		"git_rebase",
		"go",
		"gomod",
		"gosum",
		"hare",
		"haskell",
		"html",
		"htmldjango",
		"http",
		"ini",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"nasm",
		"passwd",
		"python",   
		"r",
		"racket",
		"regex",
		"rst",
		"rust",
		"scheme", 
		"scss",
		"sql",
		"ssh_config",
		"toml",
		"tsv",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},
	sync_install = false,
	auto_install = true,
	ignore_install = { "latex", "bibtex" },
	highlight = {
		enable = true,
		disable = { "latex", "bibtex" }, -- VimTeX handles this for us
		-- disable = function(lang, buf)
		-- 	local max_filesize = 100 * 1024 -- 100 KB
		-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		-- 	if ok and stats and stats.size > max_filesize then
		-- 		return true
		-- 	end
		-- end,
		additional_vim_regex_highlighting = { "latex", "markdown" },
	},
}

require'lspconfig'.ccls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.eslint.setup{}
require('nvim-prose').setup {
	wpm = 200.0,
	filetypes = { 'markdown' },
	placeholders = {
		words = 'words',
		minutes = 'min'
	}
}

require'nvim-lastplace'.setup {
	lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
	lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
	lastplace_open_folds = true
}

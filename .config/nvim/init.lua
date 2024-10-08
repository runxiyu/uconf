-- curl https://git.runxiyu.org/runxiyu/current/uconf.git/plain/.local/share/nvim/site/autoload/plug.vim -o "$HOME"/.local/share/nvim/site/autoload/plug.vim
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/ethanholz/nvim-lastplace'
-- Plug 'https://github.com/vim-airline/vim-airline'
-- Plug 'https://github.com/tomasiser/vim-code-dark'
Plug 'https://github.com/mattn/vim-goimports'
Plug 'junegunn/vim-easy-align'
Plug 'glacambre/firenvim'
vim.call('plug#end')


vim.opt.shortmess:prepend("I")
vim.opt.undofile       = true
vim.opt.encoding       = "utf-8"
vim.opt.undodir	       = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.incsearch      = true
vim.opt.hidden	       = true -- allow background buffers
vim.opt.laststatus     = 2
vim.opt.showmode       = true -- set false when using airline
vim.opt.timeoutlen     = 50
vim.opt.mouse	       = "a"
vim.opt.clipboard      = "unnamedplus"

vim.g.vimtex_view_method = "zathura"

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<F3>",  ":set hlsearch!<CR>")

vim.cmd.colorscheme('default')
vim.opt.background          = "light"
vim.opt.guifont             = "DejaVu Sans Mono:h16"
vim.opt.termguicolors       = false
-- vim.cmd.colorscheme('vim')
-- vim.cmd.colorscheme('codedark')
-- vim.g.codedark_conservative = 0
-- vim.g.codedark_modern       = 1
-- vim.g.codedark_italics      = 1
-- vim.g.codedark_transparent  = 1
-- vim.g.airline_theme         = "codedark"

if vim.g.started_by_firenvim == true then
	vim.g.firenvim_config.localSettings['.*'] = { takeover = 'never', priority = 10 }
	vim.o.laststatus = 0
end

vim.cmd([[
syntax enable
" highlight Normal ctermfg=none ctermbg=none
" highlight NonText ctermfg=none ctermbg=none
" highlight EndOfBuffer ctermfg=none ctermbg=none
" highlight TabLineFill ctermfg=none ctermbg=none
" highlight Search ctermbg=12
" highlight NonText ctermfg=darkgrey
" highlight SpecialKey ctermfg=darkgrey
" highlight clear SignColumn
highlight Comment cterm=none ctermfg=darkgrey guifg=darkgrey
highlight StatusLine cterm=none ctermbg=none ctermfg=lightgrey guifg=lightgrey
" highlight StatusLineNC cterm=none ctermbg=none ctermfg=darkgrey
" highlight Title cterm=none ctermfg=darkgrey
" highlight TabLineFill cterm=none
" highlight TabLine cterm=none ctermfg=darkgrey ctermbg=none
" highlight ColorColumn ctermbg=darkgrey guibg=lightgrey
highlight Todo ctermbg=NONE ctermfg=red cterm=bold guifg=red gui=bold
" highlight PreProc ctermfg=grey
" highlight String ctermfg=darkblue cterm=italic
" highlight Type ctermfg=darkblue
" highlight lineNr ctermfg=grey cterm=italic
" highlight cIncluded ctermfg=NONE cterm=bold
" highlight pythonInclude ctermfg=blue
" highlight pythonConditional ctermfg=darkcyan
" highlight pythonBuiltin ctermfg=darkcyan
" highlight Pmenu ctermbg=white ctermfg=black
" highlight PmenuSel ctermbg=darkcyan ctermfg=black
" highlight hareKeyword ctermbg=NONE ctermfg=blue
" highlight hareLabel ctermbg=NONE cterm=bold
" highlight hareType ctermfg=darkcyan
]])

vim.cmd([[
let maplocalleader = ','
let leader	   = '\'
]])


require'nvim-treesitter.configs'.setup {
	ensure_installed = {
-- "bibtex", -- broken
		"ada", "asm", "awk", "bash", "cmake", "comment", "commonlisp", "cpp", "c", "css", "csv", "diff", "gitattributes", "gitcommit", "git_config", "gitignore", "git_rebase", "gomod", "go", "gosum", "hare", "haskell", "htmldjango", "html", "http", "ini", "javascript", "json", "lua", "make", "markdown_inline", "markdown", "nasm", "ninja", "org", "passwd", "perl", "python", "racket", "regex", "robots", "r", "rst", "rust", "scheme", "scss", "sql", "ssh_config", "tmux", "toml", "tsv", "typescript", "vimdoc", "vim", "xml", "yaml", "zathurarc",
	},
	sync_install = true,
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
-- require'lspconfig'.pylsp.setup{}
require'lspconfig'.gopls.setup{}
-- require'lspconfig'.eslint.setup{}

require'nvim-lastplace'.setup {
	lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
	lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
	lastplace_open_folds = true
}

-- require("nvim-treesitter.parsers").get_parser_configs().scfg = {
-- 	install_info = {
-- 		url = "https://git.sr.ht/~rockorager/tree-sitter-scfg",
-- 		files = {"src/parser.c"},
-- 	},
-- 	filetype = "scfg",
-- 	requires_generate_from_grammar = true,
-- }
-- 
-- vim.filetype.add({
-- 	extension = {
-- 		scfg = "scfg",
-- 	}
-- })


local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = {"src/parser.c"}
	},
	filetype = "gotmpl",
	used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "tmpl"}
}

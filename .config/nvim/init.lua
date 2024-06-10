local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/neovim/nvim-lspconfig'
vim.call('plug#end')

vim.opt.shortmess:prepend("I")
vim.opt.undofile       = true
vim.opt.encoding       = "utf-8"
vim.opt.undodir        = "/home/runxiyu/.local/share/nvim/undo"
vim.opt.incsearch      = true
vim.opt.hidden         = true -- allow background buffers
vim.opt.laststatus     = 2
vim.opt.timeoutlen     = 50

vim.g.vimtex_view_method = "zathura"

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<F3>",  ":set hlsearch!<CR>")
vim.keymap.set({"n", "i"}, "<C-M>", ":keepp /<++><CR>ca<")

vim.cmd.colorscheme('default')
vim.opt.background = "dark"
vim.opt.guifont    = "monospace:h12"

vim.cmd([[
let maplocalleader = ','
let leader         = '\'
]])


require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "hare", "python", "diff", "git_rebase", "css", "html", "javascript" },
	sync_install = false,
	auto_install = true,
	-- ignore_install = { "javascript" },
	highlight = {
		enable = true,
		-- disable = { "c", "rust" },
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}

require'lspconfig'.ccls.setup{}

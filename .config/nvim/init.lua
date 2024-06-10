vim.cmd([[

" set runtimepath=~/.config/nvim,~/.config/nvim/pack/*/start/*,~/.local/share/nvim/site,/etc/xdg/nvim,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/lib/nvim,/usr/share/nvim/site/after

" Remember to install:
" vim-airline (if wanted)
" vim-fugitive
" vim-jedi
" python3-nvim

call plug#begin()
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
" Plug 'https://github.com/neovim/nvim-lspconfig' (using builtin packages instead)
call plug#end()


set shortmess+=I " Hide startup message

set undofile
set undodir=~/.local/share/nvim/undo

" set incsearch

" set tabstop=8
" set noexpandtab

" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#buffer_nr_show=1
set laststatus=2
set noshowmode
set timeoutlen=50

set hidden " allow background buffers

" sudo save
cmap w!! w !sudo tee % >/dev/null

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:vimtex_view_method = 'zathura'
let maplocalleader = ','
let leader = '\'

nmap <C-N> :VimtexCompile<CR><CR>
map <C-M> :keepp /<++><CR>ca<

" set nowrap

let g:jedi#auto_initialization = 1

colorscheme default
" let g:seoul256_light_background = 256
" colorscheme seoul256-light
" colorscheme one-dark
" syntax enable
" highlight Normal ctermfg=none ctermbg=none
" highlight NonText ctermfg=none ctermbg=none
" highlight EndOfBuffer ctermfg=none ctermbg=none
" highlight TabLineFill ctermfg=none ctermbg=none
" highlight Search ctermbg=12
" highlight NonText ctermfg=darkgrey
" highlight SpecialKey ctermfg=darkgrey
" highlight clear SignColumn
" highlight Comment cterm=bold ctermfg=none
" highlight StatusLine cterm=none ctermbg=none ctermfg=darkgrey
" highlight StatusLineNC cterm=none ctermbg=none ctermfg=darkgrey
" highlight Title cterm=none ctermfg=darkgrey
" highlight TabLineFill cterm=none
" highlight TabLine cterm=none ctermfg=darkgrey ctermbg=none
" highlight ColorColumn ctermbg=darkgrey guibg=lightgrey
" highlight Todo ctermbg=NONE ctermfg=red cterm=bold
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

"set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

set bg=dark
set guifont=monospace:h12

]])

-- vim.lsp.start({
-- 	name = 'ccls',
-- 	cmd = {'ccls'},
-- 	root_dir = root_pattern({"compile_commands.json", ".ccls", ".git"}),
-- })


require'lspconfig'.ccls.setup{}

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "hare", "python" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
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

" Remember to install:
" vim-airline (if wanted)
" vim-fugitive
" vim-jedi
" python3-nvim

call plug#begin()
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
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

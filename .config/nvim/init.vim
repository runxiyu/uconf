" Remember to install:
" vim-airline
" vim-fugitive
" vim-fugitive
" vim-syntastic-{c,tex,sh,python,go,json,html,css,lua,zsh}

call plug#begin()
Plug 'https://github.com/sile-typesetter/vim-sile'
Plug 'https://github.com/lervag/vimtex'
call plug#end()


set shortmess+=I " Hide startup message

set undofile
set undodir=~/.local/share/nvim/undo

set incsearch

"set tabstop=8
"set noexpandtab

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
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

nmap <C-N> :VimtexCompile<CR><CR>

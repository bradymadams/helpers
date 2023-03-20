syntax on
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set hidden
filetype off                  " required

" map L to left (<-) and ; to right (->) so right hand sits on jkl;
noremap ; l
noremap l h

"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
noremap <C-w>l <C-w>h
noremap <C-w>; <C-w>l

"noremap ,k :ls<CR>
"noremap ,; :bnext<CR>
"noremap ,l :bprevious<CR>
noremap ,l :ls<CR>
noremap ,, :buffer<space>
"noremap <F1> :bprevious<CR>
"noremap <F2> :bnext<CR>
noremap - :bprevious<CR>
noremap = :bnext<CR>

set nu
set ruler
set cursorline
set cursorcolumn
hi cursorline cterm=None ctermbg=243
hi cursorcolumn cterm=None ctermbg=243

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
set wildmenu

" Make tab complete on vim command line case sensitive
set nofileignorecase
set nowildignorecase

autocmd FileType make setlocal noexpandtab
autocmd BufEnter *.mm setlocal filetype=json
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal tabstop=2


au BufNewFile,BufRead *.ts set filetype=typescript
autocmd FileType typescript setlocal shiftwidth=2
autocmd FileType typescript setlocal tabstop=2

" let fortran_free_source=1

set path+=**

"autocmd BufWritePre * :%s/\s\+$//e
"match Todo /\s\+$/

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" map F1 and F2 for left/right tab navigation
"map <F1> gT
"map <F2> gt

" Enable folding
set foldmethod=indent
set foldlevel=99

set background=dark

colorscheme evening
"hi Normal guifg=#ffffff guibg=#ff0000 gui=NONE cterm=NONE
hi Normal ctermfg=231 ctermbg=None cterm=NONE

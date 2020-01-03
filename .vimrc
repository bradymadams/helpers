set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
autocmd FileType make setlocal noexpandtab
autocmd BufEnter *.ifl setlocal filetype=json
autocmd BufEnter *.mm setlocal filetype=json
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal tabstop=2

let fortran_free_source=1

set path+=**
set wildmenu
set wildignore+=*/3rd/*
set wildignore+=*/build/*
set wildignore+=*/doc/*

"autocmd BufWritePre * :%s/\s\+$//e
match Todo /\s\+$/

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" map L to left (<-) and ; to right (->) so right hand sits on jkl;
noremap ; l
noremap l h

map <F1> gT
map <F2> gt

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

set nu
set cursorline
set cursorcolumn
hi cursorline cterm=None ctermbg=243
hi cursorcolumn cterm=None ctermbg=243

highlight ExtraWhitespace ctermbg=9
match ExtraWhitespace /\s\+$/
autocmd BufNewFile,BufRead * match ExtraWhitespace /\s\+$/

"highlight Todo ctermbg=51 ctermfg=0
"match Todo /[tT][oO][dD][oO]/
"autocmd BufNewFile,BufRead * match Todo /[tT][oO][dD][oO]/

" Remove trailing whitespace before buffer write
"autocmd BufWritePre * :%s/\s\+$//e

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
autocmd BufEnter *.mm setlocal filetype=json
autocmd BufEnter *.smart setlocal filetype=json
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal tabstop=2
autocmd FileType json setlocal shiftwidth=2
autocmd FileType json setlocal tabstop=2

set cino=(0,W4,m1
set cino=N-s

let fortran_free_source=1

set path+=**
set wildmenu
" set wildignore+=*/3rd/*
set wildignore+=*/build/*
set wildignore+=*/doc/*


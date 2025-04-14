syntax on
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set hidden
set relativenumber
filetype off                  " required

" Use ctrl-[jkl;] to navigate split windows
" Does not work because vim cannot capture CTRL+;  :(
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-l> :wincmd h<CR>
"nmap <silent> <c-;> :wincmd l<CR>

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

" Set cursor shapes
let &t_ti = "\e[?1049h \e[2 q" " Set to block on vim open and retain information to restore scrolling buffer on exit
let &t_SI = "\e[5 q" " Set to blinking vertical bar insert mode
let &t_EI = "\e[2 q" " Set to block normal mode

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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'lepture/vim-jinja'
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set smartindent
set shiftwidth=4
set tabstop=4
set wildmenu

" Remove auto continuation of comments
autocmd FileType * set formatoptions-=cro

" Make tab complete on vim command line case sensitive
set nofileignorecase
set nowildignorecase

autocmd FileType make setlocal noexpandtab
autocmd BufEnter *.mm,*.smart,*.ssr,*.chop,*.modl setlocal filetype=json
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal tabstop=2

au BufNewFile,BufRead *.ts set filetype=typescript
autocmd FileType javascript,typescript,coffee setlocal shiftwidth=2
autocmd FileType javascript,typescript,coffee setlocal tabstop=2

au BufNewFile,BufRead *.yaml,*.yml so $HOME/dev/helpers/config/yaml.vim
au BufNewFile,BufRead *.pug so $HOME/dev/helpers/config/pug.vim
au BufNewFile,BufRead *.coffee setlocal filetype=coffee

" let fortran_free_source=1

set path+=**

"autocmd BufWritePre * :%s/\s\+$//e
"match Todo /\s\+$/

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <F6> :!clang-format -i %

" map F1 and F2 for left/right tab navigation
"map <F1> gT
"map <F2> gt

" Enable folding
set foldmethod=syntax
set foldlevel=99

set background=dark
set termguicolors

"colorscheme space-vim-dark
"hi Comment guifg=#5C6370 ctermfg=59
"hi LineNr ctermbg=NONE guibg=NONE

colorscheme dracula
"colorscheme evening
hi Normal ctermbg=NONE guibg=NONE


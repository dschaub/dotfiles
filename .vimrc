set nocompatible

colorscheme jellybeans
set guifont=Monaco:h12

" need this for vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'scrooloose/nerdtree.git'
"Bundle 'kien/ctrlp.vim'
"Bundle 'ervandew/supertab'

filetype plugin indent on

set wildignore+=*/node_modules/*,*.png,.DS_Store,.rspec,Gemfile.lock,*/.bundle/*,*/.git/*,*/.sass-cache/*,*/.tmp/*,*/.gradle/*,*/build/*

" use OS clipboard
set clipboard=unnamed
" better command-line completion
set wildmenu
" optimize for fast terminal connections
set ttyfast
" add g (global) to search/replace by default
set gdefault

set encoding=utf-8 nobomb

let mapleader=","

set backupdir=~/.vim/backups
set directory=~/.vim/swaps

if exists("&undodir")
	set undodir=~/.vim/undo
endif

" let vim settings be set in files
set modeline
set modelines=4

" per-directory vimrc
set exrc
set secure

" line numbers, syntax highlighting
set number
syntax on
set cursorline
set nowrap

" set tab preferences
set tabstop=4
set expandtab
set shiftwidth=4

set hlsearch
set ignorecase
set incsearch

" always show status line
set laststatus=2
set guioptions-=T

" always allow mouse
set mouse=a

set noerrorbells
set visualbell t_vb=

set nostartofline
set ruler
set showmode
set title
set showcmd
set scrolloff=3

" don't show intro message
set shortmess=atI

" strip trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Enable Tab to indent and shift+tab to unindent
inoremap <TAB> <C-T>
inoremap <S-TAB> <C-D>

map <F2> :NERDTreeToggle<CR>

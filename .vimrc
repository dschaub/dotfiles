" Setup vim
" =========

" use vim not vi
set nocompatible

" Plugin config
" =============
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
Plug 'gmarik/Vundle.vim'

" git helpers, mostly useful for :GBlame
Plug 'tpope/vim-fugitive'
" sexy stylish status line
Plug 'itchyny/lightline.vim'
" shows git changes to the left of line numbers
Plug 'airblade/vim-gitgutter'
" semi-useful directory tree via F2
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
" fuzzy search across all files in directory
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
" smart search within all files
Plug 'mileszs/ack.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'janko-m/vim-test'
Plug 'editorconfig/editorconfig-vim'

" Syntax and languages
Plug 'jiangmiao/auto-pairs'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Done configuring plugins
call plug#end()

" Appearance
" ==========
syntax on
syntax enable
set t_Co=256
set noshowmode
colorscheme hybrid_reverse

" General Config
" ==============
let mapleader='\'
set encoding=utf-8 nobomb
" show line numbers
set number
" Allow backspace in insert mode
set backspace=indent,eol,start
" show incomplete commands at bottom
set showcmd
" reload files changed outside of vim
set autoread
" always show status line
set laststatus=2
" open vertical splits to the right
set splitright
" open horizontal splits on the bottom
set splitbelow
" optimize for fast terminal connections
set ttyfast
" disable error bells
set noerrorbells
" disable visual bells
set visualbell t_vb=
" don’t show the intro message when starting Vim
" don't show "ATTENTION" warnings
set shortmess=atIA
" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Centralize backups, swapfiles and undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
silent !mkdir ~/.vim/swaps > /dev/null 2>&1
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


" Mouse Config
" ============
set mouse=a     " Enable mouse in all modes


" Search Settings
" ===============
set incsearch        " Find the next match as we type the search
set ignorecase       " ignore case of searches
set gdefault         " Add the g flag to search/replace by default
set hlsearch         " Highlight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks


" Indentation and Display
" =======================
" We want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nowrap
" Show "invisible" characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

set guifont=Menlo:h12
set cursorline

" Scrolling
" =========
" start scrolling three lines before the horizontal window border
set scrolloff=3

" Completion
" ==========
set wildmode=longest,list,full
set wildmenu                              " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=.DS_Store,*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*/.bundle/*,*/.git/*
set wildignore+=*/.sass-cache/*,*/tmp/*
set wildignore+=*/.tmp/*,*/.gradle/*,*/build/*
set wildignore+=*vim/backups*,argfile*,*/out/*
set wildignore+=*coverage/*

" Plugin config
" =============

" I used to map Ag to Ag! to never open the first result
" Then I switched to ack.vim, but muscle memory is strong
cnoreabbrev Ag Ack!

if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
endif

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" nerdtree
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeShowHidden = 1
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>

" CtrlP
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_working_path_mode = 'a'
" use ag for file listing
let g:ctrlp_user_command = 'ag %s -l --path-to-ignore ~/.ignore --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
let g:ctrlp_extensions = ['tag']
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :CtrlPTag<CR>
" jump to definition
map <silent> <leader>jd :CtrlPTag<cr><C-\>w

" jsx in .js files
let g:jsx_ext_required = 0

" Custom commands
" ===============
" tab navigation like a boss
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>

" faster saving
nnoremap <leader>s :w<CR>

" <Ctrl-n> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-n> :nohl<CR>

" running tests
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

" remain in visual block mode after indent/outdent
vnoremap < <gv
vnoremap > >gv

" automatically strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Custom Formatting by filetype
" =============================
" Ruby
autocmd BufRead,BufNewFile *.rb,*.rake,Rakefile,Gemfile,*.scss,*.jbuilder,*.yml setlocal shiftwidth=2 tabstop=2
autocmd FileType jbuilder setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

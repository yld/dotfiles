set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" > Plugins
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdtree'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'Lokaltog/vim-powerline'
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols='fancy'
set laststatus=2
set t_Co=256
Bundle 'benmills/vimux'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/greplace.vim'
Bundle 'tpope/vim-bundler'
Bundle 'rosenfeld/conque-term'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'chrisbra/vim_faq'
Bundle 'vim-scripts/vimwiki'

" > Syntax
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'zaiste/tmux.vim'
Bundle 'vim-scripts/Puppet-Syntax-Highlighting'
Bundle 'scrooloose/syntastic'

filetype plugin indent on 

" > General
set history=700
set autoread                  " watch for file changes

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

let mapleader = ","
let g:mapleader = ","

" > UI
set so=7
" Show autocomplete menus.
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.rubyc,*.zip,*.xz,*.gz,*bz2,*.bzip2
" show the line number on the bar
set ruler
" use more prompt
set more
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell
" No annoying sound on errors
set noerrorbells
"set t_vb=
"set tm=500

" => Files, backups and undo
set nobackup

compiler ruby                 " Enable compiler support for ruby

"  > searching
" incremental search
set incsearch
" Highlight search results
set hlsearch
set mousehide

" >
syntax on
" Use Unix as the standard file type
set ffs=unix,dos,mac
set encoding=utf-8

" > Text, tab and indent related
set tabstop=2
set shiftwidth=2
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

set smartindent
set autoindent

" gui paste fix (http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"Wrap lines
set wrap

" > Mappings
" Simplify help navigation
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
" nnoremap <buffer> o /'\l\{2,\}'<CR>
" nnoremap <buffer> O ?'\l\{2,\}'<CR>
" nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
" nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
 


" http://amix.dk/vim/vimrc.html
" add gems ctags, see https://github.com/guard/guard-ctags-bundler#readme
set tags+=gems.tags

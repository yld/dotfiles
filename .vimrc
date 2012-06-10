runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen

call pathogen#infect()
call pathogen#helptags()
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
compiler ruby                 " Enable compiler support for ruby

"  searching
set incsearch                 " incremental search

set mousehide

set smartindent
set autoindent

set tabstop=2
set shiftwidth=2
set expandtab

syntax on
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes

set encoding=utf-8

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

set wildmenu

" Bundle: kien/ctrlp.vim
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }
" Bundle: tpope/vim-endwise
" Bundle: tpope/vim-rails
" Bundle: tpope/vim-surround
" Bundle: tpope/vim-commentary
" Bundle: johnbintz/vim-taglist-plus
" Bundle: tpope/vim-cucumber
" Bundle: tpope/vim-repeat
" Bundle: scrooloose/nerdtree
" Bundle: git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex
" Bundle: Lokaltog/vim-powerline
" Bundle: benmills/vimux
" Bundle: zaiste/tmux.vim
" Bundle: tpope/vim-haml
" Bundle: kchmck/vim-coffee-script
" Bundle: tpope/vim-fugitive
" Bundle: vim-scripts/greplace.vim
" Bundle: tpope/vim-bundler
" Bundle: vim-scripts/Puppet-Syntax-Highlighting
" Bundle: plasticboy/vim-markdown
" Bundle: rosenfeld/conque-term

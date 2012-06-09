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

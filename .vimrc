set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" > Plugins
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Tools

" Ruby & ROR
Bundle 'vim-scripts/blockle.vim'
Bundle 'vim-scripts/dbext.vim'
Bundle 'tpope/vim-rails'

Bundle 'kien/ctrlp.vim'
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-repeat'

Bundle 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
let g:NERDChristmasTree = 1
let g:NERDTreeHijackNetrw = 1
map <F7> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Source Forge and Git...
" Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'jcf/vim-latex'
"Bundle 'Lokaltog/vim-powerline'
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols='fancy'
set laststatus=2
set t_Co=256

" https://github.com/Shougo/unite.vim
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
noremap <leader>f :<C-u>Unite -start-insert file<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/asinc:!<CR>
noremap <leader>m :<C-u>Unite file_mru<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>
"let g:unite_candidate_icon = "●"
let g:unite_marked_icon = "▲"

Bundle 'tsukkee/unite-help'
" Execute help.
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>

Bundle 'ujihisa/unite-gem'
Bundle 'chrisbra/csv.vim'
Bundle 'airblade/vim-gitgutter'
nnoremap <F5> :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_diff_args='-w'
let g:gitgutter_escape_grep=1
let g:gitgutter_highlight_lines = 1
let g:airline_powerline_fonts=1
set ttimeoutlen=50

Bundle 'mbbill/undotree'
nnoremap <F6> :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir='/tmp'
  set undofile
endif

Bundle 'bling/vim-airline'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '?'

let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'

let g:airline#extensions#csv#enabled = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#left_sep = '⮀'


Bundle 'ervandew/screen'
let g:ScreenShellTmuxInitArgs = '-2'
Bundle 'benmills/vimux'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/greplace.vim'
Bundle 'tpope/vim-bundler'
Bundle 'rosenfeld/conque-term'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'chrisbra/vim_faq'
Bundle 'vim-scripts/vimwiki'
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
" if the_silver_searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'
Bundle 'rking/ag.vim'
Bundle 'Townk/vim-autoclose'
let g:AutoClosePairs_add = "<> |"

" > Lua
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-ftplugin'

" > Syntax
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'zaiste/tmux.vim'
Bundle 'vim-scripts/Puppet-Syntax-Highlighting'
Bundle 'scrooloose/syntastic'
"let g:syntastic_ruby_checkers = ['mri', 'rubocop']
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on

" > General
set history=700
set autoread                  " watch for file changes

if has("autocmd")
  " Enable filetype detection
  filetype on                   " Enable filetype detection
  filetype indent on            " Enable filetype-specific indenting
  filetype plugin on            " Enable filetype-specific plugins
  "filetype plugin indent on

  " Strip trailing white spaces on save
  autocmd BufWritePre * :%s/\s\+$//e

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" > UI
set so=7
" Show autocomplete menus (zsh like)
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
set hidden
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

" Enable compiler support for ruby
compiler ruby

"  > searching
" incremental search
set incsearch
" Highlight search results
set hlsearch
" tooggle hlsearch
:noremap <F4> :set hlsearch! hlsearch?<CR>
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

" number toggle
nmap <F3> :set invnumber<CR>

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

" add gems ctags, see https://github.com/guard/guard-ctags-bundler#readme
set tags+=gems.tags

" working directory shortcuts
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" tabbar, see :hi for current colors, colortest (in bin)
" :hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
" :hi TabLine ctermfg=Blue ctermbg=Yellow
:hi TabLineSel ctermfg=White ctermbg=214

" folding
" +" set foldmethod=syntax
" +" set foldmethod=indent
" diff options
set diffopt+=iwhite

"autocmd VimLeave * :set term=screen
"set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:airlinetheme = 'solarized'

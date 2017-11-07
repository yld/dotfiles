set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" > Plugins
" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Tools
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'

let g:NERDTreeShowHidden = 1
let g:NERDChristmasTree = 1
let g:NERDTreeHijackNetrw = 1
map <F7> :NERDTreeToggle<CR>

Plugin 'ctrlpvim/ctrlp.vim'

set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }

" theme
Plugin 'altercation/vim-colors-solarized'

" Airline
Plugin 'bling/vim-airline'

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

" javascript, React, EmberJS
Plugin 'pangloss/vim-javascript'
" Node
Plugin 'moll/vim-node'
" JSX support (ReactJS)
Plugin 'mxw/vim-jsx'
"https://github.com/pangloss/vim-javascript/issues/1003
" let g:jsx_ext_required = 0
" Ember
Plugin 'dsawardekar/portkey'
Plugin 'dsawardekar/ember.vim'
Plugin 'alexlafroscia/vim-ember-cli'
Plugin 'joukevandermaas/vim-ember-hbs'

" Ruby & ROR
Plugin 'vim-scripts/blockle.vim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-git'
" <Leader>; or <Leader>,
Plugin 'renderedtext/vim-bdd'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'

" JSON
Plugin 'elzr/vim-json'

" Source Forge and Git...
Plugin 'jcf/vim-latex'

" https://github.com/Shougo/unite.vim
Plugin 'Shougo/vimproc'

Plugin 'chrisbra/csv.vim'
Plugin 'airblade/vim-gitgutter'
nnoremap <F5> :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_diff_args='-w'
let g:gitgutter_escape_grep=1
let g:gitgutter_highlight_lines = 1
let g:airline_powerline_fonts=1
set ttimeoutlen=50

Plugin 'mbbill/undotree'
nnoremap <F6> :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir='/tmp'
  set undofile
endif

Plugin 'ervandew/screen'

let g:ScreenShellTmuxInitArgs = '-2'

Plugin 'benmills/vimux'

map <Leader>vo :VimuxOpenPane<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxInterruptRunner<CR>

Plugin 'jingweno/vimux-zeus'

map <Leader>zs :ZeusStart<CR>
map <Leader>zc :ZeusConsole<CR>
map <Leader>zc :ZeusDestroy<space>
map <Leader>zr :ZeusRake spec<CR>
map <Leader>zg :ZeusGenerate<space>

Plugin 'guns/xterm-color-table.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/greplace.vim'
Plugin 'rosenfeld/conque-term'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'chrisbra/vim_faq'
Plugin 'vim-scripts/vimwiki'
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
" if the_silver_searche
" let g:ackprg = 'ag --nogroup --nocolor --column'
Plugin 'rking/ag.vim'
Plugin 'Townk/vim-autoclose'
let g:AutoClosePairs_add = "<> |"

" > Lua
"Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-lua-ftplugin'

" > BDD/

" > Syntax
Plugin 'w0rp/ale'
let g:ale_lint_on_enter = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '%linter%%s'

let g:ale_ruby_brakeman_options = ' -A'
let g:ale_ruby_reek_show_wiki_link = 1

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\}
let g:ale_ruby_rubocop_options='-a'
let g:ale_fix_on_save = 1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


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
  " autoclose NERDTree when alone
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
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

" Files, backups and undo
set backupdir=~/.vim/backup//
set nobackup

" swap files (broccoli related)
set directory=~/.vim/swp//

" Enable compiler support for ruby
compiler ruby

" searching
" incremental search
set incsearch
" Highlight search results
set hlsearch
" tooggle hlsearch
noremap <F4> :set hlsearch! hlsearch?<CR>
set mousehide

" > files syntax
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
map <leader>ew : %%
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

" > vimdiff options
set diffopt+=iwhite

" > color scheme
"autocmd VimLeave * :set term=screen
"set t_Co=256
" set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:airlinetheme = 'solarized'

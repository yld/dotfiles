set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

set termguicolors

call plug#begin('~/.vim/plugged')
" dispatch
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" REPL/term
Plug 'kassio/neoterm'
Plug 'vimlab/split-term.vim'
" theme
Plug 'icymind/NeoSolarized'
Plug 'tmhedberg/matchit'
" Tim Pope stuff
" cd and so on
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plugin 'tpope/vim-abolish'
" gc, gcap
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
"Plug 'elzr/vim-json', { 'for': 'json'  }
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter', { 'on':  'GitGutterToggle' }
" javascript
Plug 'pangloss/vim-javascript'
" Node
Plug 'moll/vim-node'
" JSX support (ReactJS)
Plug 'mxw/vim-jsx'
" ember
Plug 'alexlafroscia/vim-ember-cli'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Ruby & ROR
" <leader> b
Plug 'jgdavey/vim-blockle'
" Elixir
"Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim'
" Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-git'
" <Leader>; or <Leader>,
Plug 'renderedtext/vim-bdd'
"Plug 'tpope/vim-cucumber'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
Plug 'godlygeek/tabular'
Plug 'Townk/vim-autoclose'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'edkolev/tmuxline.vim'
"
Plug 'sheerun/vim-polyglot'
" Initialize plugin system
call plug#end()

" begin plugins configuration
set bg=dark
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_contrast = "high"
colorscheme NeoSolarized

nmap <F8> :TagbarToggle<CR>

" airline
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

let g:airline#extensions#syntastic#enabled = 0

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

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airlinetheme = 'solarized'

let g:airline#extensions#ale#enabled = 1

" gitgutter
nnoremap <F5> :GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_diff_args='-w'
let g:gitgutter_escape_grep=1
let g:gitgutter_highlight_lines = 1
let g:airline_powerline_fonts=1
set ttimeoutlen=50

" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" undotree
nnoremap <F6> :UndotreeToggle<cr>
if has("persistent_undo")
  set undodir='/tmp'
  set undofile
endif

let g:AutoClosePairs_add = "<> |"

" https://neovim.io/doc/user/nvim.html#nvim-from-vim<Paste>
" terminal settings
if has('nvim')
  " cursor
  highlight TermCursor ctermfg=red guifg=red

  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
  " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

let g:disable_key_mappings = 1

" splits
set splitbelow
set splitright

" ale
let g:ale_lint_on_enter = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '%linter%%s'

let g:ale_ruby_brakeman_options = ' -A'
let g:ale_ruby_reek_show_wiki_link = 1

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint'],
\   'elixir': [''],
\}
let g:ale_ruby_rubocop_options='-a'
let g:ale_fix_on_save = 1

" the silver searcher through Ack command
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" end plugins configuration
set ttimeoutlen=50

"tmux hack
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum


if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
  " filetype on                   " Enable filetype detection
  " filetype indent on            " Enable filetype-specific indenting
  " filetype plugin on            " Enable filetype-specific plugins
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

" general options
set nocompatible
" > UI
set so=7
" Show autocomplete menus (zsh like)
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.rubyc,*.zip,*.xz,*.gz,*bz2,*.bzip2,*.so,*.swp
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



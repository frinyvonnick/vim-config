set nocompatible

call plug#begin("~/.config/nvim/bundle")
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'jelera/vim-javascript-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'heavenshell/vim-jsdoc'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim'

call plug#end()

filetype plugin indent on
syntax on
set showmode
set showcmd
set signcolumn=yes

set encoding=utf8
set fileencoding=utf8
set fileformat=unix
set autoindent
set ts=2

set scrolloff=5

set ruler
set number
set cursorline
set colorcolumn=80

set backspace=indent,eol,start

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

set showmatch  "show matching brackets/parenthesis
set incsearch  "find as you type search
set hlsearch   "highlight search terms
set ignorecase "case insensitive search
set smartcase

set wildmenu  "show list instead of just completing
set wildmode=list:longest,full

set nofoldenable          "no auto fold code
set foldmethod=marker
set foldmarker={,}

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set background=dark

"disable matchit plugin
let loaded_matchit = 1

"mappings
let mapleader = ","

map <C-j> g]
imap jk <Esc>
nmap <leader>s :syntax sync fromStart<CR>

colorscheme NeoSolarized

"PLUGINS
"CtrlP
map <c-b> :CtrlPBuffer<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_depth=1000
let g:ctrlp_max_files=100000

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*,*/node_modules/*     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(.git|web|cache|vendor|node_modules|lib|tmp|bin|var|test|docs|build|_site|Proxy|assets)$',
  \ }


let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"tern
let g:tern_map_keys=1
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:tern_request_timeout = 1

"jsDoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
au BufRead,BufNewFile *.js nnoremap <buffer> <leader>p :JsDoc<CR>

"emmet
au BufRead,BufNewFile *.html,*.css,*.twig map <buffer> <leader>e <c-y>,

" Allow netrw to remove non-empty local directories
"
let g:netrw_localrmdir='rm -r'


let g:ale_kotlin_kotlinc_options = '-jvm-target 1.8'
let g:gitgutter_enabled = 1
let g:gitgutter_override_sign_column_highlight = 0

" Map ESC in TERMINAL MODE
:tnoremap <Esc> <C-\><C-n>

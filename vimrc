" Disable Vi compatibility to enable more powerful vim features
set nocompatible

""""""""""""
"  VUNDLE  "
""""""""""""

" Temporarily disable filetype detection - required for vundle
filetype off

" Include vundle in the runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Initialise vundle to install plugins to ~/.vim/bundle
call vundle#begin('~/.vim/bundle')

" Let vundle manage itself (required)
Plugin 'gmarik/Vundle.vim'

" Files & Buffers
"-----------------
Plugin 'kien/ctrlp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bogado/file-line'
Plugin 'rking/ag.vim'
Plugin 'PhilGrayson/php-explorer'

" Syntax
"--------
Plugin 'scrooloose/syntastic'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'groenewege/vim-less'
Plugin 'rodjek/vim-puppet'

" Utilities
"-----------
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'MarcWeber/vim-addon-mw-utils' " Required for vim-snipmate
Plugin 'tomtom/tlib_vim' " Required for vim-snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bkad/CamelCaseMotion'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'

" Git integration
"-----------------
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" UI / styling
"--------------
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'

" End vundle
call vundle#end()



""""""""""""
"  CONFIG  "
""""""""""""


" Indentation
"-------------

" Tabs = 4 spaces
set tabstop=4
" Delete 4 spaces with backspace
set softtabstop=4
" Use 4 spaces for (auto)indentation
set shiftwidth=4
" Convert tabs to spaces
set expandtab
" Automatically indent new lines to match the one above
set autoindent
" Make backspace work properly (e.g. traverse line breaks)
set backspace=indent,eol,start


" Search
"--------

" Highlight all matches for a search term
set hlsearch
" Make search case-insensitive
set ignorecase
" Search as you type
set incsearch


" Syntax
"--------

" Turn on syntax highlighting
syntax on
" Enable filetype specific plugins and auto indentation
filetype plugin indent on
" Display whitespace
set list
" Highlight tabs and trailing spaces
set listchars=tab:\|·,trail:`
" BufExplorer has a bug that sets list off. This fixes it
autocmd BufEnter,BufNew,BufRead,BufNewFile * set list
" Set the colour for highlighted stuff
highlight SpecialKey ctermfg=darkgreen
" Remove trailing spaces when saving a buffer
autocmd BufWritePre * :%s/\s\+$//e
" Use htmljinja plugin to syntax highlight both HTML and twig in .twig files
au BufRead,BufNewFile *.twig set filetype=htmljinja
" When a bracket is inserted, briefly jump to the matching one
set showmatch
" Extended % matching (if/else, XML tags, etc as well as standard brackets)
runtime macros/matchit.vim


" Key mapping
"-------------

" Hide search highlighting with \/
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" Disable arrow keys (except in insert mode) - use h,j,k,l
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Shortcut for Tabularize
map <F2> :Tabularize /
" Toggle paste mode on/off with F3
set pastetoggle=<F3>
" Map PHP Explorer GoTo to F4
map <F4> \gt
" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Command-T muscle memory for CtrlP
nmap <Leader>t <C-p>


" UI / styling
"--------------

" Use 256 colours for colorschemes
set t_Co=256
" Use molokai colorscheme
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai
" Use luna theme rather than molokai for vim-airline
let g:airline_theme='luna'
" Automatically change the screen title
set title
" Show line numbers
set number
" Show the current cursor position in the status line
set ruler
" Always show the status line
set laststatus=2
" Keep the cursor vertically centered, where possible
set scrolloff=999
" Draw a vertical line at 120 characters
highlight ColorColumn ctermbg=DarkGrey
set colorcolumn=120
" CtrlP match window settings (order top-to-bottom, max height 999 lines)
let g:ctrlp_match_window='order:ttb,max:999'


" Other
"-------

" Set persistent undo (so undo history is saved even when buffers are closed)
set undodir=~/.vim-undo
set undofile

" Show possible completions in command mode with <TAB>
set wildmenu
" List all possible completions, completing to the longest common string
" first, and then each full match on subsequent presses of <TAB>
set wildmode=list:longest,full

" Hide (rather than close) abandoned buffers, to preserve undos and remember unsaved changes
set hidden

" Ignore matching paths in CtrlP searches
let g:ctrlp_custom_ignore='build/'
" Remove the limit on number of files for CtrlP to scan
let g:ctrlp_max_files=0
" Open new files created by CtrlP in the current window
let g:ctrlp_open_new_file='r'
" Open multiple files opened by CtrlP as hidden buffers
let g:ctrlp_open_multiple_files='i'

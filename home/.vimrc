set nocompatible  " Use Vim settings, rather then Vi settings

"" Vundle
filetype off      " required for vundle
set rtp+=~/.vim/bundle/vundle.vim
call vundle#rc()

" let Vundle manage Vundle, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'gmarik/vundle'
Plugin 'ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary.git'
Plugin 'skalnik/vim-vroom'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-bundler'
Plugin 'sickill/vim-monokai'
Plugin 'mrtazz/molokai.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'johnallen3d/vim-colorschemes'
Plugin 'juvenn/mustache.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'benmills/vimux'
" end vundle

set t_Co=256
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set showmode      " show the current mode
set laststatus=2  " Always display the status line
set nowrap        " set nowrap
set scrolloff=3

set hlsearch      " Highlight searches
set incsearch     " do incremental searching
set ignorecase    " Ignore case of searches

set number        " show line numbers
" set rnu         " relative line numbers

set shell=bash

syntax on
syntax enable

set background=dark
colorscheme solarized

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Display extra whitespace etc.
set list                          " Show invisible characters

set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
"It's easier to press Space than / for searching:
nmap <Space> /
nmap <C-Space> ?
nmap </> /\v

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap K i<CR><Esc>

" Disable error bells
set noerrorbells
set visualbell

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" <,> is the leader character
let mapleader = ","

" No Help, please
nmap <F1> <Esc>
" -----------------------------------------------------------------
" custom crap
"------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'
filetype plugin indent on
" ctrl p crap
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|tags$\|\.ds_store$|\.swp$'
let g:ctrlp_dotfiles = 0

" Quickly hide search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
map <c-a> ggVG
set colorcolumn=80
" Window navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
set t_ti= t_te=
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

filetype plugin indent on
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType asciidoc setlocal textwidth=78
  autocmd FileType asciidoc setlocal spell

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" code folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent         "fold based on indent
set foldnestmax=10            "deepest fold is 10 levels
set nofoldenable              "don't fold by default
set foldlevel=1               "need to play around with this setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" xiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nothing here yet
"
set encoding=utf8
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

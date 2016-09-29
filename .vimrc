
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
"Plugin 'gmarik/vundle'


"Plugin 'fisadev/vim-debug.vim'
"Plugin 'motemen/git-vim'
"Plugin 'mhinz/vim-signify'
"Plugin 'scrooloose/syntastic'
"Plugin 'buffer-status-menu.vim'
"Plugin 'ctags.vim'
"Plugin 'cscope.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" scripts not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
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
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
highlight CursorColumn cterm=NONE ctermbg=24

set nobackup
set nonumber
set background=dark
syntax on   " syntax highlighting

set expandtab           " enter spaces when tab is pressed
set textwidth=0       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set backspace=indent,eol,start
set ruler               " show line and column number
set showcmd             " show (partial) command in status lineime.sleep(1)
set paste


" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>


" change tab
map <S-H> gT
map <S-L> gt

" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :echo expand('%:p')<CR>
nnoremap <F4> :marks<CR>


"enable keypad by PuTTY
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OQ /
inoremap <Esc>OR *
inoremap <Esc>Ol +
inoremap <Esc>OS -

map <PageUp> <C-u>
map <PageDown> <C-d>
imap <PageUp> <C-o><C-u>
imap <PageDown> <C-o><C-d>

set laststatus=2            "laststatus: show the line below
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&fileencoding},  "encoding
set statusline+=%{&fileformat}]%m           "file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

syntax on
set nu

" save as sudo
ca w!! w !sudo tee "%"
hi SpecialKey ctermbg=red ctermfg=red guibg=red guifg=red
set bg=dark

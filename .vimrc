set nocompatible

" Copied from vundle example
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" from github
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-rails'
Bundle 'nono/vim-handlebars'
Bundle 'majutsushi/tagbar'
Bundle 'mozilla/doctorjs'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'wookiehangover/jshint.vim'
Bundle 'wincent/Command-T'
Bundle 'kchmck/vim-coffee-script'
Bundle 'yearofmoo/Vim-Darkmate'

Bundle 'heartsentwined/vim-emblem'

" from vim-scripts"
Bundle 'bufexplorer.zip'
Bundle 'JSON.vim'

syntax on
filetype plugin indent on

":colorscheme vibrantink
:colorscheme darkmate

" Change jshint error styles
hi clear SpellBad
hi SpellBad ctermbg=red

" Change command-t highlighted item styels
hi clear Pmenusel
hi Pmenusel ctermbg=red

" Most of these settings were take from here. Take a look if you need some
" reference
"    http://www.brankovukelic.com/post/2091037293/turn-vim-into-powerful-javascript-editor
"

"FileType
set filetype=on
filetype plugin on
filetype indent on

"Set gui font
set guifont=Monaco\ 14

"Show line number
set number
set hidden

"Change color of line number
highlight LineNr ctermfg=grey

"Highlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Focus NERDTree explorer based on current file
map <leader>r :NERDTreeFind<cr>

"map NERDTreeToggle to ctrl+n
nmap <silent> <c-n> :NERDTreeToggle<CR>

"map MAKE to F4
nmap <F4> :w<CR>:make<CR>:cw<CR>

"map Tabbar to F8
nmap <F8> :TagbarToggle<CR>

" Easier window navigation
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Refresh command-t cache
map <leader>f :CommandTFlush<CR>

" for testing out different themes
map <silent> <F3> :NEXTCOLOR<cr>
map <silent> <F2> :PREVCOLOR<cr>

"Highlight cursor
"highlight CursorLine ctermbg=8 cterm=NONE

"Incremental search
set incsearch

set ai
set ts=2
set sts=2
set et
set sw=2

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=2
autocmd FileType python set ts=2
autocmd FileType python set sts=2
autocmd FileType python set textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
" JavaScript (tab width 4 chr, wrap at 79th)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79

" Treat JSON files as javascript
au! BufRead,BufNewFile *.json set filetype=javascript 

" Tread some extra file types as ruby lang
au! BufRead,BufNewFile *.rabl set filetype=ruby

" Tell Command-T to ignore these files
:set wildignore+=tmp/**

set backupdir=~/tmp
set directory=~/tmp


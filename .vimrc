set nocompatible
syntax on
filetype plugin indent on
:helptags ~/.vim/doc
:colorscheme vibrantink
":colorscheme nazca

" Most of these settings were take from here. Take a look if you need some
" reference
"    http://www.brankovukelic.com/post/2091037293/turn-vim-into-powerful-javascript-editor
"
"Map NERDTree to \p
"nmap <silent> <Leader>p :NERDTreeToggle<CR>
"
" 2: :put the following in your .vimrc
    "if $COLORTERM == 'gnome-terminal'
    "    set term=gnome-256color
   "     colorscheme railscasts
  "  else
 "       colorscheme default
"   endif

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

" Start up NERDTree but don't focus
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"map NERDTreeToggle to ctrl+n
nmap <silent> <c-n> :NERDTreeToggle<CR>

"map MAKE to F4
nmap <F4> :w<CR>:make<CR>:cw<CR>

"map Tabbar to F8
nmap <F8> :TagbarToggle<CR>

"map :W to :w since it happens all the time by mistake!
cmap W w
cmap WQ wq

"map FuzzyFinder to \t
nmap <silent> <c-t> :FuzzyFinderTextMate<CR>

" This is needed for pathogen
call pathogen#infect()

"Highlight cursor
"highlight CursorLine ctermbg=8 cterm=NONE

"Incremental search
set incsearch

set ai
set ts=4
set sts=4
set et
set sw=4
set textwidth=79

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set textwidth=79
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

set backupdir=~/tmp
set directory=~/tmp


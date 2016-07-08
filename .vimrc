set nocompatible

" Copied from vundle example
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

call vundle#begin()
"call vundle#rc()

" from github
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-rails'
Plugin 'nono/vim-handlebars'
Plugin 'majutsushi/tagbar'
Plugin 'mozilla/doctorjs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/Command-T'
Plugin 'kchmck/vim-coffee-script'
Plugin 'yearofmoo/Vim-Darkmate'
Plugin 'mileszs/ack.vim'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'heartsentwined/vim-emblem'
Plugin 'myhere/vim-nodejs-complete'
"Plugin 'marijnh/tern_for_vim'
Plugin 'szw/vim-tags'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'thoughtbot/vim-rspec'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'flazz/vim-colorschemes'

" Requires cd ~/.vim/bundle/vim-jsbeautify && git submodule update --init --recursive
Plugin 'maksimr/vim-jsbeautify'

" Requires compiling after vundle install
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'JSON.vim'

call  vundle#end()
syntax on
filetype plugin indent on

":colorscheme vibrantink
":colorscheme darkmate
":colorscheme wombat256mod
":colorscheme zenburn
:colorscheme inkpot
":colorscheme molokai

" Change jshint error styles
hi clear SpellBad
hi SpellBad ctermbg=red

" Change command-t highlighted item styles
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

set t_Co=256

"Change color of line number
highlight LineNr ctermfg=grey

"Highlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Set the leader key to comma
let mapleader = ","

" Unmap help, since it happens a lot!
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" Focus NERDTree explorer based on current file
map <leader>r :NERDTreeFind<cr>

"map NERDTreeToggle to ctrl+n
nmap <silent> <c-n> :NERDTreeToggle<CR>

"map MAKE to F4
"nmap <F4> :w<CR>:make<CR>:cw<CR>

"map Tabbar to F8
nmap <F8> :TagbarToggle<CR>

" elm-vim: Disable auto mappings
let g:elm_setup_keybindings = 0

" RSpec.vim mappings
let g:rspec_command = "!spring rspec {spec}"

map <Leader>s <esc>:w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>S <esc>:w<cr>:call RunNearestSpec()<CR>
map <Leader>l <esc>:w<cr>:call RunLastSpec()<CR>
map <Leader>a <esc>:w<cr>:call RunAllSpecs()<CR>

" BufExplorer should show relative paths by default
let g:bufExplorerShowRelativePath=1 
"let g:bufExplorerShowDirectories=0 

" Treat JS as JSX files
let g:jsx_ext_required = 0

" Easier window navigation
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Ctrl+S for saving
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>

" Rebuild tags

" Index ctags from any project, including those outside Rails
function! ReindexCtags()
  "let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'
  "if exists(l:ctags_hook)
  "  exec '!'. l:ctags_hook
  "else
  exec "!ctags ."
  "endif
endfunction

nmap <Leader>ct :call ReindexCtags()<CR>

" Refresh command-t cache
map <leader>f :CommandTFlush<CR>

" for testing out different themes
map <silent> <F3> :NEXTCOLOR<cr>
map <silent> <F2> :PREVCOLOR<cr>

"Highlight cursor
"highlight CursorLine ctermbg=8 cterm=NONE

autocmd BufEnter * set completeopt-=preview

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
"autocmd FileType javascript set sw=2
"autocmd FileType javascript set ts=2
"autocmd FileType javascript set sts=2
"autocmd FileType javascript set textwidth=79

" EJS files are just html files
au BufNewFile,BufRead *.ejs set filetype=html

" Treat JSON files as javascript
au! BufRead,BufNewFile *.json set filetype=javascript 

" Tread some extra file types as ruby lang
au! BufRead,BufNewFile *.rabl set filetype=ruby

" Tell Command-T to ignore these files
:set wildignore+=tmp/**,client/node_modules/**,node_modules/**,bower_components/**,dist/**,public/**,_build/**,deps/**

set clipboard=unnamed

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

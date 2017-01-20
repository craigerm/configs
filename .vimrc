set nocompatible

" Copied from vundle example
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

if !has('nvim')
  set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
endif

""TODO: Get powerline working with neovim
"set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" We rely on this for now
" npm install -g git+https://github.com/ramitos/jsctags.git

call vundle#begin()

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
Plugin 'ternjs/tern_for_vim'
Plugin 'szw/vim-tags'
Plugin 'mxw/vim-jsx'
" Hmm which one to use?
"Plugin 'pangloss/vim-javascript'
Plugin 'othree/es.next.syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'thoughtbot/vim-rspec'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CycleColor'
Plugin 'maxbane/vim-asm_ca65'
Plugin 'cohama/lexima.vim'
Plugin 'vim-scripts/closetag.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'othree/html5.vim'
"Plugin 'ryanoasis/vim-devicons'

" Other colors
Plugin 'mhartington/oceanic-next'
Plugin 'jimmyhchan/dustjs'

" Requires cd ~/.vim/bundle/vim-jsbeautify && git submodule update --init --recursive
Plugin 'maksimr/vim-jsbeautify'

" Requires compiling after vundle install
Plugin 'jlanzarotta/bufexplorer'
Plugin 'JSON.vim'

if has('nvim')
  "Plugin 'vim-airline/vim-airline'
  Plugin 'neomake/neomake'
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'carlitux/deoplete-ternjs'
  Plugin 'ervandew/supertab'
  " Deocomplete sources
  Plugin 'awetzel/elixir.nvim'
  Plugin 'fishbullet/deoplete-ruby'
else
  Plugin 'Valloric/YouCompleteMe'
end

call  vundle#end()

syntax enable
filetype plugin indent on

if has('nvim')
  let g:deoplete#enable_at_startup = 1

  " Configure tern
  let g:tern#command = ["tern"]
  let g:tern_show_signature_in_pum = 1
  let g:tern_request_timeout = 3
  let g:tern#arguments = ["--persistent"]

  " TAB in completion window goes from top to bottom
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set t_Co=256
endif

" For vim 8/nvim
if (has("termguicolors"))
  set termguicolors
endif

" This could be useful: http://vimawesome.com/plugin/colorswatch-vim
":colorscheme vibrantik
":colorscheme darkmate
":colorscheme wombat256mod
":colorscheme zenburn
":colorscheme molokai
":colorscheme inkpot_new
":colorscheme lucid
:colorscheme wombat256mod

" Change jshint error styles
hi clear SpellBad
hi SpellBad ctermbg=red

" Change command-t highlighted item styles
"hi clear Pmenusel
"hi Pmenusel ctermbg=red

"FileType
set filetype=on
filetype plugin on
filetype indent on

"Set gui font
set guifont=Monaco\ 14

"Show line number + relative lines
set relativenumber
set number
set hidden
set numberwidth=2

"Change color of line number
highlight LineNr ctermfg=grey

if has('nvim')
  " Run neokmake on every write
  autocmd! BufWritePost * Neomake
endif

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

"map Tabbar to F8
nmap <F8> :TagbarToggle<CR>

" Clipboard
map <C-c> "+y
map <leader>p "+p
map <leader>P "+P

" Generic goto tags (similar to tern commands below but used tags)
nmap <F5> <C-]>
nmap <leader>g <C-]>

" Poor man's find all references in file with quickfix window
nmap <leader>e :let @/=expand("<cword>")<CR>:vim // %<CR>:copen<CR>
nmap <leader>E <leader>e<CR> " So this works for all files

" Quick fix open (better open and close)
autocmd FileType qf nmap o <CR>
autocmd FileType qf nnoremap <buffer> O <CR>:copen<CR>
autocmd FileType qf nnoremap <buffer> t <CR>:cclose<CR>

" Tern mappings
autocmd FileType javascript nmap <F5> :TernDef<CR>
autocmd FileType javascript nmap <F2> :TernRename<CR>
autocmd FileType javascript nmap <leader>g :TernDef<CR>
autocmd FileType javascript nmap <leader>e :TernRefs<CR>
autocmd FileType javascript nmap <leader>h :TernType<CR>

" neomake
nmap <leader><space>o :lopen<CR> " open location window
nmap <leader><space>c :lclose<CR> " close location window
nmap <leader><space>, :ll<CR> " go to current error/warning
nmap <leader><space>n :lnext<CR> " go to next error/warning
nmap <leader><space>p :lprev<CR> " go to prev error/warning

" Clears search
nmap <leader><space><space> :noh

" elm-vim: Disable auto mappings
let g:elm_setup_keybindings = 0

" RSpec.vim mappings
let g:rspec_command = "!spring rspec {spec}"

" Misc vim system color overrides
hi clear Directory
hi clear EndOfBuffer
hi Directory ctermfg=173 guifg=#e5786d
hi EndOfBuffer ctermfg=248 ctermbg=232

" Neomake color config
hi clear SignColumn
hi clear NeomakeWarningDefault
hi clear NeomakeErrorSign
hi clear NeomakeErrorSignDefault
hi clear NeomakeError

hi SignColumn ctermfg=248 ctermbg=232 guifg=#857b6f guibg=#080808 " Matches line number from theme"
hi NeomakeWarning ctermfg=11 ctermbg=232 guibg=#080808 cterm=bold guifg=Yellow
hi NeomakeError ctermfg=Blue ctermbg=Green guifg=#CC0000 guibg=#080808

let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_error = {'texthl': 'NeomakeError'}
let g:neomake_warning_sign = { 'text': "⚠", 'texthl': 'NeomakeWarning' }

" MISC
let g:closetag_html_style=1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:netrw_browsex_viewer = 1

" RSpec
map <Leader>s <esc>:w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>S <esc>:w<cr>:call RunNearestSpec()<CR>
map <Leader>l <esc>:w<cr>:call RunLastSpec()<CR>
map <Leader>a <esc>:w<cr>:call RunAllSpecs()<CR>

" BufExplorer should show relative paths by default
let g:bufExplorerShowRelativePath=1

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

" Rebuild tags (not sure what we should use here exactly)
function! ReindexCtags()
  let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'
  if exists(l:ctags_hook)
    exec '!'. l:ctags_hook
  else
    exec "!ctags ."
  endif
  "find . -type f -iregex ".*\.js$" \
  "  -not -path "./release/*" \
  "  -not -path "./build/*" \
  "  -not -path "./node_modules/*" \
  "  -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
endfunction

nmap <Leader>ct :call ReindexCtags()<CR>

" Refresh command-t cache
map <leader>f :CommandTFlush<CR>

" Cancel search - remove highlighting
nmap <leader>n :noh<CR>

"Highlight cursor
"highlight CursorLine ctermbg=8 cterm=NONE

autocmd BufEnter * set completeopt-=preview

" Smart casing for searching
set ignorecase
set smartcase

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
au BufNewFile,BufRead *.dust set filetype=html

au BufNewFile,BufRead *.asm, set ft=asm_ca65

" Treat JSON files as javascript
au! BufRead,BufNewFile *.json set filetype=javascript

" Tread some extra file types as ruby lang
au! BufRead,BufNewFile *.rabl set filetype=ruby

" Highlight end of line whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Tell Command-T to ignore these files
:set wildignore+=tmp/**,client/node_modules/**,node_modules/**,bower_components/**,dist/**,public/**,_build/**,deps/**

set clipboard=unnamed

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set nocompatible

" Copied from vundle example
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

if !has('nvim')
  set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
endif

""TODO: Get powerline working with neovim
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

call vundle#begin()

" Old plugings (keep around for legacy projects as needed)
"Plugin 'digitaltoad/vim-jade'
"Plugin 'lukaszkorecki/CoffeeTags'
"Plugin 'heartsentwined/vim-emblem'

" from github
Plugin 'gmarik/vundle'
Plugin 'nono/vim-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-rails'
Plugin 'majutsushi/tagbar'
Plugin 'mozilla/doctorjs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'yearofmoo/Vim-Darkmate'
Plugin 'mileszs/ack.vim'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'ternjs/tern_for_vim'
Plugin 'szw/vim-tags'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-projectionist'
Plugin 'c-brenn/phoenix.vim'
Plugin 'vim-scripts/php.vim-html-enhanced' " Better PHP indenting

" Hmm which one to use?
Plugin 'othree/yajs.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'thoughtbot/vim-rspec'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'lambdatoast/elm.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/CycleColor'
Plugin 'maxbane/vim-asm_ca65'

" Auto closing strings, etc.
Plugin 'cohama/lexima.vim'
Plugin 'vim-scripts/closetag.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'othree/html5.vim'
Plugin 'junegunn/gv.vim'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'vim-maximizer'
Plugin 'slashmili/alchemist.vim' " Elixir integration
Plugin 'sbdchd/neoformat' " Code formatter
"Plugin 'ryanoasis/vim-devicons'

" Other colors
Plugin 'mhartington/oceanic-next'
Plugin 'jimmyhchan/dustjs'
Plugin 'hexchain/vim-openresty'

" Requires cd ~/.vim/bundle/vim-jsbeautify && git submodule update --init --recursive
Plugin 'maksimr/vim-jsbeautify'

" Requires compiling after vundle install
Plugin 'junegunn/fzf' " ./install --all
Plugin 'junegunn/fzf.vim'
"Plugin 'jlanzarotta/bufexplorer'
Plugin 'JSON.vim'
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'jparise/vim-graphql'

" Typescript
"Plugin 'peitalin/vim-jsx-typescript'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'mhartington/nvim-typescript'
"Plugin 'HerringtonDarkholme/yats.vim'
"Plugin 'Quramy/tsuquyomi'

" Styled components
"Plugin 'styled-components/vim-styled-components'

if has('nvim')
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'neomake/neomake'
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'pbogut/deoplete-elm'
  Plugin 'carlitux/deoplete-ternjs'
  Plugin 'ervandew/supertab'
  " Deocomplete sources
  Plugin 'awetzel/elixir.nvim'
  Plugin 'fishbullet/deoplete-ruby'
  Plugin 'osyo-manga/vim-monster'
else
  Plugin 'Valloric/YouCompleteMe'
end

call  vundle#end()

syntax enable
filetype plugin indent on

let g:gutentags_cache_dir = '~/.tags_cache'

if has('nvim')
  let g:deoplete#enable_at_startup = 1

  set encoding=utf-8

  " Configure tern
  let g:tern#command = ["tern"]
  let g:tern_show_signature_in_pum = 1
  let g:tern_request_timeout = 3
  let g:tern#arguments = ["--persistent"]

  " Ruby completion (https://github.com/osyo-manga/vim-monster)
  let g:monster#completion#rcodetools#backend = "async_rct_complete"
  let g:deoplete#sources#omni#input_patterns = {
  \    "ruby" : '[^. *\t]\.\w*\|\h\w*::',
  \}

  " TAB in completion window goes from top to bottom
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  set guicursor=
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

" Configure neovim markers
"let g:neomake_elixir_enabled_makers = ['mix', 'credo']
let g:neomake_elixir_enabled_makers = []

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

" Easier embedded terminal navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Generic goto tags (similar to tern commands below but used tags)
nmap <F5> <C-]>
nmap <leader>g <C-]>

" Seach project for word under cursor
nmap <F9> :Ack<cword><CR>

" Poor man's find all references in file with quickfix window
"nmap <leader>e :let @/=expand("<cword>")<CR>:vim // %<CR>:copen<CR>
"nmap <leader>E <leader>e<CR> " So this works for all files

" Quick fix open (better open and close)
autocmd FileType qf nnoremap <buffer> o <CR>
autocmd FileType qf nnoremap <buffer> O <CR>:copen<CR>:noh<CR>
autocmd FileType qf nnoremap <buffer> t <CR>:cclose<CR>:noh<CR>

" Tern mappings
autocmd FileType javascript nmap <F5> :TernDef<CR>
autocmd FileType javascript nmap <F2> :TernRename<CR>
autocmd FileType javascript nmap <leader>g :TernDef<CR>
"autocmd FileType javascript nmap <leader>e :TernRefs<CR>
autocmd FileType javascript nmap <leader>h :TernType<CR>

" neomake
nmap <leader><space>o :lopen<CR> " open location window
nmap <leader><space>c :lclose<CR> " close location window
nmap <leader><space>, :ll<CR> " go to current error/warning
nmap <leader><space>n :lnext<CR> " go to next error/warning
nmap <leader><space>p :lprev<CR> " go to prev error/warning

" FZF
let g:fzf_layout = { 'down': '100%' }
let g:fzf_nvim_statusline = 0
nmap <leader>t :FZF<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>e :BLines<CR>
nmap <leader>d :Lines<CR>

" FZF extra key bindings
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-r': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-f': 'e'}

" F12 acts as enter. Hacky
"imap <F12> <CR>

" Windows (:only command might be useful)
nmap <silent><leader>w :MaximizerToggle<CR>

" Git stuff
"nmap <F1> :Git! diff --color \| diff-so-fancy<CR>:AnsiEsc<CR>
nmap <F1> :Git! diff<CR>
nmap <leader><F1> :Git! diff --cached<CR>
"nmap <leader><F1> :Git! diff --color \| diff-so-fancy<CR>
"nmap <leader>m :Gstatus<CR>:MaximizerToggle<CR>
nmap <leader>m :Gstatus<CR>

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
"map <Leader>s <esc>:w<cr>:call RunCurrentSpecFile()<CR>
"map <Leader>S <esc>:w<cr>:call RunNearestSpec()<CR>
"map <Leader>l <esc>:w<cr>:call RunLastSpec()<CR>
"map <Leader>a <esc>:w<cr>:call RunAllSpecs()<CR>

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

" Searches matching file names (not working correctly in qf)
nmap <F10> :Ack -g <cword><CR>

" Searching all files in project
nmap <F9> :Ack<cword><CR>

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

" Cancel search - remove highlighting
nmap <leader>n :noh<CR>

"Highlight cursor
"highlight CursorLine ctermbg=8 cterm=NONE

autocmd BufEnter * set completeopt-=preview

" Smart casing for searching
set ignorecase
set smartcase
set nohlsearch
"nnoremap <F3> :set hlsearch!<CR> " TOGGLE SEARCH

"Incremental search
set incsearch

set ai
set ts=2
set sts=2
set et
set sw=2

"if has("autocmd")
"  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif

" HTML (tab width 2 chr, no wrapping)
"autocmd FileType html set sw=2
"autocmd FileType html set ts=2
"autocmd FileType html set sts=2
"autocmd FileType html set textwidth=0
"" Python (tab width 4 chr, wrap at 79th char)
"autocmd FileType python set sw=2
"autocmd FileType python set ts=2
"autocmd FileType python set sts=2
"autocmd FileType python set textwidth=0
"" CSS (tab width 2 chr, wrap at 79th char)
"autocmd FileType css set sw=2
"autocmd FileType css set ts=2
"autocmd FileType css set sts=2
"autocmd FileType css set textwidth=79


" JavaScript (tab width 4 chr, wrap at 79th)
"autocmd FileType javascript set sw=2
"autocmd FileType javascript set ts=2
"autocmd FileType javascript set sts=2
"autocmd FileType javascript set textwidth=79

" EJS files are just html files
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.dust set filetype=html

au BufNewFile,BufRead *.asm, set ft=asm_ca65

au BufNewFile,BufRead *.phtml set filetype=php
au BufNewFile,BufRead elm-package.json set filetype=elm

autocmd FileType php set sw=2
autocmd FileType php set ts=2
autocmd FileType php set sts=2
autocmd FileType phtml set sw=2
autocmd FileType phtml set ts=2
autocmd FileType phtml set sts=2

autocmd FileType elm set sw=4
autocmd FileType elm set ts=4
autocmd FileType elm set sts=4

" Treat JSON files as javascript
au! BufRead,BufNewFile *.json set filetype=javascript

" Tread some extra file types as ruby lang
au! BufRead,BufNewFile *.rabl set filetype=ruby

" Highlight end of line whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

set clipboard=unnamed
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

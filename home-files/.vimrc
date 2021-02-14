set nocompatible
set filetype=on

filetype plugin on
filetype indent on

" Set the leader key to comma
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " Needed for nerdtree highlighter
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'stephenway/postcss.vim'
"Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'keith/rspec.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'iamcco/coc-tailwindcss'
"Plug 'styled-components/vim-styled-components'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'vim-test/vim-test'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

"" Snippets
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

"Plug 'jiangmiao/auto-pairs' " Allow changing strings, etc.
Plug 'andys8/vim-elm-syntax'
Plug 'elmcast/elm-vim' " Only used for manually elm-format
Plug 'mustache/vim-mustache-handlebars'

" Dart and flutter specific
Plug 'dart-lang/dart-vim-plugin'
Plug 'iamcco/coc-flutter'

" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
"Plug 'dracula/vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show statusline
set laststatus=2

" Packs
set packpath=~/.vim
packadd! dracula_pro

syntax enable
filetype plugin indent on
set encoding=utf-8

" TAB in completion window goes from top to bottom
"let g:SuperTabDefaultCompletionType = "<c-n>"
set guicursor=

" For vim 8/nvim
if (has("termguicolors"))
  set termguicolors
endif

" Change jshint error styles
hi clear SpellBad
hi SpellBad ctermbg=red

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme = 'codedark'
"let spc = ' '
"let g:airline_section_c = airline#section#create(['%<', 'file', spc, 'readonly', ''])
""let g:airline_section_c = airline#section#create(['%<', 'file', spc, 'readonly', 'coc_status'])
"let g:airline_section_x = ''
""let g:airline_section_y = ''
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"
" Any colour settings, even if specific to a plugin
" should be placed here.
""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monaco\ 14
set background=dark

" Make sure to install dracula pro locally (since of course not in .git)
"let g:dracula_colorterm = 0

" NOTE Copy "vim" folder from "dracula.zip" ~/.vim/pack/themes/opt/dracula_pro

"colorscheme dracula_pro_buffy
"colorscheme dracula_pro_morbius
"colorscheme dracula_pro_blade
"colorscheme dracula_pro_van_helsing
"colorscheme dracula
colorscheme dracula_pro

" Misc vim system color overrides
"hi clear Directory
"hi clear EndOfBuffer
"hi Directory ctermfg=173 guifg=#e5786d
"hi EndOfBuffer ctermfg=248 ctermbg=232

"Change color of line number
"highlight LineNr ctermfg=grey

"hi default CocErrorFloat ctermfg=White

" Random colours
let s:pinkish = "ffa3a3"
let s:lightPurple = "d899ff"
let s:red = "f31037"
let s:rubyColour = s:red

" Nerdtree colours
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['rb'] = s:rubyColour
let g:NERDTreeExtensionHighlightColor['sh'] = s:lightPurple

"" FZF colours
"let g:fzf_colors = {
"  \ 'fg': ['fg', 'Normal'],
"  \ 'bg': ['bg', 'Normal']
"  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber
set number
set hidden
set numberwidth=2



""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc config
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install extensions
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-pairs',
      \ 'coc-eslint',
      \ 'coc-solargraph',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-flutter'
      \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

"set updatetime=1500 "300
set updatetime=4000 "300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Tab and shift+tab for navigating autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Cmd + space to show autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" Shift + space to show autocomplete
noremap <silent><expr> <S-tab> coc#refresh()
noremap <silent><expr> <C-b> coc#refresh()

"
" CocList Mappings
"

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"inoremap <C-s> <esc>:w<cr>a

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>g <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F12> <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')



" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

  " Terminal window, exit insert mode (To enable scrolling)
  tmap <C-o> <C-\><C-n>

endif

" A hack for now, so we can force close any floating windows
nmap <F7>call coc#float#close_all()<CR>

" So coc-css recognizes scss variables
autocmd FileType scss setl iskeyword+=@-@
autocmd FileType scss setl iskeyword+=$-$

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc-Flutter  + Dart config
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:dart_format_on_save = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc-Snippets (and related snippet plugins) config
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim test config
""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>c :TestNearest<cr>
map <leader>l :TestLast<cr>
map <leader>L :TestFile<cr>
map <leader>m :TestSuite<cr>
map <leader>v :TestVisit<cr>

" For scrolling, but not really part of vim-test
"if has('nvim')
"  "tmap <C-o> <C-\><C-n>
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree config
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Focus NERDTree explorer based on current file
map <leader>r :NERDTreeFind<cr>

" Toggle explorer
nmap <silent> <c-n> :NERDTreeToggle<CR>

" Focus explorer based on current file
map <leader>r :NERDTreeFind<cr>

let g:NERDTreeFileExtensionHighlightFullName = 1
let NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1

" Remove arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF (Fuzzy finder)
""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

let g:fzf_layout = { 'down': '100%' }
let g:fzf_nvim_statusline = 0

nmap <leader>t :FZF<CR>
nmap <leader>b :Buffers<CR>

 " Let's try this out for a bit
nmap <leader>q :Buffers<CR>
nmap <leader>a :FZF<CR>
nmap <leader>f :FZF<CR>
nmap <leader>s :Buffers<CR>
nmap <leader>e :BLines<CR>
nmap <leader>d :Lines<CR>

" FZF extra key bindings
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-r': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-f': 'e'}

nmap <F9> :Ag<CR>

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:36%'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive config (Git)
""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <F1> :Git! diff --color \| diff-so-fancy<CR>:AnsiEsc<CR>
"nmap <F1> :Git! diff<CR>
"nmap <leader><F1> :Git! diff --cached<CR>
"nmap <leader><F1> :Git! diff --color \| diff-so-fancy<CR>
"nmap <leader>m :Gstatus<CR>:MaximizerToggle<CR>
"nmap <leader>m :Gstatus<CR>
"
nmap <F1> :Gdiff<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc.
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_html_style=1 "????
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:netrw_browsex_viewer = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin global settings
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat JS as JSX files
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic Vim bindings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Clipboard
map <C-c> "+y
map <leader>p "+p
map <leader>P "+P

" Unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" Unmap help, since it happens a lot!
imap <F1> <nop>

" Easier window navigation
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Ctrl+S for saving
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>

" Cancel search - remove highlighting
nmap <leader>n :noh<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom tool bindings
""""""""""""""""""""""""""""""""""""""""""""""""""
" WIP

""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic config
""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart casing for searching
set ignorecase
set smartcase
set nohlsearch

"Incremental search
set incsearch

" Spaces
set ai
set ts=2
set sts=2
set et
set sw=2


""""""""""""""""""""""""""""""""""""""""""""""""""
" File and buffer config
""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Don't open the preview window when entering a buffer
autocmd BufEnter * set completeopt-=preview

autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.asm, set ft=asm_ca65
autocmd BufNewFile,BufRead elm-package.json set filetype=elm
autocmd BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.typescript.css
autocmd BufNewFile,BufRead *.css setlocal filetype=less.postcss
autocmd BufNewFile,BufRead *.rb setlocal filetype=ruby

autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType php set sw=2
autocmd FileType php set ts=2
autocmd FileType php set sts=2
autocmd FileType phtml set sw=2
autocmd FileType phtml set ts=2
autocmd FileType phtml set sts=2
autocmd FileType elm set sw=4
autocmd FileType elm set ts=4
autocmd FileType elm set sts=4

" Highlight end of line whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

set clipboard=unnamed
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

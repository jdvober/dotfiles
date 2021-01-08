" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
" Plug install packages
"*****************************************************************************
" Need to have pynvim installed to use.  Please see :help provider-python for details.  Also, running :checkhealth will be useful if you run into problems.
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsEditSplit="tabdo"

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='mupdf'
    let g:vimtex_quickfix_mode=0

" A Vim Plugin for Lively Previewing LaTeX PDF Output.  Change "updatetime"
" option for the time it takes to render.
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
let g:livepreview_previewer = 'evince'


Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'asvetliakov/vim-easymotion'
Plug 'honza/vim-snippets'

" Terminal-only plugins
Plug 'scrooloose/nerdcommenter'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'
Plug 'xolox/vim-session'

call plug#end()
" Required
filetype plugin indent on

"*****************************************************************************
" Basic Setup
"*****************************************************************************
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


" Fix backspace indent
set backspace=indent,eol,start

" Fix copy/paste?
set clipboard+=unnamedplus

" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=4
set expandtab
" Show vertical tab indent guides (manual, no plugin)
" set list lcs=tab:\|\

" Map leader to ,
" let mapleader=','
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Time for CursorHold, and how long it take for live TeX to update.
set updatetime=250

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_autoload = "no"
" If the PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


" Set python3 location
let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/bin/python3"


"*****************************************************************************
" Key Remap
"*****************************************************************************
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
inoremap jj <Esc>
" used for moving one space in insert mode
inoremap qh <C-o>h
inoremap qj <C-o>j
inoremap qk <C-o>k
inoremap ql <C-o>l
" used for breaking out of brackets
inoremap qa <Esc>la

"*****************************************************************************
"*****************************************************************************
"*****************************************************************************
"
" Terminal Only Settings (Not run in VSCode)
"
"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

if !exists('g:vscode')
set ruler
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END


colorscheme dracula

"*****************************************************************************
" Vim Airline
"*****************************************************************************
let g:airline_theme='bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"*****************************************************************************
" GUI Options
"*****************************************************************************
set mousemodel=popup
set t_Co=256
set guioptions=egmrti

"*****************************************************************************
" Nerd Commenter
"*****************************************************************************

" [count]<leader>cs |NERDCommenterSexy| // Comments out the selected lines with a pretty block formatted layout.

" [count]<leader>cu |NERDCommenterUncomment| // Uncomments the selected line(s).


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"*****************************************************************************
" Whichkey
"*****************************************************************************
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" How long a pause there is after a space before menu appears.  Also affects
" jj keybinding.
set timeoutlen=250
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" The next step is to add items to g:which_key_map:



" Define prefix dictionary
let g:which_key_map =  {}

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"
" Mappings to hide from top level menu.  If you decide to rebind these, you
" must delete from this list:
let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map.j = 'which_key_ignore'
let g:which_key_map.k = 'which_key_ignore'
"
" Note:
" Some complicated ex-cmd may not work as expected since they'll be feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ '3' : ['b3'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete']   ,
      \ 'f' : ['bfirst'    , 'first']    ,
      \ 'h' : ['Startify'  , 'home']     ,
      \ 'a' : ['blast'     , 'last']     ,
      \ 'n' : ['bnext'     , 'next']     ,
      \ 'p' : ['bprevious' , 'previous'] ,
      \ 'l' : ['buffers' , 'list'] ,
      \ 'r' : [':source %' , 'refresh'] ,
      \ }

let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ 'h' : ['split'        , 'split horizontal']        ,
      \ 'v' : ['vsplit'        , 'split vertical']        ,
      \ 'c' : ['wq'        , 'close']        ,
      \ }

let g:which_key_map.t = {
      \ 'name' : '+tab' ,
      \ 'n' : ['tabnext'        , 'next']        ,
      \ 'p' : ['tabprevious'        , 'previous']        ,
      \ 'c' : ['tabclose'        , 'close']        ,
      \ 'l' : ['tabs'        , 'list']        ,
      \ }

let g:which_key_map.f = {
      \ 'name' : '+file' ,
      \ 'o' : ['Tex'        , 'open file in new tab']        ,
      \ }


let g:which_key_map.l = {
      \ 'name' : '+LaTeX' ,
      \ 'b' : ['vimtex-compile'        , 'build']        ,
      \ 'v' : ['vimtex-view'        , 'view']        ,
      \ 'l' : ['LLPStartPreview'        , 'view live']        ,
      \ 'r' : ['vimtex-reload'        , 'reload']        ,
      \ 'k' : ['vimtex-stop'        , 'stop']        ,
      \ 'i' : ['vimtex-info'        , 'info']        ,
      \ 's' : ['vimtex-compile-selected'        , 'compile selected']        ,
      \ 'e' : ['vimtex-errors'        , 'errors']        ,
      \ 'o' : ['vimtex-log'        , 'log']        ,
      \ }

let g:which_key_map.c = {
      \ 'name' : '+comment' ,
      \ 's' : ['Tex'        , 'open file in new tab']        ,
      \ }

"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

" END OF TERMINAL ONLY SETTINGS
endif

"*****************************************************************************
"*****************************************************************************
"*****************************************************************************

"*****************************************************************************
" Abbreviations
"*****************************************************************************
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

set mouse=a
map <LeftMouse> <NOP>
map <RightMouse> <NOP>

" Remaping Pgup Pgdn
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <Esc> :noh<CR><Esc>
nnoremap <CR> :noh<CR><CR>

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif


"*****************************************************************************
" On-the-fly spelling correction
"*****************************************************************************
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

